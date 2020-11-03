# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  
    def span
        if self.length == 0
            return nil
        else
            return self.max - self.min
        end
    end

    def average
        if self.length == 0
            return nil
        else
            return self.sum * 1.0 / self.length
        end
    end

    def median
        sorted = self.sort
        if self.length % 2 != 0
            odd_middle = (self.length / 2)
            return sorted[odd_middle]
        elsif self.length % 2 == 0 && self.length > 0
            first = (self.length / 2.0) - 1
            second = (self.length / 2.0)
            first_even = sorted[first]
            second_even = sorted[second]
            even_avg = (first_even + second_even) / 2.0
            return even_avg
        elsif self.length == 0
            return nil
        end
    end

    def counts
        hash = Hash.new(0)
        self.each { |ele| hash[ele] += 1 }
        return hash
    end

    def my_count(value)
        count = 0
        self.each { |ele| count += 1 if value == ele}
        return count
    end

    def my_index(value)
        if self.my_count(value) > 0
            self.each_with_index { |ele, i| return i if ele == value}
        else
            return nil
        end
    end

    def my_uniq
        unique = []
        
        count_hash = Hash.new(0)
        self.each { |ele| count_hash[ele] += 1 }

        count_hash.each { |k, v| unique << k } 
    
        return unique
    end

    def my_transpose
        transpose = []
        self[0].each_index do |idx1| 
            row = []
            self.each do |sub_arr|
                row << sub_arr[idx1]
            end
            transpose << row
        end
        transpose
    end

end
