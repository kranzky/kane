users = JSON.parse(File.read("db/users.json"), symbolize_names: true)

users.each do |data|
  user = User.find_or_create_by!(name: data[:name])
  if data[:profile].present?
    Profile.create!(user: user, name: data[:profile][:name])
  end
  if data[:account].present?
    Account.create!(user: user, timezone: data[:account][:timezone])
  end
end
