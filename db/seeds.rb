users = JSON.parse(File.read("db/users.json"), symbolize_names: true)

users.each do |user|
  User.create!(
    name: user[:name]
  )
end
