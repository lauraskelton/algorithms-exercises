// Recursion Exercises
// Tree Sum

class Node {
    var value : Int
    var l : Node?
    var r : Node?
    
    init (_ value: Int, _ l: Node?, _ r: Node?) {
        self.value = value
        self.l = l
        self.r = r
    }
    
    convenience init (_ value: Int) {
        self.init(value, nil, nil)
    }
    
    convenience init (_ value: Int, _ l: Node?) {
        self.init(value, l, nil)
    }
    
}

func sum(tree: Node) -> Int {
    if let left = tree.l {
        if let right = tree.r {
            return sum(left) + sum(right) + tree.value
        }
        return sum(left) + tree.value
    }
    return tree.value
}

func printTree(tree: Node) {
    println(tree.value)
    if let left = tree.l {
        printTree(left)
        if let right = tree.r {
            printTree(right)
        }
    }
}

let tree1 : Node = Node(1, Node(2,Node(3),Node(4)), Node(5,Node(6),Node(7)))

let tree2: Node = Node(1,Node(2,Node(3)),Node(4))


sum(tree2)
sum(tree1)

println("tree1")
printTree(tree1)
println("tree2")
printTree(tree2)
