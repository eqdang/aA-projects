def average(num_1, num_2)
    (num_1 + num_2) / 2.0
end

def average_array(array_of_nums)
    sum = array_of_nums.sum
    sum / ((array_of_nums.length) * 1.0)
end

def repeat(string, num)
    string * num
end

def yell(string)
    string.upcase + "!"
end

def alternating_case(sentence_string)
    new_words = []
    
    words = sentence_string.split(" ")
    words.each_with_index do |word, idx|
        if idx % 2 == 0
            new_words << word.upcase
        elsif idx % 2 != 0
            new_words << word.downcase
        end
    end
    return new_words.join(" ")
end