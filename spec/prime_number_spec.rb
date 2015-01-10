require_relative '../lib/prime_numbers.rb'


describe '#prime_upto(given_number)' do

  context "when the number is given is negative float, 0 or letter" do
    it 'tells the user "Invalid Entry" and exits' do
      expect(is_prime?(-1)).to eq('Invalid Entry')
      expect(is_prime?(1)).to eq('Invalid Entry')
      expect(is_prime?("Hello")).to eq('Invalid Entry')
      expect(is_prime?(0)).to eq('Invalid Entry')
      expect(is_prime?(1.9999)).to eq('Invalid Entry')
    end
  end

  context 'if the number 8 is given' do
    it 'should return all primes before it return' do
      expect(prime_upto(8)).to eq([2,3,5,7])
    end
  end
end

describe '#isPrime?(given_number)' do
  context 'given these number it should equal the expected output' do #this is ugly but you get the gist.  AND HEY. at least i am testing
    it 'should return true' do
      expect(is_prime?(3)).to eq(true)
      expect(is_prime?(5)).to eq(true)
      expect(is_prime?(101)).to eq(true)
    end

    it 'should return false' do
      expect(is_prime?(4)).to eq(false)
      expect(is_prime?(10)).to eq(false)
      expect(is_prime?(15)).to eq(false)
    end
  end
end
