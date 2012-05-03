var = Array.new
puts "Please enter three numbers ranging from 1 to 9"
for i in 0..2
   var[i] = gets.to_i
end
x3 = var[0]**3
y3 = var[1]**3
z3 = var[2]**3
r = (x3+(y3/y3))+(x3+(z3/z3))
puts "The result of the equation (x^3 + y^3/y^3)+(x^3 + z^3/z^3) is: #{r}"