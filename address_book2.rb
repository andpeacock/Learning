require_relative 'address_entry'

class AddressBook
  COMMANDS = %w[add remove list write search help exit]
  $book = Array.new
  
  def initialize
    File.open('book.txt', 'r') do |f|
      count = f.gets.chop.to_i
      count.times do
	$book << AddressEntry.new(f.gets.delete("\n"), f.gets.delete("\n"))
      end
    end
  end

  def add(*)
    print "Enter full name: "
    name = gets.chop
    print "Enter address: "
    addr = gets.chop
    
    $book.each do |entry|
      if entry.name == name
	puts "A contact with that name already exists in your address book!"
	return
      end
    end
    
    $book << AddressEntry.new(name, addr)
    puts "Contact added successfully!"
  end

  def remove(name, *)
    unless !name.nil? # unless they entered a name
      print "Enter full name: "
      name = gets.chop
    end
      $book.each_index do |entry|
      if $book[entry].name.eql?(name)
	$book.delete_at(entry)
      break
      end
    end
    puts "Removed #{name}."
  end

  def list(*)
    $book.each_index do |entry|
      puts "#{entry}: #{$book[entry].name}"
    end
  end
  
  def search(name, *)
    unless !name.nil?
      print "Who should we look for?: "
      name = gets.chop.to_s
    end
    $book.each do |entry| 
      if entry.name.include?(name) 
	puts "#{entry.name}"
	puts "#{entry.address}"
       end
    end
  end

  def exit(*)
    Process.exit
  end

  def write(*)
    File.open('book.txt', 'w') do |f|
      f.puts $book.size
      $book.each do |entry|
	f.puts entry.name
	f.puts entry.address
      end
    end
    puts "Saved Address Book Successfully!"
  end
  
  def valid_command?(command)
    COMMANDS.include?(command.to_s)
  end
  
  def defined_commands
    COMMANDS
  end
  
  def help(*)
    puts "add    - add a contact"
    puts "remove - remove a contact (argument = name)"
    puts "list   - list all of your contacts"
    puts "write  - save your address book"
    puts "search - search for a contact (argument = name)"
    puts "exit   - close your address book"
  end
end


address_book = AddressBook.new

puts "=== ADDRESS BOOK ==="
puts "    (for nerds)     "

while true
  print "Command?: "
  input_command = gets.split(" ")
  func = input_command.first.to_sym
  input_command << nil
  if address_book.valid_command?(func)
    address_book.send(func, input_command[1])
  else
    puts "No command by that name, try: #{address_book.defined_commands.join(', ')}" 
  end
    
end
