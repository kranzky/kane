#!/usr/bin/env rails runner

posts = []
Dir["slack/link-of-the-day/*.json"].each do |filename|
  JSON.parse(File.read(filename)).each do |post|
    next if post["subtype"].present?
    next if post["text"] !~ /<http/
    reactions = []
    if post["reactions"].present?
      post["reactions"].each do |reaction|
        reaction["users"].each do |user|
          reactions << {
            user: user,
            name: reaction["name"]
          }
        end
      end
    end
    posts << {
      user: post["user"],
      date: File.basename(filename, '.json'),
      url: post["text"].strip[1..-1],
      reactions: reactions
    }
  end
end

users = {}
JSON.parse(File.read("slack/users.json")).each do |user|
  next unless posts.any? { |post| post[:user] == user["id"] }
  users[user["id"]] = {
    name: user["name"],
    profile: {
      name: user["real_name"]
    },
    settings: {
      timezone: user["tz"]
    }
  }
end

posts.each do |post|
  post[:user] = users[post[:user]][:name]
  post[:reactions].each do |reaction|
    reaction[:user] = users[reaction[:user]][:name]
  end
end

File.open("db/users.json", "w") do |file|
  file.write(JSON.pretty_generate(users.values))
end

File.open("db/posts.json", "w") do |file|
  file.write(JSON.pretty_generate(posts))
end
