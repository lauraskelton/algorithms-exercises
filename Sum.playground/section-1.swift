// Recursion Exercises
// Sum of items in a list

func listSum (numbers:[Int], sum_so_far:Int) -> Int {
    if numbers.count == 0 {
        return sum_so_far
    }
    var newSum = sum_so_far + numbers[0]
    var nextNumbers = numbers
    nextNumbers.removeAtIndex(0)
    return listSum(nextNumbers, newSum)
}

listSum([1,2,3,4,5], 0)
listSum([], 0)