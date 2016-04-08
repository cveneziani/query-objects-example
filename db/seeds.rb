# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# # Part 1 - Without Label
# Artist.destroy_all

# Artist.create!(name: "Opeth",           genre: "Metal",       available: true)
# Artist.create!(name: "Iron Maiden",     genre: "Metal",       available: true)
# Artist.create!(name: "Daft Punk",       genre: "Electronics", available: true)
# Artist.create!(name: "Britney Spears",  genre: "Pop",         available: false)






















# Part 2 - With Label
Label.destroy_all
Artist.destroy_all

awesome   = Label.create!(name: "Awesome Records")
flawless  = Label.create!(name: "Flawless-R")

Artist.create!(name: "Opeth",           genre: "Metal",       available: true,  label: awesome)
Artist.create!(name: "Iron Maiden",     genre: "Metal",       available: true,  label: awesome)
Artist.create!(name: "Daft Punk",       genre: "Electronics", available: true,  label: flawless)
Artist.create!(name: "Britney Spears",  genre: "Pop",         available: false, label: flawless)
