require "byebug"

# my_min
# Given a list of integers find the smallest number in the list.

# Example:

#     list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#     my_min(list)  # =>  -5


# Phase I
# First, write a function that compares each element to every other element of the list.
# Return the element if all other elements in the array are larger.
# What is the time complexity for this function?




# O(n^2)
def my_min(arr)
    answer = 0
    arr.each_with_index do |ele1, idx1|
        arr.each_with_index do |ele2, idx2|
            if idx2 > idx1 && ele1 < ele2
                answer = ele1 if answer >= ele1
            end
        end
    end
    answer 
end

#p my_min([ 0, 3, 5, 4, -5, 10, 1, 90])


# Phase II
# Now rewrite the function to iterate through the list just once while keeping track of the
#  minimum. What is the time complexity?

# O(n)
def my_min2(arr)
    answer = 0
    arr.each_with_index do |ele, idx|
        if idx != arr.length - 1
            if arr[idx] > arr[idx + 1]
                answer = arr[idx + 1] if answer >= arr[idx + 1]
            end
        end
    end
    answer
end

#p my_min2([ 0, 3, 5, 4, -5, 10, 1, 90])


# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous (together in sequence)
# sub-sum. Find the sums of all contiguous sub-arrays and return the max.

# Example:

#     list = [5, 3, -9, 9]
#     largest_contiguous_subsum(list) # => 8

#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7

# Phase I
# Write a function that iterates through the array and finds all sub-arrays using nested loops.
#  First make an array to hold all sub-arrays. Then find the sums of each sub-array and return the max.

# Discuss the time complexity of this solution.

# this is o(n^2) time complexity
def largest_contiguous_subsum(arr)
    answer = []
    arr.each_with_index do |ele1,idx1|
        arr.each_with_index do |ele2,idx2|
            answer << arr[idx1..idx2].sum 
        end
    end
    answer.sort[-1]
end

#p largest_contiguous_subsum([5, 3, -7])


# Phase II
# Let's make a better version. Write a new function using O(n) time with O(1) memory. Keep 
# a running tally of the largest sum.

# Get your story straight, and then explain your solution's time complexity to your TA.

#go through the loop but 

def largest_contiguous_subsum2(arr)
    answer = 0 
    current_sum = 0   
    arr.each_with_index do |ele,idx|
            if idx == 0 
                current_sum = arr[idx]
                answer = current_sum
            elsif current_sum > 0 
                current_sum += arr[idx] 
                answer = current_sum unless answer > current_sum 
            else
                current_sum = arr[idx]
            end
    end
    answer
end

p largest_contiguous_subsum2([ 1,5,-4,8,-8, 10]) #12
p largest_contiguous_subsum2([5, 3, -10, 4, 6, -2, 5]) #13

# answer = 1
# current = 1 + 5 = 6  
# ele = 1, 5, 

# if current is negative, then set current to next ele

# arr = [ 1,5,-4,8,-8, 10]
# largestContig = 12
# answer = 1 > 6 > 6  > 10 > 10 > 12
# curr   = 1 > 6 > 2  > 10 > 2  > 12
# ele    = 1 > 5 > -4 > 8  > -8 > 10

# arr = [5, 3, -10, 4, 6, -2, 5]
# largestContig = 13

# answer = 5 > 8 >  8  > 8 > 10 > 10 > 13
# curr   = 5 > 8 > -2  > 4 > 10 > 8  > 13
# ele    = 5 > 3 > -10 > 4 > 6  > -2 > 5

# x + 2 > x
# x + -2 > x + y


#p largest_contiguous_subsum2([5, 3, -10, 4, 6, -2, 5])



