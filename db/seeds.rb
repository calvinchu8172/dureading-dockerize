# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


book_counts = Dir['./db/book_pics/*.*'].length
book_counts.times do |count|
  book = Book.new({ isbn: ([*('A'..'Z'),*('0'..'9')]-%w(0 1 I O)).sample(20).join, 
                    title: "book #{count+1}", 
                    author: "auther #{count+1}",
                    description: 'book'
                  })
  book.logo = File.open("./db/book_pics/book#{count+1}.jpg")
  book.save!
  puts "creating book#{count+1}..."
end

user_books_counts = 19
user_books_counts.times do |count|
  user_book = UserBook.new({  user_id: 1, 
                              book_id: count+1, 
                          })
  user_book.save!
  puts "creating user_book#{count+1}..."
end

comment_counts = Dir['./db/comment_pics/*.*'].length
comment_counts.times do |count|
  comment = Comment.new({ book_id: 1, 
                          user_id: 1, 
                          content: "GOOD!!!"
                        })
  comment.photo = File.open("./db/comment_pics/comment#{count+1}.jpg")
  comment.save!
  puts "creating comment#{count+1}..."
end