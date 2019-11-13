# Warmup
# Write a recursive method, range, that takes a start and an end and 
# returns an array of all numbers in that range, exclusive. For example,
# range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.
# Rememeber, the end is actually 1 less than your second argument ... so if end == start ... it would work
# Write both a recursive and iterative version of sum of an array.

def range(n1, n2)
    return [] if n2 == n1
    array = []
    array << n1
    array += range(n1+1,n2)
    #array.flatten

    #range(n1,n2) + range(n1+1,n2+2)

    # arr = []
    # (n1...n2).each do |i|
    #     arr << i
    # end
    # arr
end

#p range(1, 5) # => [1, 2, 3, 4]

def recursive_sum(arr)
    return 0 if arr.length == 0
    return arr[0].to_i if arr.length == 1
    # num = 0
    # num_2 = arr.shift.to_i
    # num += recursive_sum(num_2 + arr)
    num = arr[0].to_i
    num += recursive_sum(arr[1..-1])
end

# p recursive_sum([1,2,3,4,5])    #15

def iterative_sum(arr)
    n = 0
    arr.each do |num|
        n += num
    end
    n
end

#p iterative_sum([1,2,3,4,5])  #15



# Exponentiation
# Write two versions of exponent that use two different recursions:

# this is math, not Ruby methods.

def expo_1(na, nb)
    return 1 if nb == 0
    p "recursion line"
    na * expo_1(na, nb - 1)
    # num = na
    # na *= num

    # nb -= 1
end

def expo_2(a, b)
    return 1 if b == 0
    return a if b == 1
    if b.even?
        p "Even Tide"
        bob = expo_2(a, b / 2)
        bob * bob 
    else
        p "Odd Tide"
        sally = expo_2(a,(b-1)/2)
        a * sally * sally
    end
end

#p expo_1(5, 10) #25
#p expo_2(5, 40) #25
#p expo_2(4, 39) #25

# recursion()
# recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

# recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n][]
# Note that for recursion 2, you will need to square the results of exp(b, n / 2) and (exp(b, (n - 1) / 2). Remember that you don't need to do anything special to square a number, just calculate the value and multiply it by itself. So don't cheat and use exponentiation in your solution.

# Suggestion: Break the methods down into parts..

# Suggestion 2: Try walking through your code with Simple Examples.

# If the n == 256, about how many nested recursive steps will we run in the first case?
#256

# How deep will we need to recurse for the second? Keep in mind that the first reduces the exponent by one for each recursion, while the second reduces it by half.
#!!!!!!!!!!

#N = 2 ** X
#(NOT!)  X = SQRT(N) / 2  (but close .. works for 256)

#!!!!!!!!!!!!!!!!!
# n is the exponent & x is the amt of recursive steps


# In addition to testing your methods by running the code, try the following exercise:

# On paper, write out the value of each variable for every line in the code:

# Write out what happens with base 0 and power 0 as inputs (should be easy). e.g., if you had run exp(0,0).
# Write out what happens for base 0 and power 1. e.g., if you had run exp(0,1).
# Write out what happens for base 1 and power 0.
# Write out what happens for base 1 and power 1.
# Write out what happens for base 1 and power 2.
# Write out what happens for base 2 and power 0.
# Write out what happens for base 2 and power 1.
# Write out what happens for base 2 and power 2.
# Make sure you can trace from the very beginning to the very end in these examples.

# How many examples do you need to walk through to be confident that it works?





# Deep dup
# The #dup method doesn't make a deep copy:


def deep_dup(arr)
    duplicate = []
    arr.each do |ele|
        if ele.is_a?(Array)
            duplicate << deep_dup(ele)
        else
            duplicate << ele
        end
    end
    duplicate
end

#p [1,2,3,4,5].deep_dup
#p deep_dup([1, [2], [3, [4]]])


#  robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]
# robot_parts_copy = robot_parts.dup

# shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# but it does
# robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]
# When we dup an Array, it creates a new array to hold the elements, but doesn't recursively dup any arrays contained therein. So the dup method creates one new array, but just copies over references to the original interior arrays.

# Sometimes you want a shallow dup and sometimes you want a deep dup. Ruby keeps things simple by giving you shallow dup, and letting you write deep dup yourself.

# Using recursion and the is_a? method, write an Array#deep_dup method that will perform a "deep" duplication of the interior arrays.

# Note: For simplicity's sake, we are only going to ensure the deep duplication of arrays. Don't worry about deep-duping (or regular-duping) other types of mutable objects (like strings, hashes, instances of custom classes, etc.), since this would require that we implement a deep dup method for each of those classes, as well.

# It's okay to iterate over array elements using the normal each for this one :-)

# You should be able to handle "mixed" arrays. For instance: [1, [2], [3, [4]]].





# Fibonacci
# Write a recursive and an iterative Fibonacci method. The method should take in an integer n and return the first n Fibonacci numbers in an array.

# You shouldn't have to pass any arrays between methods; you should be able to do this just passing a single argument for the number of Fibonacci numbers requested.

def fibonacci(n)
    return [0,1].take(n) if n <= 2
    prev_array = fibonacci(n-1)

    prev_array << (prev_array[-1] + prev_array[-2])
end

# p fibonacci(5) 
# p fibonacci(6)
# p fibonacci(7)
# p fibonacci(8)

# Binary Search
# The binary search algorithm begins by comparing the target value to the value of the middle element of the sorted array. If the target value is equal to the middle element's value, then the position is returned and the search is finished. If the target value is less than the middle element's value, then the search continues on the lower half of the array; or if the target value is greater than the middle element's value, then the search continues on the upper half of the array. This process continues, eliminating half of the elements, and comparing the target value to the value of the middle element of the remaining elements - until the target value is either found (and its associated element position is returned), or until the entire array has been searched (and "not found" is returned).

# Write a recursive binary search: bsearch(array, target). Note that binary search only works on sorted arrays. Make sure to return the location of the found object (or nil if not found!). Hint: you will probably want to use subarrays.

# Make sure that these test cases are working:

def bsearch(arr, num)
   #return nil unless arr.include?(num)
   return nil if arr.empty?
   
   midpoint = arr.length / 2
   array_1 = arr[0...midpoint]
   array_2 = arr[midpoint+1..-1]

   return midpoint if arr[midpoint] == num
   if num < arr[midpoint] 
    bsearch(array_1, num)
   else
    result = bsearch(array_2, num)
    if result.nil?
        return nil 
    else
        return midpoint + result + 1
    end
   end
   #p "check"
end

# def quick_sort(arr)
#     return arr if arr.length <= 1
#     midpoint = [arr.first]retu
#     left_side = arr[1..-1].select
# end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
# p bsearch([1, 2, 3, 4, 5, 7, 8], 8) #=> 6




# Merge Sort
# Implement a method merge_sort that sorts an Array:

# The base cases are for arrays of length zero or one. Do not use a length-two array as a base case. This is unnecessary.
# You'll want to write a merge helper method to merge the sorted halves.
# To get a visual idea of how merge sort works, watch this gif and check out this diagram.


def merge_sort(arr)
    return [] if arr.length == 0
    return arr if arr.length == 1
    array_0 = []

   midpoint = arr.length / 2
   array_1 = arr[0..midpoint-1]
   array_2 = arr[midpoint..-1]

   sorted_left = merge_sort(array_1)
   sorted_right = merge_sort(array_2)

   merger(sorted_left, sorted_right)
end

def merge_sort(arr)
    return [] if arr.length == 0
    return arr if arr.length == 1
    array_0 = []

    midpoint = arr.length / 2
    array_1 = arr[0..midpoint-1]
    array_2 = arr[midpoint..-1]

    sorted_left = merge_sort(array_1)
    sorted_right = merge_sort(array_2)

    merger(sorted_left, sorted_right)
