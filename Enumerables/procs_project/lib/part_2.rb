def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(sentence, &prc)
    words = sentence.split(" ")
    new_sent = []
    
    words.each { |word| new_sent << prc.call(word) }
    new_sent.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    return prc1.call(num) if prc1.call(num) > prc2.call(num)
    prc2.call(num)
end

def and_selector(arr, prc1, prc2)
    new_arr = []
    arr.each { |ele| new_arr << ele if prc1.call(ele) == true && prc2.call(ele) == true }
    new_arr
end

def alternating_mapper(arr, prc1, prc2)
    new_arr = []
    arr.each_with_index do |ele, i|
        new_arr << prc1.call(ele) if i % 2 == 0
        new_arr << prc2.call(ele) if i % 2 != 0
    end
    new_arr
end