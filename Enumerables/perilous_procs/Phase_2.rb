# Write a method xnor_select that accepts an array and two procs as arguments. The method should return a new array containing elements of the original array that either return true for both procs or return false for both procs.
def xnor_select(arr, prc1, prc2)
    new_arr = []
    arr.each do |ele| 
        new_arr << ele if prc1.call(ele) == false && prc2.call(ele) == false
        new_arr << ele if prc1.call(ele) && prc2.call(ele) 
    end
    new_arr
end

# is_even = Proc.new { |n| n % 2 == 0 }
# is_odd = Proc.new { |n| n % 2 != 0 }
# is_positive = Proc.new { |n| n > 0 }
# p xnor_select([8, 3, -4, -5], is_even, is_positive)         # [8, -5]
# p xnor_select([-7, -13, 12, 5, -10], is_even, is_positive)  # [-7, -13, 12]
# p xnor_select([-7, -13, 12, 5, -10], is_odd, is_positive)   # [5, -10]


# Rewrite your previous filter_out method to mutate the input array instead of returning a new array. That is, write a method filter_out! that accepts an array and a block as args. The method should remove elements of the input array that return true when given to the block. Solve this without using Array.reject!.
def filter_out!(arr, &prc)
    arr.select! { |ele| prc.call(ele) == false }
    
end

arr_1 = [10, 6, 3, 2, 5 ]
filter_out!(arr_1) { |x| x.odd? }
p arr_1     # [10, 6, 2]

arr_2 = [1, 7, 3, 5 ]
filter_out!(arr_2) { |x| x.odd? }
p arr_2     # []

arr_3 = [10, 6, 3, 2, 5 ]
filter_out!(arr_3) { |x| x.even? }
p arr_3     # [3, 5]

arr_4 = [1, 7, 3, 5 ]
filter_out!([1, 7, 3, 5 ]) { |x| x.even? }
p arr_4 # [1, 7, 3, 5]


# Write a method multi_map that accepts an array, an optional number (n), and a block as arguments. The method should return a new array where each element of the original array is repeatedly run through the block n times. If the number argument is not passed in, then the the elements should be run through the block once.
def multi_map(arr, n=1, &prc)
    new_arr = []
    arr.each do |ele|
        n.times do
            ele = prc.call(ele)
        end
        new_arr << ele
    end
    new_arr
end

# p multi_map(['pretty', 'cool', 'huh?']) { |s| s + '!'}      # ["pretty!", "cool!", "huh?!"]
# p multi_map(['pretty', 'cool', 'huh?'], 1) { |s| s + '!'}   # ["pretty!", "cool!", "huh?!"]
# p multi_map(['pretty', 'cool', 'huh?'], 3) { |s| s + '!'}   # ["pretty!!!", "cool!!!", "huh?!!!"]
# p multi_map([4, 3, 2, 7], 1) { |num| num * 10 }             # [40, 30, 20, 70]
# p multi_map([4, 3, 2, 7], 2) { |num| num * 10 }             # [400, 300, 200, 700]
# p multi_map([4, 3, 2, 7], 4) { |num| num * 10 }             # [40000, 30000, 20000, 70000]


# Write a method proctition that accepts an array and a block as arguments. The method should return a new array where the elements that return true when given to the block come before all of the elements that return false when given to the block. This means that the new array has two partitions; the order among elements in the same partition should be the same as their relative order in the input array.
def proctition(arr, &prc)
    truearr = []
    falsearr = []
    arr.each do |ele|
        truearr << ele if prc.call(ele)
        falsearr << ele if prc.call(ele) == false
    end
    [truearr, falsearr].flatten
end

# p proctition([4, -5, 7, -10, -2, 1, 3]) { |el| el > 0 }
# # [4, 7, 1, 3, -5, -10, -2]

# p proctition([7, 8, 3, 6, 10]) { |el| el.even? }
# # [8, 6, 10, 7, 3]

# p proctition(['cat','boot', 'dog', 'bug', 'boat']) { |s| s[0] == 'b' }
# # ["boot", "bug", "boat", "cat", "dog"]