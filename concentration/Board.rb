#SLOPPY AS FUCK
require_relative 'Card'

class Board
  
  attr_reader :board
  
  def initialize
    @board = Hash.new(0)
    for i in (0..3)
	for j in (0..3)
	  @board[[i,j]] = Card.new(rand(8).to_i+1)
	end
    end
  end
  def card_at(p1, p2)
    @board[[p1,p2]]
  end  
  def to_s
    disp = ""
    (0...4).each do |i|
      (0...4).each do |j|
	 disp += "#{@board[[i,j]].display}" 
      end
      puts
    end
    disp
  end
end
