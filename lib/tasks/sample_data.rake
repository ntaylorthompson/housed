namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
#    make_shows
  end
end

def make_users
  admin = User.create!(name:     "Taylor Thompson",
                       email:    "n.taylor.thompson@gmail.com",
                       password: "password",
                       password_confirmation: "password")
  admin.toggle!(:admin)
  10.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_shows
  users = User.all(limit: 5)
  5.times do
    content = 
    users.each { |user| user.microposts.create!(content: content) }
  end
end