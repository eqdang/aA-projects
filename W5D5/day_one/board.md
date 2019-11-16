class Array

def merge_sort(&prc)
    prc ||= Proc.new { |a,b| a<=>b }
    mid = self.length / 2
    left = self[0..mid]
    right = self[m + 1..-1]


    Array.merger(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
end

private
def self.merger(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
        case prc.call(left.first, right.first)
        when 1
            merged << right.shift
        when 0, -1
            merged << left.shift
        end
    end

    merged + left + right
end

(condition) ? (do whatever here if true) : (do here if false)

n = nil
a = n.nil? : 1 : n

if level --> level nil/false

def my_flatten(level = nil)
    copy = self.dup
    return copy if str == 0
    next_level = level ? level - 1 : nil
    
    copy.each.with_index do |el, i|
        if el.is_a?(Array)
            copy[i..i] = el.my_flatten(next_level)
        end
    end

    copy
end



end

def binary_search(arr, target)
    return nil if arr.empty?

    mid = arr.length / 2
    left = arr[0...mid]
    right = arr[mid+1..-1]

    if mid == target
        return mid
    elsif mid < target
        binary_search(left, target)
    elsif mid > target
        result = binary_search(right, target)
        if result == nil
            return nil
        else
            mid + result + 1
        end

    end
end

class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def dups
        hash = Hash.new { |hash, key| hash[key] = [] }
        
        self.each_with_idex do |ele, i|
            hash[ele] << i
        end
        
        hash.select { |key, val| v.length > 1 }
    end

    def factorials_rec(n)

    end

    []

    0 = 1! 
    1 = 1! 
    2 - 1!
    3 = 2!
end

