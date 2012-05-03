require_relative 'Card'
require_relative 'Board'

b = Board.new


while true
  system 'clear'
  puts b
  #gets
  #b.shuffle
  #TEST
  x1 = gets.to_i
  y1 = gets.to_i
  x2 = gets.to_i
  y2 = gets.to_i
  if b.card_at(x1,y1).value.eql?(b.card_at(x2,y2).value)
    b.card_at(x1,y1).turn_over
    b.card_at(x2,y2).turn_over
    system 'clear'
    puts b
    #break
  end
end
