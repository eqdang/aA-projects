def partition(array, num)
    answer = []
    subarr1 = []
    subarr2 = []
    array.each do |n|
        subarr1 << n if n < num
        subarr2 << n if n >= num
    end
    answer << subarr1
    answer << subarr2
    answer
end

def merge(hash1, hash2)
    new_hash = {}
    hash1.each { |k, v| new_hash[k] = v }
    hash2.each do |k, v|
        if new_hash.has_key?(k)
            new_hash[k] = v
        else
            new_hash[k] = v
        end
    end
new_hash
end

def censor(sent, arr)
    words = sent.split(" ")

    new_word = words.map do |word|
        if arr.include?(word.downcase)
            no_vowel(word)
        else
            word
        end
    end

    new_word.join(" ")
end

def no_vowel(word)
    vowels = "aeiouAEIOU"
    no_vowel = ""
    
    word.each_char do |char|
        if vowels.include?(char)
            no_vowel += "*"
        else
            no_vowel += char
        end
    end
    no_vowel
end

def power_of_two?(num)
  (1..num).each do |n|
        if 2 ^ n == num
            return true 
        else
            return false
        end
    end
    false
end