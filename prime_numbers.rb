#WHAT ARE ALL THE PRIME NUMBERS BETWEEN ONE AND A MILLION
require 'benchmark'
#Build is_prime? without Math.sqrt
def is_prime?(given_number)
  if given_number.is_a?(Fixnum) && given_number.is_a?(Integer) && given_number > 1
    2.upto(Math.sqrt(given_number - 1).ceil) do |x|
      if given_number % x == 0
        return false
      end
    end
     true
  else
    "Invalid Entry"
  end
end

#Check is prime, if is, shovel
def prime_upto(given_number)
  all_primes = []
  3.upto(given_number) do |n|
    if is_prime?(n)
      all_primes << n
    end
  end
  all_primes
end

#OTHER WAY TO CALCULATE PRIME
#Prime.prime(3)
