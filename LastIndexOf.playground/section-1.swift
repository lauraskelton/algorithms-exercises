// Recursion Exercises
// Last Index of item in a list

func lastIndexOf (value:Int, numbers:[Int]) -> Int {
    
    return lastIndexWithIndex(value, numbers, -1, 0)

}

func lastIndexWithIndex (value:Int, numbers:[Int], foundIndex:Int, counter:Int) -> Int {
    if numbers.isEmpty {
        return foundIndex
    }
    var nextFound = foundIndex
    if numbers[0] == value {
        nextFound = counter
    }
    var nextNumbers = numbers
    nextNumbers.removeAtIndex(0)
    return lastIndexWithIndex(value, nextNumbers, nextFound, counter + 1)
}

lastIndexOf(3,[2,8,3,6,2,3,4,21])
