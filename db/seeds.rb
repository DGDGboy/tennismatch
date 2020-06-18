# require 'open-uri'
# require 'nokogiri'

Match.destroy_all
Request.destroy_all
User.destroy_all

# url = "https://www.eurosport.fr/tennis/atp/standing.shtml"

classement = ["NC", "40", "30/5", "30/4", "30/3", "30/2", "30/1", "30", "15/5", "15/4", "15/3", "15/2", "15/1", "15", "5/6", "4/6", "3/6", "2/6", "1/6", "0", "-2/6", "-4/6", "-15", "-30"]

novak = User.create!(first_name: "Novak", last_name: "Djokovic", address: "Serbie", gender: "Men", email: "novak@atp.com", password: "secret", level: classement.shuffle.first, description: "Prise: Droitier (2 mains)", photo: "https://res.cloudinary.com/dhtapshlv/image/upload/v1592421797/Novak_Djokovic_64_srhdni.jpg")
nadal = User.create!(first_name: "Rafael", last_name: "Nadal", address: "Espagne", gender: "Men", email: "rafael@atp.com", password: "secret", level: classement.shuffle.first, description: "Prise: Gaucher (2 mains)",  photo: "https://res.cloudinary.com/dhtapshlv/image/upload/v1592421832/Rafael_Nadal_100_rauek2.jpg")
dominic = User.create!(first_name: "Dominic", last_name: "Thiem", address: "Autriche", gender: "Men", email: "dominic@atp.com", password: "secret", level: classement.shuffle.first, description: "Prise: Droitier (1 main)", photo: "https://res.cloudinary.com/dhtapshlv/image/upload/v1592421861/Dominic_Thiem_85_w3icfr.jpg")
federer = User.create!(first_name: "Roger", last_name: "Federer", address: "Suisse", gender: "Men", email: "roger@atp.com", password: "secret", level: classement.shuffle.first, description: "Prise: Droitier (1 main)", photo: "https://res.cloudinary.com/dhtapshlv/image/upload/v1592421896/Roger_Federer_73_uqnvux.jpg")

times = ["10", "18", "20", "21", "14"]
cities = ["Paris", "London", "Prague", "Barcelone", "Madrid", "Lisbon", "Budapest"]

10.times do
  request = Request.new
  request.user = [novak, nadal, federer, dominic].shuffle.first
  request.date = Date.today+rand(100)
  request.time = times.shuffle.first
  request.location = cities.shuffle.first
  request.save
end

m1 = Match.new
m1.request = Request.first
m1.user = User.last
m1.save

m2 = Match.new
m2.request = Request.last
m2.user = User.last
m2.save


# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)
# result = []
# # photo = search('.player img')[0].attributes["data-isg-lazy"].value
# # country = search('.country img')[0].attributes["title"].value

# html_doc.search('.standing-table__player-link')[0..10].each do |element|
#   result << [element.search('.text').children.text, element.search('.player img')[0].attributes["data-isg-lazy"].value, element.search('.country img')[0].attributes["title"].value ]
# end

# result.each do |player|
#   User.create!(first_name: player[0], photo: player[1], address: player[2], gender: "Men", email: "#{player[0].downcase.gsub(" ", "_")}@gmail.com", password: "secret", level: classement.shuffle.first)
# end

# req1 = Request.new

# req1.user = User.first
# date = Date.new(2020, 6, 27)
# req1.date = date
# req1.time = "20"
# req1.location = "Paris"
# req1.save

# req2 = Request.new

# req2.user = User.first
# date = Date.new(2020, 6, 30)
# req2.date = date
# req2.time = "10"
# req2.location = "London"
# req2.save

# req3 = Request.new

# req3.user = User.last
# date = Date.new(2020, 7, 30)
# req3.date = date
# req3.time = "8"
# req3.location = "Budapest"
# req3.save

# req4 = Request.new

# req4.user = User.last
# date = Date.new(2020, 7, 12)
# req4.date = date
# req4.time = "20"
# req4.location = "Bordeaux"
# req4.save
# req5 = Request.new

# req5 = Request.new

# req5.user = User.first
# date = Date.new(2020, 6, 30)
# req5.date = date
# req5.time = "10"
# req5.location = "London"
# req5.save

# req6 = Request.new

# req6.user = User.first
# date = Date.new(2020, 6, 30)
# req6.date = date
# req6.time = "10"
# req6.location = "London"
# req6.save

# m1 = Match.new
# m1.request = req1
# m1.user = User.last
# m1.save

# m2 = Match.new
# m2.request = req2
# m2.user = User.last
# m2.save
