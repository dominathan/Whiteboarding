#### WEEK 1 ####


PRIME NUMBERS UPTO 1,000,000




Whiteboarding problems is something you will probably experience in the coming months for a ruby on rails job.  What!? I can’t use my computer to code?!  Fraid not Timmy.

I’m going to try and do a weekly lecture, where we will

     A) start whiteboarding the type of problems you may be asked to solve together

     B) learn BigO notation

     C) learn basic data structures

     D) learn basic algorithms, like merge sort


Not necessarily in this order.


PROBLEM SOLVING — This is how I do it, but this is not THE way to do it, and any other way may be just as good or better. Please feel free to criticize anything on here and/or provide your own method to problem solving.


Problem:
Find all the prime numbers up to a given number. (1,000,000)

Step 1: Figure out what I’m getting.
The problem states that I’ll be receiving a number.  We can begin by defining a method

    def prime_upto(given_number)


    end

(All new code in red)

Step 2: Figure out what I’m returning.
The problem wants me to return all the prime numbers up to a certain number, but does not specify how it wants them to be returned.  In an interview situation, we would ask what the interviewer is expecting as output.  For this situation, I will return an Array that lists all prime numbers up to the number given.


Step 3: Determine my assumptions.

Here, I’m assuming the number given is a Real Number,  and an Integer.  I’m assuming it is not negative.  I’m assuming it is ok to return an Array of all Prime Numbers, but maybe they want them stringified, or stored in a hash structure.


During the interview, ask the person about your assumptions. Assumptions are an easy way to mess up your problem if you don’t try to get clarification. Maybe the person interviewing you wants you to return only prime numbers that are prime factors of larger numbers.  IT is always ok to ask for more information.  The interviewer is most interested in how you think, and if you are asking good clarifying questions, it shows you are considering edge cases and details that need to be understood in the real world.


Step 4: Writing Tests.

