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