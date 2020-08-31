require "byebug"

def uniq(arr)
    hash = Hash.new(0)

    arr.each { |ele| hash[ele] += 1 }

    hash.keys
end

# [1, 2, 1, 3, 3].uniq # => [1, 2, 3]

def two_sum(arr)
    pairs = []

    arr.each_with_index do |num, idx|
        arr.each_with_index do |num2, idx2|
            if num + num2 == 0 && idx2 > idx
                pairs << [idx, idx2]
            end
        end
    end
    pairs
end

def my_transpose(matrix)
    transposed = Array.new (matrix.length) { Array.new(matrix.length) }
    i = 0
    j = 0

    while i < matrix.length
        while j < matrix.length
            #debugger
            transposed[i][j] = (matrix[j][i])
            j += 1
        end
        i += 1
        j = 0
    end
    transposed
end
p my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])