This might not be necessary for the interview, but it will help you with all of your assumptions. When you’re asking your interviewer about the assumptions you have for the problem, you are helping determine a lot of your tests.  I have my tests written below:



    describe ‘#prime_upto(given_number)’ do

         context ‘when the number given is negative, float, 0, or letter’ do
                 it ‘tells the user “INVALID ENTRY” and exits” do
                        expect(prime_upto(-1)).to eq(“Invalid Entry”)
                        expect(prime_upto(1)).to eq(“Invalid Entry”)

                        expect(prime_upto(“HELLO")).to eq(“Invalid Entry”)
                        expect(prime_upto(0)).to eq(“Invalid Entry”)
                          expect(prime_upto(1.9999)).to eq(“Invalid Entry”)
                end
         end


         context ‘if the number 8 is given’ do
              it 'should return all primes before 8’ do
                       expect(prime_upto(8).to eq([2,3,5,7])
              end
         end
    end


Ok, I think we have handled our edge cases, and we have started to think about the problem…now………

Step 5:  Break it into parts and solve.

Here is what we currently have:


    def prime_upto(given_number)

    end



We know we need to return an array of all the prime numbers up to given_number.  How should we think about that?  First, and most important, we need to check if the number is prime.  We should make a new method first, that checks if any number is prime.


    def is_prime?(given_number)


    end


From our edge cases, we know that we want to return “Invalid Entry”, so let’s start there.


    def is_prime?(given_number)
      if given_number.is_a?(Fixnum) && given_number.is_a?(Integer) && given_number > 1

         DO SOMETHING
      else
        "Invalid Entry"
      end
    end

Great, we’ve caught our edge cases. Let's update our SPEC file.


      describe '#is_prime?(given_number)' do

        context "when the number is given is negative float, 0 or letter" do
          it 'tells the user "Invalid Entry" and exits' do
            expect(is_prime?(-1)).to eq('Invalid Entry')
            expect(is_prime?(1)).to eq('Invalid Entry')
            expect(is_prime?("Hello")).to eq('Invalid Entry')
            expect(is_prime?(0)).to eq('Invalid Entry')
            expect(is_prime?(1.9999)).to eq('Invalid Entry')
          end
        end
      end


Come on RSPEC, don’t fail me now.  GREEEEEN. Now for the hard stuff.

A prime number is a number that is only divisible by 1 and itself.  So 2 is the first prime number, and 3 is a prime number, then 5,7….etc. To think about it differently, any number that is divisible by another number besides 1 and Itself, is not prime.  That means for a given_number, that if any number between 2 and given_number minus one gives a remainder of 0, It is not prime: So we need to use a .each loop to check the range of numbers, leading up to given_number -1,  that do not produce a remainder of 0.  If they do not, return true

Let’s write some tests!

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

AND update the other tests

      describe '#is_prime?(given_number)' do

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


    def is_prime?(given_number)
      if given_number.is_a?(Fixnum) && given_number.is_a?(Integer) && given_number > 1
         (2..(given_number-1).each do |num|
              if given_number % num == 0
                  false
              end
         end
           true
       else
        "Invalid Entry"
      end
    end


Ok, let’s run RSPEC.  WHAT?!?!? EVERY SINGLE NUMBER IS PRIME!??!? Hmmm… I must have done something wrong.  Oh!!!! As it stands, ruby will say false every time a number is not prime, but at the end it always returns true!  I need it to exit the loop if ANY of the numbers are not prime.  So it can’t just be false, it must return false.


    def is_prime?(given_number)
      if given_number.is_a?(Fixnum) && given_number.is_a?(Integer) && given_number > 1
         (2..(given_number-1).each do |num|
              if given_number % num == 0
                  return false
              end
         end
           true
       else
        "Invalid Entry"
      end
    end


Let’s run this.  Boom!! We now can tell you if a number is prime or not.  Now back to getting all the prime numbers up to a certain number.

We should do another loop, all the way upto given_number, and check if the current number is prime.  If it is, we should inject it into the array we want to return.  If it is not, we go to the next number!  Upto sounds cool… I wonder if ruby has a method that does that.  OHH RUBY, you are such a GEM!! Let’s use UPTO!

    def prime_upto(given_number)
        all_primes = []
        2.upto(given_number) do |n|
          if is_prime?(n)
            all_primes << n
          end
        end
        all_primes
    end

Let’s RSPEC it, and GREEN it passes.  Now, let’s open up console, and run our program, giving it a 1000. So fast! Now let’s do 10,000!.  Hmmm, slowing down.  That took half a second.  But it works. Let’s trying 100,000! …. hmmmm this is taking forever.  That took 30 seconds.  I can only imagine how long it’s going to take if we do a million, we’re going to have to speed this up!  But HOW?!?

I do not expect anyone to know this, but! You actually do not have to check every single number on the way up to given_number.  I will not be supplying the mathematical proof for this, but all you have to check is all the numbers leading up to the SQUARE ROOT(rounded up) of the given_number.  For instance
 3-1 = 2 .. sqrt(2) = 1.73.round = 2  ..  3% 2 == 0 ? No… PRIME
 4-1 = 3 sqrt(3) = 1.73..round = 2 … 4%2 == 0 ? Yes  NOT PRIME

Lets work this back into our solution.

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

And now let’s see how long it takes.  prime_upto(100000) .. wow, that went from 33 seconds to 0.28 seconds.  now for a million DRUMROLL PLEASE!!!

5.4399999999999995 seconds.  if we set that to a variable and count it. We have 78,498 numbers that are prime between 1 and a million.  Crazy.

But what about why it took so long.  Why does it take exponentially more time to run prime_upto(1000) vs prime_upto(10000) vs prime_upto(100000)?
We will get to that next time. When we start talking about BIG-O notation!

RECAP STEPS:

Step 1: Figure out what objects I’m getting. Whether it is an array, a number, a string, whatever, I need to know what I’m getting initially.
Step 2: Figure out what I’m giving back. This will drive how I write my solution. If I need to return true when a number is prime, I will write my solution differently than if I needed to return an array of all the prime numbers up to 1,000,000.
Step 3: Figure out my assumptions.  You have to figure out what you don’t know about the problem. Is the value be supplied an Integer? Can it be Negative or 0? Could it be a strings? Could it have complex numbers? Could it contain a function? Could it be empty?  If you can ask someone for more clarification, like in a technical interview, do it. If not, start thinking about all the possible inputs.
Step 4: Start writing your tests based off of your assumptions. If you get an 0, does it return the correct thing? If your number is actually a string, what does it return?
Step 5: Break the problem into parts and start solving each part individually. The biggest issue that I see is that people try to solve a large problem all at once. Instead, break it into parts. You don’t want to try to solve everything at once. That’s very hard to do (borderline impossible for complex problems) and makes you prone to mistakes. It will also overwhelm you. Every. Time. Figure out one part of the problem and solve that, then move on to the next.
Step 6: Review the problem and see where you might improve it.
