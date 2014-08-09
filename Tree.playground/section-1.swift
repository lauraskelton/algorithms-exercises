// Recursion Exercises
// Tree Sum

class Stack<AnyObject> {
    var stackArray = [AnyObject]()
    
    func push(object:AnyObject) {
        stackArray.append(object)
    }
    
    func pop() -> AnyObject? {
        if self.stackArray.count < 1 {
            return nil
        }
        return stackArray.removeLast()
    }
    
    func peek() -> AnyObject? {
        return stackArray.last
    }
}

class RightStack {
    var nodeStack = Stack<Node>()
    var depthStack = Stack<Int>()
    
    func push(node: Node, depth: Int) {
        nodeStack.push(node)
        depthStack.push(depth)
    }
    
    func pop() -> (node: Node, depth: Int)? {
        if let node = nodeStack.pop() {
            if let depth = depthStack.pop() {
                return (node,depth)
            }
        }
        return nil
    }
}

class Node {
    var value : Int
    var l : Node?
    var r : Node?
    
    init (_ value: Int, _ l: Node? = nil, _ r: Node? = nil) {
        self.value = value
        self.l = l
        self.r = r
    }
    
    /*
    var description: String {
        return treeDescription(self)
    }
*/
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

func sumTail(tree: Node, stack: Stack<Node> = Stack<Node>(), sumSoFar: Int = 0) -> Int {
    if let right = tree.r {
        // add the right to the stack to process later
        stack.push(right)
    }
    
    let newSum = sumSoFar + tree.value
    
    if let left = tree.l {
        return sumTail(left, stack: stack, sumSoFar: newSum)
    }
    if let savedRight = stack.pop() {
        return sumTail(savedRight, stack: stack, sumSoFar: newSum)
    }
    return newSum
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


func treeDescription(tree: Node, stack: RightStack = RightStack(), stringSoFar: String = "", depth: Int = 0) -> String {
    
    println("depth: \(depth)")
    
    // add plus one for level of this node's children
    let nextDepth = depth + 1
    // x
    if let right = tree.r {
        // add the right to the node stack to process later
        // save the depth of this right node to the depth stack
        // so we can calculate the depth change later
        // once we reach a left leaf
        stack.push(right, depth: nextDepth)
        println("saved depth: \(nextDepth)")
    }
    
    // A
    if let left = tree.l {
        
        // comma
        return treeDescription(left, stack: stack, stringSoFar: stringSoFar + "Node(\(tree.value)" + ",", depth: nextDepth)
    }
    
    // B
    if let (savedRight, savedDepth) = stack.pop() {
        var closeParens = ""
        for i in savedDepth...depth {
            // add a close parenthesis for each level of depth change
            closeParens += ")"
        }

        
        // comma
        return treeDescription(savedRight, stack: stack, stringSoFar: stringSoFar + "Node(\(tree.value)" + closeParens + ",", depth: savedDepth)
    }
    
    var closeParens = ""
    for i in 0...depth {
        // add a close parenthesis for each level of depth change
        closeParens += ")"
    }
    
    // C
    // no comma because this is the final leaf
    return stringSoFar + "Node(\(tree.value)" + closeParens
}


let tree1 : Node = Node(1, Node(2,Node(3),Node(4)), Node(5,Node(6),Node(7)))

let tree2: Node = Node(1,Node(2,Node(3)),Node(4))

//sum(tree2)
//sum(tree1)

//println("tree1")
//printTree(tree1)
//println("tree2")
//printTree(tree2)

//sumTail(tree2)
//sumTail(tree1)

println(treeDescription(tree1))










