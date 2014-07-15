// Recursion Exercises
// Wordplay

// Generate all the reorderings of a set of letters.
// eg. [e,d,v,y,r]

// for string of 1, there is 1 variation
// [e]

// for string of 2, there are 2 variations
// [[e,r], [r,e]]
// (2 times swap1 variations)


// swap 2 items
func swap2(letters2: [Character]) -> [[Character]] {
    var mutLetters = letters2
    var returnArray = [mutLetters]
    let second = mutLetters[1]
    mutLetters[1] = mutLetters[0]
    mutLetters[0] = second
    returnArray += mutLetters
    return returnArray
}

// for string of 3, there are 6 variations
// [[e,r,w],[r,e,w],[e,w,r],[w,e,r],[r,w,e][w,r,e]]
// (3 times swap2 variations)

// [e,r,w]  [r,e,w]  [w,e,r]
// [e,w,r]  [r,w,e]  [w,r,e]

// swap 3 items
func swap3(letters3: [Character]) -> [[Character]] {
    var returnArray : [[Character]] = []
    var mutLetters = letters3
    
    for index in 0..<3 {
        var thisArray = mutLetters
        let removed = thisArray.removeAtIndex(index)
        let twoArr = swap2(thisArray)
        for anArray in twoArr {
            var newArr = anArray
            newArr.insert(removed, atIndex: index)
            returnArray += newArr
        }
    }
    return returnArray
}

// for string of 4, there are 24 variations
// 6 variations for each of 4 letters
// (4 times swap3 variations)

// [e,r,w,x] [r,e,w,x] [w,e,r,x] [x,e,r,w]
// [e,r,x,w] [r,e,x,w] [w,e,x,r] [x,e,w,r]
// [e,w,r,x] [r,w,e,x] [w,r,e,x] [x,r,e,w]
// [e,w,x,r] [r,w,x,e] [w,r,x,e] [x,r,w,e]
// [e,x,w,r] [r,x,e,w] [w,x,r,e] [x,w,r,e]
// [e,x,r,w] [r,x,w,e] [w,x,e,r] [x,w,e,r]

// swap 4 items
func swap4(letters4: [Character]) -> [[Character]] {
    var returnArray : [[Character]] = []
    var mutLetters = letters4
    
    for index in 0..<4 {
        var thisArray = mutLetters
        let removed = thisArray.removeAtIndex(index)
        let threeArr = swap3(thisArray)
        for anArray in threeArr {
            var newArr = anArray
            newArr.insert(removed, atIndex: index)
            returnArray += newArr
        }
    }
    return returnArray
}

// for string of n, there are n times swap(n-1) variations

// swap n items
func swapn(letters: [Character]) -> [[Character]] {
    var returnArray : [[Character]] = []
    
    if letters.count < 2 {
        // return letters, because it is only variation
        return [letters]
    }
    
    // special case to swap 2 characters
    if letters.count == 2 {
        var thisArray = letters
        returnArray += thisArray
        let second = thisArray[1]
        thisArray[1] = thisArray[0]
        thisArray[0] = second
        returnArray += thisArray
        return returnArray
    }
    
    for index in 0..<letters.count {
        var thisArray = letters
        let removed = thisArray.removeAtIndex(index)
        let nArr = swapn(thisArray)
        for anArray in nArr {
            var newArr = anArray
            newArr.insert(removed, atIndex: index)
            returnArray += newArr
        }
    }
    return returnArray
}

func substr1(letters1: [Character]) -> [[Character]] {
    // special case: 1 character [a]
    // [a]
    return [letters1]
}

func substr2(letters2: [Character]) -> [[Character]] {
    // special case: 2 characters [a,b]
    // [notb, nota, a&b]
    return [[letters2[0]], [letters2[1]], letters2]
}

// this should actually cover both special cases as well

func substrn(letters: [Character]) -> [[Character]] {
    // 3 characters [a,b,c]
    var returnArray : [[Character]] = []
    returnArray += letters
    for index in 0..<letters.count {
        // in or out
        // already have in above, so remove it
        var thisArray = letters
        thisArray.removeAtIndex(index)
        returnArray += substrn(thisArray)
    }
    return returnArray
}
let testArr : [Character] = ["a","b","c"]

var substrings: [[Character]] = substrn(testArr)




//let testArr : [Character] = ["a","b","c","d"]

//var variations: [[Character]] = swapn(testArr)

//variations.count




