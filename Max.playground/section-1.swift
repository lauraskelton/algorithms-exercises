// Recursion Exercises
// Max item in a list

func max (numbers:[Int], largest_so_far:Int) -> Int {
    if numbers.count == 0 {
        return largest_so_far
    }
    var next_num = numbers[0]
    var nextNumbers = numbers
    nextNumbers.removeAtIndex(0)
    if next_num > largest_so_far {
        return max(nextNumbers, next_num)
    }
    return max(nextNumbers, largest_so_far)
}

max([2,8,5,6,7,21,11], 0)

