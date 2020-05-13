import Foundation

func fibonacci(n: Int) {
    var res: [Int] = []
    for number in 0..<n {
        if number < 2{
            res.append(number)
        } else {
            let sum = res[number-2] + res[number-1]
            res.append(sum)
        }
    }
    print(res)
}

fibonacci(n: 10)
