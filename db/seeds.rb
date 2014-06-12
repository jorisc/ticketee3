# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


if !User.first
    p "creating temp user"
    u = User.create(name: "joris", password: "admin", email: "info@u-map.eu", admin: true) #new pw umap 
end