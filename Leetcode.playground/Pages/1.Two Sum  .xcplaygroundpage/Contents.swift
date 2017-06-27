
import Foundation
import XCTest

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var hashMap = [Int: Int]()
        for i in 0..<nums.count {
            let num = nums[i]
            if let numberToFindIndex = hashMap[target - num] {
                return [numberToFindIndex,i]
            } else {
                hashMap[num] = i
            }
        }
        return []
    }
}

class MyTests : XCTestCase {

    func test1() {
        XCTAssertEqual(Solution().twoSum([2,3,4,5,6,7,8], 6), [0,2])
    }
}

TestRunner().runTests(testClass: MyTests.self)
