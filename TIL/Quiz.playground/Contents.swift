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
