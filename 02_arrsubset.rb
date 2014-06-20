arr1 = [1,2,3]
arr2 = [3,4]
arr3 = [1,2]

def is_subset(arr_1, arr_2)
  (arr_2 - arr_1).empty?
end

puts is_subset(arr1, arr2)
puts is_subset(arr1, arr3)
puts is_subset([1,2],[2,3,4,5])