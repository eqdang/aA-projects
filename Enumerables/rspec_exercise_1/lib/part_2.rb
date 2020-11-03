def hipsterfy(string) #tonic
    vowels = "aeiou"
    
    i = string.length - 1
    while i >= 0
        if vowels.include?(string[i])
           return string[0...i] + string[i+1..-1]
        end
        i -= 1
    end
    string
end

def vowel_counts(string)
    vowels = "aeiou"
    vowels_only = []
    string.downcase.each_char { |char| vowels_only << char if vowels.include?(char) }

    vowel_count = Hash.new(0)
    vowels_only.each { |char| vowel_count[char] += 1 }
    
    return vowel_count
        
end

def caesar_cipher(msg, num)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    new_string = ""

    msg.each_char do |char|
        if !alphabet.include?(char)
            new_string += char
        elsif alphabet.include?(char)
            old_idx = alphabet.index(char)
            new_idx = old_idx + num
            new_ltr = alphabet[new_idx % 26]
            new_string += new_ltr
        end
    end
    return new_string
end