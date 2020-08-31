# Anagrams
# Our goal today is to write a method that determines if two given words are anagrams.
# This means that the letters in one word can be rearranged to form the other word. For example:
# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true
# Assume that there is no whitespace or punctuation in the given strings.

# time complexity??
def anagram?(str1, str2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)

    str1.each_char do |char|
        hash1[char] += 1
    end

    str2.each_char do |char|
        hash2[char] += 1
    end

    hash1 == hash2
end

# p anagram?("gizmo", "sally") #false
# p anagram?("elvis", "lives") #true



# Phase I:
# Write a method #first_anagram? that will generate and store 
#all the possible anagrams of the first string. Check if the second string is one of these.

# Hints:
# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.
# What is the time complexity of this solution? What happens if you increase the size of the strings?

# time complexity: O(n!) ==> n * (n-1)!
def first_anagram?(str1, str2)
    possible = str1.chars.permutation.to_a
    possible.include?(str2.chars)

end

# p first_anagram?("dog", "god") # true
# p first_anagram?("dog", "cat") # false







# Phase II:
# Write a method #second_anagram? that iterates over the first string. For each letter in the first string, find the index of that letter in the second string (hint: use Array#find_index) and delete at that index. The two strings are anagrams if an index is found for every letter and the second string is empty at the end of the iteration.

# Try varying the length of the input strings. What are the differences between #first_anagram? and #second_anagram??

# iterate through str1
# if char.include?(str2)
# index at str2 = ""

# O(n)
def second_anagram?(str1, str2)
    str1_array = str1.chars
    str2_array = str2.chars

    str1_array.each_with_index do |char, idx|
        if str2_array.include?(char)
            index2 = str2_array.index(char)
            str2_array[index2] = ""
        end
    end

    str2_array.join.empty?
end

# p second_anagram?("dog", "god") # true
# p second_anagram?("dog", "cat") # false



# Phase III:
# Write a method #third_anagram? that solves the problem by sorting both strings alphabetically.
# The strings are then anagrams if and only if the sorted versions are the identical.

# What is the time complexity of this solution? Is it better or worse than #second_anagram??

# time complexity O(n)
def third_anagram?(str1, str2)
    alpha = ("a".."z").to_a
    sorted_string_one = []
    sorted_string_two = []
    str1_array = str1.chars 
    str2_array = str2.chars
    alpha.each_with_index do |char, idx| 
        if str1_array.include?(char)
            sorted_string_one << char 
        end
    end

    alpha.each_with_index do |char,idx| 
        if str2_array.include?(char)
            sorted_string_two << char
        end
    end
    sorted_string_one == sorted_string_two
end

# p third_anagram?("dog", "god") # true
# p third_anagram?("dog", "cat") # false


# Phase IV:
# Write one more method #fourth_anagram?. This time, use two Hashes to store the number of times each letter appears in both words. Compare the resulting hashes.

# What is the time complexity?
# Bonus: Do it with only one hash.
# Discuss the time complexity of your solutions together, then call over your TA to look at them.

# O(n)
def fourth_anagram?(str1, str2)
    count(str1) == count(str2)
end

def count(str)
    hash = Hash.new(0)
    str.each_char do |char|
        hash[char] += 1
    end
    hash
end

p fourth_anagram?("dog", "god") # true
p fourth_anagram?("dog", "cat") # false