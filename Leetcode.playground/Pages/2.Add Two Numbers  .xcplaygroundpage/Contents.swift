
import Foundation
import XCTest

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var currentNode1 = l1!
        var currentNode2 = l2!
        var currentSum = currentNode1.val + currentNode2.val
        var preNodeSum = currentSum
        var forwardNode = ListNode.init(currentSum%10)
        let rootNode = forwardNode
        
        while currentNode1.next != nil || currentNode2.next != nil {
            if currentNode1.next != nil {
                currentNode1 = currentNode1.next!
            } else {
                currentNode1.val = 0
            }
            if currentNode2.next != nil {
                currentNode2 = currentNode2.next!
            } else {
                currentNode2.val = 0
            }
            
            currentSum = preNodeSum/10 + currentNode1.val + currentNode2.val
            forwardNode.next = ListNode.init(currentSum%10)
            forwardNode = forwardNode.next!
            preNodeSum = currentSum
        }
        if preNodeSum/10 > 0 {
            forwardNode.next = ListNode.init(preNodeSum/10)
        }
        
        return rootNode
    }
}

class MyTests : XCTestCase {
    func test1() {
    }
}

TestRunner().runTests(testClass: MyTests.self)
