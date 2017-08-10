Comment.destroy_all
Picture.destroy_all
User.destroy_all

user = User.create!(first_name: 'Jon', email: 'admin@admin.com',
                  password: 'secretsecret', password_confirmation: 'secretsecret')

user2 = User.create(first_name: 'Deanerys', email: 'test@test.com',
                     password: 'secretsecret', password_confirmation: 'secretsecret')

user3 = User.create(first_name: 'Mary', email: 'mary@test.com',
                     password: 'secretsecret', password_confirmation: 'secretsecret')
20.times do
  Picture.create(file: File.new("#{Rails.root}/app/assets/images/picture#{rand(1..5)}.jpeg"),
                 description: 'Fancy description', user: user)
end

Comment.create(picture: Picture.first, user: user2, content: 'Nice shot!')
Comment.create(picture: Picture.first, user: user3, content: 'WOOOW')


puts 'Done!'