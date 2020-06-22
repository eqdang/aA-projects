# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    (num_1..(num_1*num_2)).each do |mult|
        if mult % num_1 == 0 && mult % num_2 == 0
            return mult
        end
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
# thethrillofit ==> th

def most_frequent_bigram(str)
    bigrams = Hash.new {0}

    (0...str.length-1).each do |i1|
        bigrams[str[i1] + str[i1 + 1]] += 1
    end

sorted = bigrams.sort_by { |k, v| v }
sorted[-1][0]
end
    


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    # {"a"=>1, "b"=>2}.inverse).to eq({1=>"a", 2=>"b"})
    def inverse
        new_hash = {}
        self.each do |k, v|
            new_hash[v] = k
        end
        new_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns 
    # the number of pairs of elements that sum to the given target
    
    # expect([1, 2, 1, 3, 8].pair_sum_count(5)).to eq(1)

    def pair_sum_count(num)
        count = 0
        self.each_with_index do |num1, idx1|
            self.each_with_index do |num2, idx2|
                if idx2 > idx1 && num1 + num2 == num
                    count += 1
                end
            end
        end
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)

    #expect(actual).to eq([1, 12, 14, 2, 24, 25, 4, 8, 81, 9])

    def bubble_sort(&prc)
        
        # when no proc is given, should sort the array in increasing order by default
        # when proc is given, sort array according to proc
        #{ |a, b| a.to_s <=> b.to_s }
        # prc.call(self[idx], self[idx + 1]) 
        prc ||= Proc.new{ |a, b| (a <=> b)}
            sorted = false
            while !sorted
                sorted = true
                (0...self.length-1).each do |idx|
                    if prc.call(self[idx], self[idx + 1]) == 1
                        self[idx], self[idx + 1] = self[idx + 1], self[idx]
                        sorted = false
                    end
                end
            end
        self
    end
end
