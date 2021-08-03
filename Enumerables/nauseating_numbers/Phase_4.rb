# # # Phase 4: Nauseating.


# # # mersenne_prime
# A "Mersenne prime" is a prime number that is one less than a power of 2. This 
# means that it is a prime number with the form 2^x - 1, where x is some exponent. For example:
# 3 is a Mersenne prime because it is prime and 3 = 2^2 - 1
# 7 is a Mersenne prime because it is prime and 7 = 2^3 - 1
# 11 is not a Mersenne prime because although it is prime, it does not have the form 2^x - 1
# The first three Mersenne primes are 3, 7, and 31. Write a method mersenne_prime that accepts a 
# number, n, as an argument and returns the n-th Mersenne prime.

def prime?(n)
    return false if n < 2
    (2...n).each do |factor|
        return false if n % factor == 0
    end
    true
end

def mersenne_prime(n)
    mersenne_primes = [] 

    i = 1
    while mersenne_primes.length < n
        mersenne = 2**i - 1
        mersenne_primes << mersenne if prime?(mersenne)
        i += 1
    end

    mersenne_primes[n-1]
end

p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071





# # # triangular_word?
# A triangular number is a number of the form (i * (i + 1)) / 2 where i is some positive integer. 
# Substituting i with increasing integers gives the triangular number sequence. The first five numbers 
# of the triangular number sequence are 1, 3, 6, 10, 15. Below is a breakdown of the calculations used 
# to obtain these numbers:
# i	(i * (i + 1)) / 2
# 1	1
# 2	3
# 3	6
# 4	10
# 5	15
# We can encode a word as a number by taking the sum of its letters based on their position in the 
# alphabet. For example, we can encode "cat" as 24 because c is the 3rd of the alphabet, a is the 1st, 
# and t is the 20th:
# # 3 + 1 + 20 = 24

# # Write a method triangular_word? that accepts a word as an argument and returns a boolean indicating 
# whether or not that word's number encoding is a triangular number. You can assume that the argument 
# contains lowercase letters.

def triangular_word?(word)
    alpha = "abcdefghijklmnopqrstuvwxyz"
    sum = 0
    word.each_char do |char|
        idx = alpha.index(char) + 1
        sum += idx
    end

    triangular = []
    i = 1
    while i <= sum
        triangular << (i * (i+1)) / 2
        i += 1
    end
    triangular.include?(sum)
end

p triangular_word?('abc')       # true
p triangular_word?('ba')        # true
p triangular_word?('lovely')    # true
p triangular_word?('question')  # true
p triangular_word?('aa')        # false
p triangular_word?('cd')        # false
p triangular_word?('cat')       # false
p triangular_word?('sink')      # false




# consecutive_collapse
# Write a method consecutive_collapse that accepts an array of numbers as an argument. The method 
# should return a new array that results from continuously removing consecutive numbers that are adjacent 
# in the array. If multiple adjacent pairs are consecutive numbers, remove the leftmost pair first. For example:

# [3, 4, 1] -> [1]
# because 3 and 4 are consecutive and adjacent numbers, so we can remove them
# [1, 4, 3, 7] -> [1, 7]
# because 4 and 3 are consecutive and adjacent numbers, so we can remove them
# [3, 4, 5] -> [5]
# because 4 and 3 are consecutive and adjacent numbers, we don't target 4 and 5 since we should 
# prefer to remove the leftmost pair
# We can apply this rule repeatedly until we cannot collapse the array any further:

# # example 1
# [9, 8, 4, 5, 6] -> [4, 5, 6] -> [6]
# # example 2
# [3, 5, 6, 2, 1] -> [3, 2, 1] -> [1]

def consecutive_collapse(arr)
    collapsible = true
    
    while collapsible
        collapsible = false
        collapsed = []
        (0...arr.length - 1).each do |i|
            if (arr[i].to_i + 1) == arr[i+1].to_i || (arr[i].to_i - 1) == arr[i+1].to_i
                collapsed = arr[0...i] + arr[i+2..-1]
                arr = collapsed
                collapsible = true
                break  
            end
        end
    end
    arr
end

p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []





# # pretentious_primes
# Write a method pretentious_primes that takes accepts an array and a number, n, as arguments. 
# The method should return a new array where each element of the original array is replaced according 
# to the following rules:
# when the number argument is positive, replace an element with the n-th nearest prime number 
# that is greater than the element
# when the number argument is negative, replace an element with the n-th nearest prime number 
# that is less than the element
# For example:
# if element = 7 and n = 1, then the new element should be 11 because 11 is the nearest prime greater than 7
# if the element = 7 and n = 2, then the new element should be 13 because 13 is the 2nd nearest prime greater than 7
# if the element = 7 and n = -1, then the new element should be 5 because 5 is the nearest prime less than 7
# if the element = 7 and n = -2, then the new element should be 3 because 3 is the 2nd nearest prime less than 7
# Note that we will always be able to find a prime that is greater than a given number because there are an infinite 
# number of primes (this is given by Euclid's Theorem). However, we may be unable to find a prime that is smaller than 
# a given number, because 2 is the smallest prime. When a smaller prime cannot be calculated, replace the element with nil.

def pretentious_primes(arr, n)
    pretentious = arr.map do |ele|
        nth_prime(ele, n)
    end
    pretentious
end

def nth_prime(num, nth)
    primes = []
        if nth > 0
            i = num + 1
            while primes.length < nth
                primes << i if prime?(i)
                i += 1
            end
        elsif nth < 0
            i = num - 1
            while primes.length < (nth * -1)
                primes << i if prime?(i)
                primes << nil if i < 2
                i -= 1
            end
        end
    primes[-1]
end

# p prime?(4)
# p nth_prime(4, 2)
# p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
# p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
# p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
# p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
# p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
# p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
# p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
# p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
# p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
# p pretentious_primes([32, 5, 11], -5)          # [17, nil nil]