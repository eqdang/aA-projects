# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    pf = []
    (1..num).each do |n|
        pf << n if num % n == 0 && prime?(n) == true
    end

    pf.max
end 

def prime?(n)
    return false if n < 2
    (2...n).each do |factor|
        return false if n % factor == 0
    end
    true
end

def unique_chars?(str)
    count = Hash.new(0)
    
    str.each_char { |char| count[char] += 1 }

    count.each do |k, v|
        return false if v > 1
    end
    true
end

def dupe_indices(arr)
    count = {}
    indices = []
    
    arr.each_with_index do |char, i|

        count[char] = indices(arr, char)
    end

    count.select { |k, v| v.length > 1}

end

def indices(arr, char)
    indices = []
    arr.each_with_index do |c, i|
        indices << i if char == c
    end

    indices
end



def ana_array(arr1, arr2)
    count1 = Hash.new(0)
    arr1.each { |ele| count1[ele] += 1 }

    count2 = Hash.new(0)
    arr2.each { |ele| count2[ele] += 1 }

    count1 == count2
end

