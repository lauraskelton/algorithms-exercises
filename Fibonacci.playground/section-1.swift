// Recursion Exercises
// Fibonacci


class fib {
    var cache: Dictionary<Int, Int>
    var arrayCache: [Int]
    
    init () {
        self.cache = [0:0,1:1]
        self.arrayCache = [0,1]
    }
    
    // Fibonacci
    func fibSimple(n:Int) -> Int {
        if n == 0 {
            return 0
        } else if n == 1 {
            return 1
        }
        return fibSimple(n-1) + fibSimple(n-2)
    }
    
    // Memoized
    func fib(n:Int) -> Int {
        if let cacheValue = cache[n] {
            return cacheValue
        } else {
            cache[n] = fib(n-1) + fib(n-2)
            return cache[n]!
        }
    }
    
    // Memoized Array
    func fibArr(n:Int) -> Int {
        if arrayCache.count <= n {
            arrayCache += fibArr(n-1) + fibArr(n-2)
        }
        return arrayCache[n]
    }
}

let myfib = fib()

// dictionary cache
myfib.fib(0)
myfib.fib(1)
myfib.fib(2)
myfib.fib(3)
myfib.fib(4)
myfib.fib(5)
myfib.fib(6)
myfib.fib(7)
myfib.fib(8)
myfib.fib(9)
myfib.fib(10)
myfib.fib(11)
myfib.fib(12)
myfib.fib(13)
myfib.fib(14)
myfib.fib(15)
myfib.fib(16)
myfib.fib(17)
myfib.fib(18)

for index in 1...92 {
    myfib.fib(index)
}
myfib.fib(92)



// array cache
myfib.fibArr(0)
myfib.fibArr(1)
myfib.fibArr(2)
myfib.fibArr(3)
myfib.fibArr(4)
myfib.fibArr(5)
myfib.fibArr(6)
myfib.fibArr(7)
myfib.fibArr(8)
myfib.fibArr(9)
myfib.fibArr(10)

for index in 1...92 {
    myfib.fibArr(index)
}
myfib.fibArr(92)





