// Priority Queue - Min Heap

class minHeap {
    var leftSubtree : minHeap?
    var rightSubtree : minHeap?
    var value : Int?
    
    init(_ val:Int) {
        self.value = val
    }
    
    func insert(valueToAdd: Int) {
        if value == nil {
            value = valueToAdd
        } else if leftSubtree == nil {
            leftSubtree = minHeap(valueToAdd)
        } else if rightSubtree == nil {
            rightSubtree = minHeap(valueToAdd)
        }
    }
    
    func depth() -> Int {
        let leftmax = leftSubtree?.depth()
        let rightmax = rightSubtree?.depth()
        let maximum = max(leftmax?, rightmax?)
    }
}
