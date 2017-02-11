
import Foundation
import XCTest

// EXAM 4
//4. Median of Two Sorted Arrays
//There are two sorted arrays nums1 and nums2 of size m and n respectively.
//
//Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
//
//Example 1:
//nums1 = [1, 3]
//nums2 = [2]
//
//The median is 2.0
//Example 2:
//nums1 = [1, 2]
//nums2 = [3, 4]
//
//The median is (2 + 3)/2 = 2.5
// 1,2,3,4,5
class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var totalList = (nums1 + nums2).sorted(by: {$0 < $1})
        let middleIndex = totalList.count/2
        
        if totalList.count%2 != 0 {
            return Double(totalList[middleIndex])
        } else {
            return Double(totalList[middleIndex-1] + totalList[middleIndex])/2
        }
    }
}

class MyTests : XCTestCase {
    func test1() {
        let result = Solution().findMedianSortedArrays([1,2,5,8,9,10,16,31,67],[3,4,8,9,12,80])
        XCTAssertEqual(result, 9)
    }

    func test2(){
        let result = Solution().findMedianSortedArrays([8,9,16,31,67],[3,4,8,9,12,34,80])
        XCTAssertEqual(result, 10.5)
    }
}

TestRunner().runTests(testClass: MyTests.self)


