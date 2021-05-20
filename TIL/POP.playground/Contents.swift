import UIKit

protocol Ordered {
    func precedes(other: Self) // 다형성을 가지려면? // Ordered를 채택한 모든 타입
}

struct Number: Ordered {
    func precedes<T: Ordered>(other: T) {
        print("number", type(of: other))
    }
}

struct Gaegul: Ordered {
    func precedes<T: Ordered>(other: T) {
        print("gaegul", type(of: other))
    }
}

var num = Number()
var gaegul = Gaegul()
num.precedes(other: gaegul)

/*
 컴파일 타임에 타입이 결정될 수만 있다면 OK-!
 */

protocol Havi {
    func test(of: Self) // Sangjin
}

struct Sangjin: Havi {
    var text: String = "hello"
    
    func test(of value: Sangjin) {
        print(value.text)
    }
}

// ------------------------------------------------------

protocol Drawable {
    func draw(renderer: Renderer)
}

protocol Renderer {
    func moveTo()
    func lineTo()
    func circleAt()
    func arcAt(arc: String)
}

extension Renderer {
    func circleAt() {
        print("circleAt")
    }
}

struct TestRenderer: Renderer { // 추가된 메소드는 모두 구현을 해줘야 해요-! 싫어! 프로토콜 자체를 확장하자!
    func moveTo() {
        print("moveTo")
    }
    
    func lineTo() {
        print("lineTo")
    }
    
    func arcAt(arc: String) {
        print("arcAt")
    }
}

//extension TestRenderer {
//    func circleAt(center: CGPoint, radius: CGFloat) {
//        arcAt(arc: "circleAt")
//    }
//}

struct Bubble : Drawable {
    func draw(renderer r: Renderer) {
        r.arcAt(arc: "inner")
        r.arcAt(arc: "outer")
    }
}

struct Circle : Drawable {
    func draw(renderer r: Renderer) {
        r.arcAt(arc: "circle")
    }
}

/*
 Protocol Dispatch
 https://www.objc.io/quiz/3/
 https://www.objc.io/quiz/22/
 */

protocol A {
    func hi()
}

extension A {
    func hi() { print("hiA") }
    func bye() { print("byeA") }
}

struct B: A {
    func hi() { print("hiB") }
    func bye() { print("byeB") }
}

let b = B()
b.hi()
b.bye()

let a: A = B() // B -> hi만 접근
a.hi() // -> B
a.bye() // -> A 찾을 수 없다 static
