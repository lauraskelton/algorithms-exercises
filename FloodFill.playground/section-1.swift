// Playground - noun: a place where people can play

import Foundation

enum CameFrom {
    case N
    case NW
    case NE
    case S
    case SW
    case SE
    case W
    case E
    case Nowhere
}

class Matrix {
    
    var M : [[String]]
    let dimensions: (rows: Int, columns: Int)
    
    init(rows: Int, columns: Int) {
        self.dimensions = (rows, columns)
        self.M = Matrix.generateMatrix(rows, columns)
    }
    
    class func generateMatrix(rows: Int, _ columns: Int) -> [[String]]{
        
        var Mret = [[String]](count:rows, repeatedValue: [String](count: columns, repeatedValue: "  "))
        /*
            for x in 0..<rows {
                
                for y in 0..<columns {

                    if arc4random_uniform(2) == 0 {
                         Mret[x][y] = "X"
                    }

            }
        
        }*/
        Mret[0][0] = "  "
        return Mret
    }
    
}


class ImageMatrix: Matrix {
    
    func isFilled (x: Int, _ y: Int) -> Bool {
        return M[x][y] == "X"
    }
    func fill(x: Int, _ y: Int) {
        M[x][y] = "X"
    }
    func isValidCoord(x: Int, _ y: Int) -> Bool {
        return x >= 0 && x < dimensions.rows && y >= 0 && y < dimensions.columns
    }
    
    func slowFloodFill(x: Int, _ y: Int) {
        if !isValidCoord(x, y) || isFilled(x, y) {
            return
        }
        
        fill(x, y)
        
        slowFloodFill(x+1, y-1)
        slowFloodFill(x+1, y)
        slowFloodFill(x+1, y+1)
        slowFloodFill(x-1, y-1)
        slowFloodFill(x, y-1)
        slowFloodFill(x-1, y)
        slowFloodFill(x-1, y+1)
        slowFloodFill(x, y+1)
    }
    
    func floodFill(x: Int, _ y: Int, from: CameFrom) {
        if !isValidCoord(x, y) || isFilled(x, y) {
            return
        }
        
        fill(x,y)
        
        switch from {
        case .N:
            floodFill(x+1, y-1, from: .NE)
            floodFill(x+1, y, from: .N)
            floodFill(x+1, y+1, from: .NW)
        case .E:
            floodFill(x-1, y-1, from: .SE)
            floodFill(x, y-1, from: .E)
            floodFill(x+1, y-1, from: .NE)
        case .S:
            floodFill(x-1, y-1, from: .SE)
            floodFill(x-1, y, from: .S)
            floodFill(x-1, y+1, from: .SW)
        case .W:
            floodFill(x-1, y+1, from: .SW)
            floodFill(x, y+1, from: .W)
            floodFill(x+1, y+1, from: .NW)
        case .SW:
            floodFill(x-1, y-1, from: .SE)
            floodFill(x-1, y, from: .S)
            floodFill(x-1, y+1, from: .SW)
            floodFill(x, y+1, from: .W)
            floodFill(x+1, y+1, from: .NW)
        case .NW:
            floodFill(x+1, y-1, from: .NE)
            floodFill(x+1, y, from: .N)
            floodFill(x-1, y+1, from: .SW)
            floodFill(x, y+1, from: .W)
            floodFill(x+1, y+1, from: .NW)
        case .SE:
            floodFill(x-1, y-1, from: .SE)
            floodFill(x-1, y, from: .S)
            floodFill(x-1, y+1, from: .SW)
            floodFill(x, y-1, from: .E)
            floodFill(x+1, y-1, from: .NE)
        case .NE:
            floodFill(x+1, y-1, from: .NE)
            floodFill(x+1, y, from: .N)
            floodFill(x+1, y+1, from: .NW)
            floodFill(x-1, y-1, from: .SE)
            floodFill(x, y-1, from: .E)
        case .Nowhere:
            floodFill(x+1, y-1, from: .NE)
            floodFill(x+1, y, from: .N)
            floodFill(x+1, y+1, from: .NW)
            floodFill(x-1, y-1, from: .SE)
            floodFill(x, y-1, from: .E)
            floodFill(x-1, y, from: .S)
            floodFill(x-1, y+1, from: .SW)
            floodFill(x, y+1, from: .W)
        }
    }
}


let matrix = ImageMatrix(rows: 15,columns: 15)
matrix.M

matrix.floodFill(7, 7, from: .Nowhere)

matrix.M




















