class Calculator
  def self.iterative_factorial(number)
    if number == 0 or number == 1
      return 1
    end

    product = 1
    while number > 1
      product *= number
      number -= 1
    end

    return product
  end

  def self.recursive_factorial(number)
    if number == 0 or number == 1
      return 1
    end

    while number > 1
      return self.recursive_factorial(number-1)*number
    end
  end
end

# 0! = 1
# 1! = 1
# 2! = 2
# 3! = 6
# 4! = 24

puts Calculator.iterative_factorial(0)
puts Calculator.iterative_factorial(1)
puts Calculator.iterative_factorial(2)
puts Calculator.iterative_factorial(3)
puts Calculator.iterative_factorial(4)

puts Calculator.recursive_factorial(0)
puts Calculator.recursive_factorial(1)
puts Calculator.recursive_factorial(2)
puts Calculator.recursive_factorial(3)
puts Calculator.recursive_factorial(4)





