import Foundation
import XCTest

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 {
            return s
        }
        var rowsString:Array<String> = []
        var index = -1
        var isSwitchToIncrement = true
        for c in s.characters {
            if index <= 0 {
                isSwitchToIncrement = true
            } else if index >= numRows-1 {
                isSwitchToIncrement = false
            }
            if isSwitchToIncrement {
                index += 1
            } else {
                index -= 1
            }
            if rowsString.indices.contains(index) {
                rowsString[index] += "\(c)"
            } else {
                rowsString.append("\(c)")
            }
        }
        
        return rowsString.joined()
    }
}


class MyTests : XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().convert("PAYPALISHIRING", 3),"PAHNAPLSIIGYIR")
    }
    func test2() {
        XCTAssertEqual(Solution().convert("ABCDE", 4),"ABCED")
    }
    func test3() {
        XCTAssertEqual(Solution().convert("PAYPALISHIRING", 4),"PINALSIGYAHRPI")
    }
    func test4() {
        XCTAssertEqual(Solution().convert("Apalindromeisaword,phrase,number,orothersequenceofunitsthatcanbereadthesamewayineitherdirection,withgeneralallowancesforadjustmentstopunctuationandworddividers.", 3),"Aiosrhem,tseoihartaaeeriwgrlasasnoctaoieplnrmiaodprs,ubroohreunefnttacneedhsmwynihrieto,iheeaalwnefrdutettpntainnwrdvdr.adew,anereqcustbaeeitdcntnlocojmsuuoddis")
    }
    func test5() {
        XCTAssertEqual(Solution().convert("AB", 1),"AB")
    }
    func test6() {
        XCTAssertEqual(Solution().convert("ABCD", 3),"ABDC")
    }
}

TestRunner().runTests(testClass: MyTests.self)

