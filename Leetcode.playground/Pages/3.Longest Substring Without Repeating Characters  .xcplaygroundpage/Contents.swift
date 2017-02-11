
import Foundation
import XCTest

//Given "abcabcbb", the answer is "abc", which the length is 3.
//Given "bbbbb", the answer is "b", with the length of 1.
//Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var longestLength = 0
        var fromIndex:String.CharacterView.Index
        var subString = ""
        var checkChar = ""
        
        for fullStringIndex in s.characters.indices[s.startIndex..<s.endIndex] {
            checkChar = String(s.characters[fullStringIndex])
            if subString.contains(checkChar) {
                longestLength = subString.characters.count > longestLength ? subString.characters.count:longestLength
                fromIndex = subString.index(after: subString.characters.index(of: s.characters[fullStringIndex])!)
                subString = subString.substring(from: fromIndex)
            }
            subString.append(checkChar)
        }
        
        return subString.characters.count > longestLength ? subString.characters.count:longestLength
    }
}

class MyTests : XCTestCase {
    func test1() {
            XCTAssertEqual(Solution().lengthOfLongestSubstring("tgtwmlickm"), 8)
    }
    
    func test2(){
        XCTAssertEqual(Solution().lengthOfLongestSubstring("xtdhqsfhwpuufneaevsqetsqtjvsxggucldsdizcavwfichoxafbtxtogogfxnzzacrgm"), 9)
        
    }
}

TestRunner().runTests(testClass: MyTests.self)

