def in_biggest_num(arr)
  index = 0
  largest_index = 0
  largest = 0
  arr.each do |x|
    if x >= largest
      largest = x
      largest_index = index
    end
    index += 1
  end
  largest_index
end


a = [1,2,3,4,100]
puts in_biggest_num(a)
