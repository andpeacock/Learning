class Store
  attr_reader :name
  def initialize(sales, name)
    @sales = sales
    @name = name
  end
  def sales
    @sales/100
  end
end

s1 = Array.new
(0..4).each do |i|
  s1 << Store.new(gets.to_i, gets.chomp)
end
(0..4).each do |i|
  print"#{s1[i].name}: "
  s1[i].sales.times do |s|
    print "* "
  end
  puts
end