users = JSON.parse(File.read("db/users.json"), symbolize_names: true)

users.each do |data|
  user = User.create!(name: data[:name])
  if data[:profile].present?
    Profile.create!(user: user, name: data[:profile][:name])
  end
  if data[:account].present?
    Account.create!(user: user, timezone: data[:account][:timezone])
  end
end

posts = JSON.parse(File.read("db/posts.json"), symbolize_names: true)

posts.each do |data|
  user = User.find_by(name: data[:user])
  post = Post.create!(user: user, url: data[:url], posted_at: data[:date])
  data[:reactions].each do |reaction|
    user = User.find_by(name: reaction[:user])
    Statistic.create!(user: user, post: post, reaction: reaction[:name])
  end
end
