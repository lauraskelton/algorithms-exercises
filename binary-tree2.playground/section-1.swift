


class BinaryTree {
    var data: Int?
    var left: BinaryTree?
    var right: BinaryTree?
    
    init (n: Int?) {
        self.data = n
    }
    
    convenience init() {
        self.init(n:nil)
    }
    
    func insert (n: Int) {
        switch(self.data, self.left, self.right) {
        case let (.None, _, _):
            self.data = n
        case var (_, .Some(l), _) where data < n:
            l.insert(n)
        case let (_, .None, _) where data < n:
            self.left = BinaryTree(n:n)
        case let (_, _, .Some(r)) where data >= n:
            r.insert(n)
        case let (_, _, .None) where data >= n:
            self.right = BinaryTree(n:n)
        case (_, _, _):
            break
        }
    }
}


let tree = BinaryTree()
tree.insert(5)
tree.insert(2)
tree.insert(8)
tree.insert(11)