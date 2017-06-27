import Foundation
import XCTest

class Solution {
    func reverse(_ x: Int) -> Int {
        var numString = String(String(x).characters.reversed())

        if x < 0 {
            numString = numString.replacingOccurrences(of: "-", with: "")
            numString = "-" + numString
        }
print(Int32.max)
        
        guard (Int32(numString) != nil) else {
            return 0
        }
        
        return Int(numString)!
    }
}

class MyTests : XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().reverse(30),3)
    }
    
    func test2(){
        XCTAssertEqual(Solution().reverse(0),0)
    }
    
    // 8223372036854775839 <- TestCase
    // 9385774586302733228 <- TestCase.reverse
    // 9223372036854775807 <- Int32.max
    func test3(){
        XCTAssertEqual(Solution().reverse(8223372036854775839),0)
    }
    
    //-9085774586302733229 <- TestCase
    //-9223372036854775809 <- TestCase.reverse
    //-9223372036854775808 <- Int32.min
    func test4(){
        XCTAssertEqual(Solution().reverse(-9085774586302733229),0)
    }
    
    func test5(){
        XCTAssertEqual(Solution().reverse(1000000003),0)
    }
    
    // 2147483647 <- Int32.max
    func test6(){
        XCTAssertEqual(Solution().reverse(2147483647),0)
    }
    
    //-2147483648 <- Int32.min
    func test7(){
        XCTAssertEqual(Solution().reverse(-2147483648),0)
    }
}

TestRunner().runTests(testClass: MyTests.self)
