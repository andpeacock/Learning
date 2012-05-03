require_relative 'address_entry'

$book = Array.new
cs = {
  'list' => -> {List()},
  'exit' => -> {Exit()}
}

#This reads file
File.open('book.txt') do |f|
  count = f.gets.chop.to_i
  count.times do
    $book << AddressEntry.new(f.gets.delete("\n"), f.gets.delete("\n"))
  end
end

def List
  $book.each_index do |entry|
    puts "#{entry}: #{$book[entry].name} -- #{$book[entry].address}"
  end
end

def Exit
  Process.exit
end

#MAIN
b = 1
begin
  print "Command?: "
  com = gets.chop
  cs[com].call
end until b == 0
