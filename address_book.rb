require_relative 'address_entry'
$book = Array.new
cs = Hash.new(0)
cs = {
  'list' => -> {List()},
  'exit' => -> {Exit()},
  'add' => ->{Add()},
  'remove' => ->{Remove()},
  'write' => ->{Write()},
  'search' => ->{Search()}
}

#This reads file
File.open('book.txt', 'r') do |f|
  count = f.gets.chop.to_i
  count.times do
    $book << AddressEntry.new(f.gets.delete("\n"), f.gets.delete("\n"))
  end
end

def Add
  print "Enter your full name: "
  name = gets.chop
  print "Enter your adddress: "
  addr = gets.chop
  $book << AddressEntry.new(name, addr)
end

def Remove
  print "Full Name: "
  name = gets.chop
  $book.each_index do |entry|
    if($book[entry].name.eql?(name))
      $book.delete_at(entry)
    end
  end
end

def List
  $book.each_index do |entry|
    puts "#{entry}: #{$book[entry].name}"
  end
end

def Write
  File.open('book.txt', 'w') do |f|
    f.puts $book.size
    $book.each do |entry|
      f.puts entry.name
      f.puts entry.address
    end
  end
	puts "Saved Address Book Successfully!"
end

def Search
  print "Please enter index: "
  ind = gets.chop.to_i
  puts "#{$book[ind].name}\n#{$book[ind].address}"
end

def Exit
  Process.exit
end

#MAIN
while true
  print "Command?: "
  com = gets.chop.downcase
  if !cs.has_key?(com)
    puts "Invalid command"
  else  
    cs[com].call
  end
end