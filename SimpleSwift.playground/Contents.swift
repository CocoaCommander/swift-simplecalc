print("Welcome to the UW Calculator Playground")

func strToInt(str: String) -> Int {
    let ret = Int(str) ?? 0
    return ret
}

func calculate(_ args: [String]) -> Int {
    if args.count < 2 {
        return 0
    }
    if args.count == 3 {
        switch args[1] {
        case "+":
            return strToInt(str: args[0]) + strToInt(str: args[2])
        case "-":
            return strToInt(str: args[0]) - strToInt(str: args[2])
        case "*":
            return strToInt(str: args[0]) * strToInt(str: args[2])
        case "/":
            return strToInt(str: args[0]) / strToInt(str: args[2])
        case "%":
            return strToInt(str: args[0]) % strToInt(str: args[2])
        default:
            break
        }
    }
    switch args[args.count - 1] {
    case "count":
        return args.count - 1
    case "avg":
        var total = 0
        for i in 0...args.count - 1 {
            total += strToInt(str: args[i])
        }
        return total / (args.count - 1)
    case "fact":
        var total = 1;
        if strToInt(str: args[0]) > 0 {
            for i in 1...strToInt(str: args[0]) {
                total *= i
            }
        }
        return total
    default:
        return -1
    }
}

func calculate(_ arg: String) -> Int {
    var res: [String] = []
    var keyword: String = ""
    for j in arg {
        if j != " " {
            switch j {
            case "1"..."9", "+", "-", "/", "*", "%":
                res.append(String(j))
            default:
                keyword += String(j)
            }
        }
    }
    if keyword != "" {
        res.append(keyword)
    }
    return calculate(res)
}

print(calculate(["1", "2", "3", "4", "5", "avg"]))

// -------------------------------------------
// All of these expressions should return true
// if you have implemented calculate() correctly
//
calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1
calculate("5 % 3") == 2

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

// -------------------------------------------
// These are extra credit tests; commented out
// uncomment them to turn them on for evaluation

// Implement calculate([String]) and calculate(String)
// to handle negative numbers
/*
calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5
*/
 
// Implement calculate([String]) and calculate(String)
// to use floating-point values
/*
func calculate(_ args: [String]) -> Double {
    return -1.0
}
func calculate(_ arg: String) -> Double {
    return -1.0
}

calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5
*/
