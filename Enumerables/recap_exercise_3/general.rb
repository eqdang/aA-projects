#General Problems

#no_dupes?
#Write a method no_dupes?(arr) that accepts an array as an arg and returns an new array containing the 
#elements that were not repeated in the array.

def no_dupes?(arr)
    count = Hash.new(0)
    arr.each { |ele| count[ele] += 1}

    not_repeated = []
    count.select { |k, v| not_repeated << k if v == 1 }
    not_repeated
end
    
p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []



#no_consecutive_repeats?
# Write a method no_consecutive_repeats?(arr) that accepts an array as an arg. The method should return 
# true if an element never appears consecutively in the array; it should return false otherwise.

def no_consecutive_repeats?(arr)
    (0...arr.length-1).each do |i|
        return false if arr[i] == arr[i+1]
    end
    true
end

p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true



#char_indices
#Write a method char_indices(str) that takes in a string as an arg. The method should return a hash 
# containing characters as keys. The value associated with each key should be an array containing the 
# indices where that character is found.

def char_indices(str)
    idx_hash = Hash.new { |h,k| h[k] = [] }

    str.each_char.with_index do |char,i|
        idx_hash[char] << i
    end
    idx_hash
end

p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}



# longest_streak
# Write a method longest_streak(str) that accepts a string as an arg. The method should return the longest 
# streak of consecutive characters in the string. If there are any ties, return the streak that occurs 
# later in the string.

def longest_streak(str)
    streak = Hash.new(0)
    str.each_char.with_index do |char, i|
        streak[char] += 1
    end
    sorted = streak.sort_by {|k, v| v }
    
    sorted[-1][0] * sorted[-1][1]
    
end

p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'



#bi_prime?
#Write a method bi_prime?(num) that accepts a number as an arg and returns a boolean indicating 
# whether or not the number is a bi-prime. A bi-prime is a positive integer that can be obtained by 
# multiplying two prime numbers.
# For Example:
# 14 is a bi-prime because 2 * 7
# 22 is a bi-prime because 2 * 11
# 25 is a bi-prime because 5 * 5
# 24 is not a bi-prime because no two prime numbers have a product of 24

def bi_prime?(num)
    (2...num).each do |n1|
        (2...num).each do |n2|
            return true if prime?(n1) && prime?(n2)&& n1*n2 == num
        end
    end
    false
end

def prime?(num)
    return false if num < 2
    (2...num).each do |n|
        return false if num % n == 0
    end
    true
end

p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false



# vigenere_cipher
# A Caesar cipher takes a word and encrypts it by offsetting each letter in the word by a fixed number, 
# called the key. Given a key of 3, for example: a -> d, p -> s, and y -> b.
# A Vigenere Cipher is a Caesar cipher, but instead of a single key, a sequence of keys is used. For 
# example, if we encrypt "bananasinpajamas" with the key sequence 1, 2, 3, then the result would be 
# "ccqbpdtkqqcmbodt":

# Message:  b a n a n a s i n p a j a m a s
# Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# Result:   c c q b p d t k q q c m b o d t
# Write a method vigenere_cipher(message, keys) that accepts a string and a key-sequence as args, 
# returning the encrypted message. Assume that the message consists of only lowercase alphabetic characters.

def vigenere_cipher(message, keys)
    alpha = "abcdefghijklmnopqrstuvwxyz"
    encrypted = ""

    (0...message.length).each do |i|
        old_idx = alpha.index(message[i])
        new_idx = old_idx + keys[i % keys.length]
        encrypted += alpha[new_idx % 26]
    end
    encrypted
end

p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"



#vowel_rotate
#Write a method vowel_rotate(str) that accepts a string as an arg and returns the string where every 
# vowel is replaced with the vowel the appears before it sequentially in the original string. The first vowel of 
# the string should be replaced with the last vowel.

def vowel_rotate(str)
    vowels = "aeiou"
    vowel_idx = []

    str.each_char.with_index do |char, i|
        vowel_idx << str[i]if vowels.include?(char)
    end

    p last = vowel_idx.pop()
    p vowel_idx.unshift(last)

    str.each_char.with_index do |char, i|
        str[i] = vowel_idx.shift() if vowels.include?(char)
    end

    str
end

p vowel_rotate('awesome')       # => "ewasemo"

#aeoe
#eaeo
