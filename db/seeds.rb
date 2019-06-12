# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


counts = Dir['./db/book_pics/*.*'].length

counts.times do |count|
  book = Book.new({ isbn: ([*('A'..'Z'),*('0'..'9')]-%w(0 1 I O)).sample(20).join, 
                    title: "book #{count+1}", 
                    author: "auther #{count+1}",
                    description: 'book'
                  })
  book.logo = File.open("./db/book_pics/book#{count+1}.jpg")
  book.save!
  puts "creating book#{count+1}..."
end