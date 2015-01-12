def largest_index(array)
  if array.length < 1
    return false
  end
  lg_index = 0
  array.each_index do |ind|
    if array[ind] > array[lg_index]
      lg_index = ind
    end
  end
  lg_index
end

b = [3,-1,6,100,3,5,9,-2]
c = []
d = [-1,-2,-3,-4,-5]

puts largest_index(b)
puts largest_index(c)
puts largest_index(d)
# def largest_index(array)
#   array.index(array.max)
# end
