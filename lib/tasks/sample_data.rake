namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    [User].each(&:delete_all)
    make_admin
    
    User.populate 100 do |person|
      person.name    = Faker::Name.name
      person.email   = Faker::Internet.email    
      person.active = [true,false]
      person.musician = [true,false]
    
      Location.populate 1 do |location|
        location.user_id = person.id
        location.address = Faker::Address.zip_code
        location.latitude =  Faker::Address.latitude
        location.longitude =  Faker::Address.longitude
      end
      
      if person.musician == true
        person.travel_radius = [10,25,50,100]
        person.style = Populator.words(1..3).titleize
        Show.populate 1..25 do |show|
          show.user_id = person.id
          show.date = 4.weeks.ago..6.months.from_now
          show.web_string = (0...8).map{65.+(rand(25)).chr}.join
          show.ticket_price = [10, 15]
          show.tickets_min = [20,30]
          show.tickets_max = [50, 75]
          show.public = [0,0,1]
          show.tickets_sold = 0
          show.time = Time.now
          Location.populate 1 do |location|
            location.show_id = show.id
            location.address = Faker::Address.zip_code
            location.latitude =  Faker::Address.latitude
            location.longitude =  Faker::Address.longitude
          end
          Host.populate 1 do |host|
            host.show_id = show.id
            host.email   = Faker::Internet.email    
          end
        end
            
          
        Availability.populate 0..4 do |availability|
          availability.user_id = person.id
          availability.travel_radius = [25,50,100]
          availability.start = 1.month.from_now..12.months.from_now
          availability.end = availability.start + rand(17).days
          Location.populate 1 do |location|
            location.availability_id = availability.id
            location.address = Faker::Address.zip_code
            location.latitude =  Faker::Address.latitude
            location.longitude =  Faker::Address.longitude
          end
        end
      end 
    end
  end
end













def make_admin
  admin = User.create!(name:     "Taylor Thompson",
                       email:    "n.taylor.thompson@gmail.com",
                       password: "password",
                       password_confirmation: "password")
  admin.toggle!(:admin)
  admin.toggle!(:active)
  admin.build_location(address: "02141")
  admin.save
  
  daniel = User.create!(name:     "Daniel Levi Goans",
                       email:    "daniellevigoans@gmail.com",
                       password: "password",
                       password_confirmation: "password", 
                       mp3_1_url:'<iframe width="46" height="23" style="position: relative; width: 46px; height: 23px;" src="http://bandcamp.com/EmbeddedPlayer/v=2/track=4124094065/size=short/bgcol=FFFFFF/linkcol=4285BB/" allowtransparency="true" frameborder="0"><a href="http://music.daniellevigoans.com/track/heights-so-high">Heights So High by Daniel Levi Goans</a></iframe>',
                       mp3_1_url:'<iframe width="46" height="23" style="position: relative; width: 46px; height: 23px;" src="http://bandcamp.com/EmbeddedPlayer/v=2/track=2851766590/size=short/bgcol=FFFFFF/linkcol=4285BB/" allowtransparency="true" frameborder="0"><a href="http://music.daniellevigoans.com/track/mary-land">Mary-land by Daniel Levi Goans</a></iframe>',
                       header: 'http://cache0.bigcartel.com/theme_images/2303295/daniel_levi___lauren_goans_header.jpg')
  daniel.toggle!(:active)
  daniel.build_location(address: "27408")
  daniel.save
    
  default = Admin.create!(cost_percentage: 0.1, 
                          max_travel_radius: 6000,
                          default_fan_travel_radius: 3000)
end