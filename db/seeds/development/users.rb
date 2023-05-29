10.times do |n|
  name = "user#{n}"
  email = "#{name}@example.com"

  # 一意性バリデーションを回避するため
  user = User.find_or_initialize_by(email: email, activated: true)

  if user.new_record?
    user.name = name
    user.password = "password"
    user.save!
  end
end

puts "users = #{User.count}"