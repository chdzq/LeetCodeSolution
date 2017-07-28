//: [Previous](@previous)
/*:
 >  Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 >
 > You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
    Given nums = [2, 7, 11, 15], target = 9,
 
    Because nums[0] + nums[1] = 2 + 7 = 9,
    return [0, 1]. */


class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int: Int] = [:]
        for i in 0 ..< nums.count {
            let item = nums[i]
            if let value = map[target - item] {
                return [i, value]
            } else {
                map[item] = i
            }
        }
        
        return []
    }
}

//: ## 验证:

let solution = Solution()
solution.twoSum([2, 7, 11, 15], 9)
let array = [([2, 7, 11, 15], 9, [0, 1]),
             ([], 3, []),
             ([1], 1, []),
             ([2, 1], 3, [0, 1]),
             ([3, 3, 4], 10, [])]
array.forEach { (array, target, result) in
    assert(solution.twoSum(array, target).sorted(by: <) == result.sorted(by: <), "数组\(array) 执行结果不等于\(result)")
    print("数组\(array) 执行结果等于\(result)")
}




//: [Next](@next)
