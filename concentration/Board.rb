#SLOPPY AS FUCK
require_relative 'Card'

class Board
  
  attr_reader :board
  
  def initialize
    @board = Hash.new(0)
    used_nums = Hash.new(0)
    for i in (0..3)
	for j in (0..3)
	  randnum = rand(8).to_i + 1
	  if used_nums.has_key?(randnum) and used_nums[randnum] != 2
	    @board[[i,j]] = Card.new(randnum)
	  else
	    used_nums[randnum] = used_nums[randnum] + 1
	  end
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
