# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

p "Loading books..."

User.create({email: 'admin@labibliotecalibre.cl', password: 'biblioalgo'}) unless User.find_by_email('admin@labibliotecalibre.cl').present?

csv_file = Rails.root.join('db', 'seed', 'BL2.csv')
CSV.foreach(csv_file, headers: true, return_headers: false, encoding: 'UTF-8') do |row|
  book = row.to_hash
  p book
  book.delete('n')

  #TODO: Update attributes

  new_book = Book.find_or_initialize_by_code(book)
  new_book.save
  
  #old_book = Book.find_by_code(book.code)
  #if old_book
  #	old_book.update_attributes(book)
  #else
end

p "Books loaded =)"
