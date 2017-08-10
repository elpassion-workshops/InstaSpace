Picture.destroy_all
User.destroy_all

  user = User.create!(first_name: 'Jon', email: 'admin@admin.com',
                    password: 'secretsecret', password_confirmation: 'secretsecret')


20.times do
  Picture.create(file: File.new("#{Rails.root}/app/assets/images/picture#{rand(1..5)}.jpeg"),
                 description: 'Fancy description', user: user)
end

puts 'Done!'