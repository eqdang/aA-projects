def merge_sort(arr)
    return [] if arr.length == 0
    return arr if arr.length == 1
    array_0 = []

    midpoint = arr.length / 2
    array_1 = arr[0..midpoint-1]
    array_2 = arr[midpoint..-1]

    sorted_left = merge_sort(array_1)
    sorted_right = merge_sort(array_2)

    merger(sorted_left, sorted_right)
end

def merger(array_1, array_2)
    sorted = []

    until array1.empty? || array_2.empty?
        if array_1.first < array_2.first
            sorted << array_1.shift
        else
            sorted << array_2.shift
        end
    end

    sorted + array_1 + array_2
end