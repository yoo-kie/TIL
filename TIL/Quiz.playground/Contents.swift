import UIKit

struct A {
    var plus: APlus?
}

struct APlus {
    var a: A?
    var x = 2
}

var a: A = A()
var plus: APlus = APlus()
plus.x = 5

// what's the final value of plus.x?
// struct는 프로퍼티로 재귀적인 retain cycle을 형성할 수 없음-!

var messages = [200:"OK", 404:"Not Found"]
var foo: (Int) -> String = { code in
    if code > 500 {
        return "Server"
    }
    return "Unknown"
}

let message = messages[300, default:foo(300)]

// what's the value of message?
// default에 대해 알아볼 것-!
