if Rails.env.development? && User.count == 0
  User.create(username: "admin", email: "admin@example.com", role: "admin", password: "devpassword")
  User.create(username: "user", email: "user@example.com", role: "member", password: "devpassword")
  User.all.each(&:confirm!)
end
