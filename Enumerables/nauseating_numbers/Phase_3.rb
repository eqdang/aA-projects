require "byebug"

# # Phase 3: Now we're having fun.

# # _____________________________________________________________________________
# # matrix_addition_reloaded
# # Write a method matrix_addition_reloaded that accepts any number of matrices as arguments. 
# The method should return a new matrix representing the sum of the arguments. Matrix addition 
# can only be performed on matrices of similar dimensions, so if all of the given matrices do not 
#     have the same "height" and "width", then return nil.

def matrix_addition(matrix1, matrix2)
    rows = matrix1.length #rows
    columns = matrix1[0].length #columns
    
    new_arr = Array.new(rows) { Array.new( columns, [] ) }
    matrix1.each_with_index do |row, row_idx|
        row.each_with_index do |ele, col_idx|
            new_arr[row_idx][col_idx] = ele + matrix2[row_idx][col_idx]
        end
    end
    new_arr
end

def matrix_addition_reloaded(*matrices)
    rows = matrices[0].length
    columns = matrices[0][0].length

    matrices.each do |matrix|  
        return nil unless matrix.length == rows                                 
        matrix.each do |row|
            return nil unless row.length == columns
        end
    end

    #new_arr = Array.new(rows) { Array.new( columns, [0])}
    matrices.inject { |matrix1, matrix2| matrix_addition(matrix1, matrix2) }
end

# # Examples
matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]  # 3 rows/width, 2 col/height
matrix_e = [[0 , 0], [12, 4], [6,  3]]
p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil


# # _____________________________________________________________________________
# # squarocol?
# # Write a method squarocol? that accepts a 2-dimensional array as an argument. The method should 
# return a boolean indicating whether or not any row or column is completely filled with the same element. 
# You may assume that the 2-dimensional array has "square" dimensions, meaning it's height is the same as it's width.

#     return true if grid.any? { |row| row.uniq.length == 1 }
#     return true if grid.transpose.any? { |col| col.uniq.length == 1 }
#     false

def squarocol?(two_d_arr)
    two_d_arr.each.with_index do |row, row_idx|
        return true if row.all? { |elm| row[0] == elm }

        # need to find if row1[i] == row2[i]
        # two_d_arr[0][0] == two_d_arr[1][0] == two_d_arr[2][0]
        row.each_with_index do |col_ele, col_idx|
            return true if two_d_arr.all? { |row| col_ele == row[col_idx] }
        end
    end   
    false
end

#Examples
p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true
p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true
p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false
p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true
p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false



# # _____________________________________________________________________________
# # squaragonal?
# # Write a method squaragonal? that accepts 2-dimensional array as an argument. 
# # The method should return a boolean indicating whether or not the array contains 
# # all of the same element across either of its diagonals. You may assume that the 
# # 2-dimensional array has "square" dimensions, meaning it's height is the same as it's width.

def squaragonal?(two_d_arr)
    # while i < row.length
    # need to find if row[0][0] == row[1][1] == row[2][2]
    # row[0][-1] == row[1][-2] == row[2][-3]
    
    (0...two_d_arr.length).all? do |index|
        # puts two_d_arr[index][index]
        two_d_arr[index][index] == two_d_arr[0][0] || two_d_arr[0][-1] == two_d_arr[index][-(index + 1)]
        # puts diagonal1 = two_d_arr[index][index]
        # puts diagonal2 = two_d_arr[index][index - 1]
        # puts index2 = (index - 1)
    end

end

# # Examples
p squaragonal?([[:x, :y, :o],
                [:x, :x, :x],
                [:o, :o, :x],
]) # true

p squaragonal?([[:x, :y, :o],
                [:x, :o, :x],
                [:o, :o, :x],
]) # true

p squaragonal?([[1, 2, 2, 7],
                [1, 1, 6, 7],
                [0, 5, 1, 7],
                [4, 2, 9, 1]    ,
]) # true

p squaragonal?([[1, 2, 2, 5],
                [1, 6, 5, 0],
                [0, 2, 2, 7],
                [5, 2, 9, 7],
 ]) # false 




# _____________________________________________________________________________
# # pascals_triangle
# # Pascal's triangle is a 2-dimensional array with the shape of a pyramid. The 
# top of the pyramid is the number 1. To generate further levels of the pyramid, 
# every element is the sum of the element above and to the left with the element 
# above and to the right. Nonexisting elements are treated as 0 when calculating 
# the sum. For example, here are the first 5 levels of Pascal's triangle:
# #       1
# #      1 1
# #     1 2 1
# #    1 3 3 1
# #   1 4 6 4 1
# # Write a method pascals_triangle that accepts a positive number, n, as an 
# argument and returns a 2-dimensional array representing the first n levels of 
# pascal's triangle.

def pascals_triangle(num)
    triangle = [[1]]
    (num-1).times do
        last_level = triangle[-1]
        triangle << new_level(last_level) 
    end
    triangle
end

def new_level(last_level) # [1,3,3,1] => [1,4,6,4,1]
    new_level = [1]
    (0...last_level.length - 1).each do |idx|
        left = last_level[idx]
        right = last_level[idx+1]
        sum = left + right
        new_level << sum
    end
    new_level << 1
end

p new_level([1,3,3,1])
p pascals_triangle(5)
# [   [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]   ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]