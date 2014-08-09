import Foundation

class Matrix {
    
    var M : [[Int]]
    
    init(size: Int) {
        self.M = Matrix.generateMatrix(size)
    }
    
    func rotate1() {
        
        let n = M.count - 1
        var Mret = [[Int]](count:n+1, repeatedValue: [Int](count: n+1, repeatedValue: 0))
        
        for y in 0...n{
            
            for x in 0...n{
                
                Mret[x][n-y] = M[y][x]
            }
        }
        M = Mret
    }

    class func generateMatrix(size: Int) -> [[Int]]{
        
        var Mret = [[Int]](count:size, repeatedValue: [Int](count: size, repeatedValue: 0))
        for y in 0..<size {
            
            for x in 0..<size {
                
                Mret[y][x] = y*size + x
            }
        }
        
        return Mret
    }

    func rotateLarge() {
        
        let n = M.count - 1
        
        for y in 0...n {
            for x in 0...y {
                let tmp = M[x][y]
                M[x][y] = M[y][x]
                M[y][x] = tmp
            }
        }
        
        M

        for y in 0...n {
            for x in 0...Int(floor(Double(n)/2)) {
                let tmp = M[y][n-x]
                M[y][n-x] = M[y][x]
                M[y][x] = tmp
            }
        }
        
    }

}



let matrix = Matrix(size:8)
let M = matrix.M

matrix.rotateLarge()

let newM = matrix.M
let M2 = Matrix(size: 8)
M2.rotate1()

newM == M2.M

M2.M
newM




