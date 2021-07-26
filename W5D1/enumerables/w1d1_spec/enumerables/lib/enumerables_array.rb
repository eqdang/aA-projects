require "byebug"

# Pre-Exercise Note
# From this point on, we will be using the command line and pry to test our code, navigate our computer, and perform many other amazing tasks.

# This means that we are not using repl.it anymore to test our code.

# Getting comfortable with these tools early will be very important in becoming an efficient developer. After learning them, these tools will make just about any operation you can think of faster than using a GUI and mouse.

# Iteration Exercises
# We're going to implement some Array methods. There are descriptions for each method, but it may help to also consult the official Ruby docs for Enumerable and Array. These are good resources in general, and useful reading during this first week.

# Note: Unlike in the prepwork, there are no specs to compare against. You'll have to test your code in pry.

# Learning Goals
# Be able to create directories and files from the command line
# Know how to extend classes
# Know how to use pry to test methods
# Be able to write methods that take a block as an argument
# Get comfortable reasoning about how enumerable methods work with arrays
# Start by opening the terminal and changing your directory to the Desktop using the cd command. Create a new directory for your work using the mkdir command and then open a new file in VS Code called enumerables.rb using the code command.




# Enumerable
# My Each
# Extend the Array class to include a method named my_each that takes a block, calls the block on every element of the array, and returns the original array. Do not use Enumerable's each method. I want to be able to write:

class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

#  # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end 
# # # => 1
# #      2
# #      3
# #      1
# #      2
# #      3

# p return_value  # => [1, 2, 3]




# My Select
# Now extend the Array class to include my_select that takes a block and returns a new array containing only elements that satisfy the block. Use your my_each method!
#class Array
    def my_select(&prc)
        new_arr = []
        self.my_each do |elm|
            if prc.call(elm)
                new_arr << elm
            end
        end
        new_arr
    end

# Example:
# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []


# My Reject
# Write my_reject to take a block and return a new array excluding elements that satisfy the block.

    def my_reject(&prc)
        new_arr = []
        self.my_each do |elm|
            if prc.call(elm) == false
                new_arr << elm
            end
        end
        new_arr
    end

# Example:
# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]



# My Any
# Write my_any? to return true if any elements of the array satisfy the block and my_all? to return true only if all elements satisfy the block.
    def my_any?(&prc)
        self.my_each do |elm|
            return true if prc.call(elm)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |elm|
            return false if prc.call(elm) == false
        end
        true
    end


# # Example:
# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true



# Array
# My Flatten
# my_flatten should return all elements of the array into a new, one-dimensional array. Hint: use recursion!

    def my_flatten
        flattened = [] 
        #self = [1, 2, 3, 4, [5, 6], [[7]], 8] -------flattened =[]
        self.my_each do |arr|
            if arr.is_a?(Array)
                arr.my_each do |elm|
                    flattened << elm
                end
            else
                flattened << arr
            end
        end
        debugger
        flat = true 
        flattened.my_each do |ele|
            if ele.is_a?(Array)
                flat = false
            end
        end
        return flattened if flat
        flattened.my_flatten
    end


# Example:
# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]



# My Zip
# Write my_zip to take any number of arguments. It should return a new array containing self.length elements. 
#Each element of the new array should be an array with a length of the input arguments + 1 and contain the merged elements at that index. 
#If the size of any argument is less than self, nil is returned for that location.

    def my_zip(*args)
        zipped = []
        self.each_with_index do |ele, idx|
            new_arr = [ele]
            args.each do |arg|
                new_arr << arg[idx]
            end
            zipped << new_arr
        end
        zipped
    end


# Example:
#self= [1, 2, 3 ]
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]




# My Rotate
# Write a method my_rotate that returns a new array containing all the elements of the original array in a rotated order. By default, the array should rotate by one element. If a negative value is given, the array is rotated in the opposite direction.

    def my_rotate(arg = 1)
        rotated = self.map {|elm| elm}
        #debugger
        if arg > 0
            arg.times do
                # last = rotated.pop
                first = rotated.shift
                rotated << first
            end    
        else 
            num_times = -arg
            num_times.times do
                last = rotated.pop
                #first = rotated.shift
                rotated.unshift(last)
                #rotated << last
            end    
        end
        rotated
    end

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

 

# My Join
# my_join returns a single string containing all the elements of the array, 
#separated by the given string separator. If no separator is given, an empty 
#string is used.

    def my_join(separator = "")
        new_str = ""
        self.each_with_index do |ch, idx|
            if idx != self.length() -1
                new_str += ch + separator
            else
                new_str += ch
            end
        end
        new_str
    end


# Example:

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"




# My Reverse
# Write a method that returns a new array containing all the elements of the original array in reverse order.

    def my_reverse
        reversed = []
        reverse = self.map{|v| v}
        self.length().times {reversed << reverse.pop}
        reversed
    end 

end
# Example:

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [1].my_reverse               #=> [1]



# Review
# Now that we're all warmed up, let's review the iteration exercises from the prepwork. Implement the following methods:

# #factors(num)
def factors(num)
    facts = []
    (1..num).each do |n|
        facts << n if num % n == 0
    end
    facts
end

# p factors(10)
# p factors(13)

class Array
    # #bubble_sort!(&prc) #mutates
    def bubble_sort!(&prc)
        return_arr = self
        prc ||= Proc.new{|num1, num2| num1 <=> num2}
        #return return_arr.sort! if prc == nil
        sorted = false
        while !sorted
            sorted = true
            return_arr[0...-1].each_with_index do |ele1, idx1|
                if prc.call(ele1, return_arr[idx1+1]) == 1
                    return_arr[idx1], return_arr[idx1+1] = return_arr[idx1+1], return_arr[idx1]
                    sorted = false
                end
            end
        end
        return_arr
    end
end

    p [1, 3, 2, 4, 5].bubble_sort!
    p [1, 3, 2, 4, 5, 7, 9].bubble_sort! { |num1, num2| num2**2 <=> num1**2}
        # order numbers based on descending sort of their squares
        
      #end

      
    # #bubble_sort(&prc) #does not mutate
    # def bubble_sort(&prc)
        
    # end


# #substrings(string)
def substrings(str)
    
end


# def subwords(word, dictionary)
#     some_words = []
#     word.each_char.with_index do |ch1, idx1|
#         word.each_char.with_index do |ch2, idx2|
#         end
#     end
# end



# Although these exercises are from the prepwork and come with specs, use this opportunity to practice your own testing skills. Write out each method, think of a few different example cases, and test out your code in pry.

# If you are having a tough time thinking of example cases, check out the specs. You can use those examples to test your solutions. Don't forget to move your enumerables_array.rb into a lib directory!
