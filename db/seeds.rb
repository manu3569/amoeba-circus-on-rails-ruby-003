# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w(acrobat contortionist clown juggler freak).each do |name|
  Talent.create(name: name)
end

Talent.find_by(name: 'juggler').amoebas.create(name: "Brian", generation: 1)
Talent.find_by(name: 'acrobat').amoebas.create(name: "Adam", generation: 5)
Talent.find_by(name: 'clown').amoebas.create(name: "Clarence", generation: 3)
Talent.find_by(name: 'contortionist').amoebas.create(name: "Conrad", generation: 1)
Talent.find_by(name: 'freak').amoebas.create(name: "Frank", generation: 4)
