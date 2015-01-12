require 'benchmark'

def is_prime?(num)
  x = (2...Math.sqrt(num).ceil)
  x.each do |i|
    if num % i == 0
      return false
    end
  end
  true
end

def num_is_prime(num)
  primes = []
  x = (2..num)
  x.each do |i|
    if is_prime?(i)
      primes << i
    end
  end
  return primes
end
