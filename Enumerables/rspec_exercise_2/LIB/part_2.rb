def palindrome?(str)
    reversed = []

    str.split("").each do |char|
        reversed.unshift(char)
    end

    reversed.join("") == str
end

def substrings(str)
    substring = []

    (0...str.length).each do |start_idx|
        (start_idx...str.length).each do |end_idx|
            substring << str[start_idx..end_idx]
        end
    end

    substring
end

def palindrome_substrings(str)
    substring = substrings(str)
    pal_sub = []
    substring.each do |sub|
        if sub.length > 1 && palindrome?(sub)
            pal_sub << sub
        end
    end
    return pal_sub
end

