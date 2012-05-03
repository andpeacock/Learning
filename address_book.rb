require_relative 'address_entry'

book = Array.new
#hash = Hash.new
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

commands = {
  1 => ->(p1,p2) {...},
  2 => ->(p1,p2) {...},
  3 => ->(p1,p2) {...},
}


#MAIN
b = 1
begin
  print "Command?: "
  com = gets.chop.to_i
  hash[com]
  
  #if (com.casecmp('list') == 0)
    #List(book)
  #elsif (com.casecmp('exit') == 0)
    #b = 0
  #end
end until b == 0

=begin
while b != 0 do
  print "Command?: "
  com = gets.chop
  #if com.eql?('list')
  if (com.casecmp('list') == 0)
    List(book)
  #elsif com.eql?('exit')
  elsif (com.casecmp('exit') == 0)
    b = 0
  end
end
=end
