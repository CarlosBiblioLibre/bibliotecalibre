# encoding: utf-8

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
end

p "Books loaded =)"

p "Loading 8va findings"

csv_file = Rails.root.join('db', 'seed', '8va2.csv')
CSV.foreach(csv_file, headers: true, return_headers: false, encoding: 'UTF-8') do |row|
  row_hash = row.to_hash
  book = {}
  ['title', 'code', 'author', 'genre'].each do |key|
    book[key.to_sym] = row_hash[key]
  end

  finding = {}
  ['email', 'username'].each do |key|
    finding[key.to_sym] = row_hash[key]
  end
  finding[:location] = "(-33.443411, -70.647870)"
  finding[:how] = "En una liberación"

  new_book = Book.find_or_initialize_by_code(book)
  new_book.save

  # TODO: No crear findings repetidos al hacer 2 veces este script
  #       ver los findings del libro y revisar las locations y compararlas con 
  #       el location de mas arriba
  finding[:book_id] = new_book.id
  new_finding = Finding.new(finding)
  new_finding.save

  p "*"*20
  p new_book
  p new_finding
end

p "8va findings loaded"
