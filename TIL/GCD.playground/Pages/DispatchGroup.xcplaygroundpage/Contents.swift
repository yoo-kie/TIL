//: [Previous](@previous)

import Foundation

/*:
 # DispatchGroup
 여러 작업을 하나의 작업으로 묶는 것
 다양한 큐에 할당되는 작업들을 group으로 지정하고 묶어서 해당 작업들이 모두 완료됐을 때 notify를 받음.
 ## enter
 group에 해당 작업을 추가
 ## leave
 작업이 완료되는 시점
 ** 여기에서 enter와 leave는 쌍을 이뤄야 합니다.
 ## notify
 모두 group 내 작업들이 완료되는 시점
 ## defer블록
 enter와 leave 정리
 함수 내 비동기를 전부 group으로 묶고 클로저 블록을 벗어날 때를 감지하는 defer에 leave를 작성해주면 깔끔하다.
 */

let backgroundQueue = DispatchQueue.global(qos: .background)
let mainQueue = DispatchQueue.main

let count = 100

let group = DispatchGroup()

backgroundQueue.async(group: group) {
    (0..<count).forEach {
        print("❤️ \($0) >> ", Thread.current.threadName)
    }
}

backgroundQueue.async(group: group) {
    (0..<count).forEach {
        print("🐸 \($0) >> ", Thread.current.threadName)
    }
}

backgroundQueue.async {
    (0..<count).forEach {
        print("🤖 \($0) >> ", Thread.current.threadName)
    }
}

group.notify(queue: mainQueue) {
    print("Finish-!!!")
}

//: [Next](@next)
