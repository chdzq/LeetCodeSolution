//: [Previous](@previous)
//: ### 3. Longest Substring Without Repeating Characters ###
//: Given a string, find the length of the **longest substring** without repeating characters.
//:
//:     Given "abcabcbb", the answer is "abc", which the length is 3.
//:     Given "bbbbb", the answer is "b", with the length of 1.
//:     Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.


import Foundation

class Solution {
    
    func find<T: Equatable>(item c: T, `in` array: [T], arrayCount count: Int, with range: Range<Array<T>.Index>) -> Array<T>.Index? {
        guard range.lowerBound < count else {
            return nil
        }
        
        for i in range.lowerBound ..< min(range.upperBound, count)  {
            let item = array[i]
            if item == c {
                return i
            }
        }
        return nil
    }

    func lengthOfLongestSubstring(_ s: String) -> Int {
        let characters = Array(s.characters)
        let count = s.characters.count
        guard count > 0 else {
            return 0
        }
        var step: (start: Int, end: Int, maxLength: Int) = (0, 1, 1)
        while step.end < count  {
            if let index = find(item: characters[step.end], in: characters, arrayCount: count, with: step.start ..< step.end) {
                step.maxLength = max(step.maxLength, step.end - step.start)
                step.start = index + 1
                step.end = step.end + 1
            } else {
                step.end = step.end + 1
            }
        }
        
        step.maxLength = max(step.maxLength, step.end - step.start)
        return step.maxLength
        
    }
}

//: ## 验证:

let solution = Solution()
let array = [("au", 2),
             ("abcabcbb", 3),
             ("bbbbb", 1),
             ("pwwkew", 3),
             ("", 0)]
array.forEach { (str, result) in
    assert(solution.lengthOfLongestSubstring(str) == result, "\"\(str)\" 执行结果不等于\(result)")
    print("\"\(str)\" 执行结果等于\(result)")
}


//: [Next](@next)

