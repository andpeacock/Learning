require_relative 'address_entry'

book = Array.new

#This reads file
File.open('book.txt') do |f|
  count = f.gets.chop.to_i
  count.times do
    book << AddressEntry.new(f.gets.delete("\n"), f.gets.delete("\n"))
  end
end

=begin
#Check file size
File.open('book.txt') do |r|
  $count = r.readlines.size/2
  r.close
end
=end

#This prints entries
def List(book)
  book.each_index do |entry|
    puts "#{entry}: #{book[entry].name} -- #{book[entry].address}"
  end
end

#HELLO

#MAIN
List(book)
