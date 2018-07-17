User.find_or_create_by(first_name: 'Steven', last_name: 'Hart', email: 'steven.hart@industryprime.com', admin: true) do |user|
  user.password = "password"
end