end

def merger(array_1, array_2)
    sorted = []

    until array1.empty? || array_2.empty?
        if array_1.first < array_2.first
            sorted << array_1.shift
        else
            sorted << array_2.shift
        end
    end

    sorted + array_1 + array_2
end

def merger(array_1, array_2)
    sorted = []
    
    until array_1.empty? || array_2.empty?
        if array_1.first < array_2.first
            sorted << array_1.shift
        else
            sorted << array_2.shift
        end
    end
    
    sorted + array_1 + array_2
end

# return midpoint if arr[midpoint] == num
#    if num < arr[midpoint] 
#     bsearch(array_1, num)
#    else
#     result = bsearch(array_2, num)
#     if result.nil?
#         return nil 
#     else
#         return midpoint + result + 1
#     end
#    end

# p merge_sort([3,6,2,5,3,8])
# p merge_sort([6,4,3,5,2])



# Array Subsets
# Write a method subsets that will return all subsets of an array.

def subsets(array)
    return [[]] if array.empty?
    subsets = []
    array.each_index do |i|
        subsets << [array[0], array[i]]
    end
    subsets + subsets(array.drop(1))
end

p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
p subsets([1, 2, 3, 4])

# You can implement this as an Array method if you prefer.

# Hint: For subsets([1, 2, 3]), there are two kinds of subsets:

# Those that do not contain 3 (all of these are subsets of [1, 2]).
# For every subset that does not contain 3, there is also a corresponding subset that is the same, except it also does contain 3.




# Permutations
# Write a recursive method permutations(array) that calculates all the permutations of the given array. For an array of length n there are n! different permutations. So for an array with three elements we will have 3 * 2 * 1 = 6 different permutations.

# permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 1, 2], [3, 2, 1]]
# You can use Ruby's built in Array#permutation method to get a better understanding of what you will be building.

# [1, 2, 3].permutation.to_a  # => [[1, 2, 3], [1, 3, 2],
#                             #     [2, 1, 3], [2, 3, 1],
#                             #     [3, 1, 2], [3, 2, 1]]

def permutations(array)
    permutation = []
    array.each_with_index do |ele, idx|

    end

end
                            


# Make Change
# RubyQuiz: Make change.

# Here's a game plan for solving the problem:

# First, write a 'greedy' version called greedy_make_change:

# Take as many of the biggest coin as possible and add them to your result.
# Add to the result by recursively calling your method on the remaining amount, leaving out the biggest coin, until the remainder is zero.
# Once you have a working greedy version, talk with your partner about refactoring this to make_better_change. What's wrong with greedy_make_change?

# Consider the case of greedy_make_change(24, [10,7,1]). Because it takes as many 10 pieces as possible, greedy_make_change misses the correct answer of [10,7,7] (try it in pry).

# To make_better_change, we only take one coin at a time and never rule out denominations that we've already used. This allows each coin to be available each time we get a new remainder. By iterating over the denominations and continuing to search for the best change, we assure that we test for 'non-greedy' uses of each denomination.

# Discuss the following game plan and then work together to implement your new method:

# Iterate over each coin.
# Grab only one of that one coin and recursively call make_better_change on the remainder using coins less than or equal to the current coin.
# Add the the single coin to the change returned by the recursive call. This will be a possible solution, but maybe not the best one.
# Keep track of the best solution and return it at the end.
# N.B. Don't generate every possible permutation of coins and then compare them. Remember that a permutation is not the same thing as a combination - we will need to check every combination of coins that add up to our target, we just don't want to check the same combination in different orders. If you get stuck you can start by writing a solution that calculates and compares all of the permutations without storing them in an array. Then go back and refactor your solution so that it only calculates and compares all of the different combinations. If you and your partner get totally stuck, or would like to compare your answer, feel free to reference this video walkthrough of the problem.

# Make sure you and your partner understand each line before moving on.