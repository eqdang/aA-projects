def select_even_nums(arrofnums)
    arrofnums.select(&:even?)
end

def reject_puppies(arrofhashes)
    arrofhashes.reject { |hash| hash["age"] <= 2 }
end

def count_positive_subarrays(arr)
    arr.count do |sub| 
        sum = 0
        sub.each { |n| sum += n }
        sum > 0
    end
end

def aba_translate(str)
    vowels = "aeiou"
    aba = ""
    str.each_char.with_index do |char, i|
        if vowels.include?(char)
            aba += char + "b" + char
        else 
            aba += char
        end
    end
    
    aba
end

def aba_array(arr)
    arr.map { |word| aba_translate(word)}
end