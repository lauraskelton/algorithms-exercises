// Recursion Exercises
// Sum of items in a list

// tail call
func listSumTail (numbers:[Int], sum_so_far:Int) -> Int {
    if numbers.count == 0 {
        return sum_so_far
    }
    var newSum = sum_so_far + numbers[0]
    var nextNumbers = numbers
    nextNumbers.removeAtIndex(0)
    return listSumTail(nextNumbers, newSum)
}

func listSum (numbers: [Int]) -> Int {
    if numbers.count == 0 {
        return 0
    }
    var nextNumbers = numbers
    var thisNum = nextNumbers.removeAtIndex(0)
    return thisNum + listSum(nextNumbers)
}

listSumTail([1,2,3,4,5], 0)
listSumTail([], 0)

listSum([1,2,3,4,5])

