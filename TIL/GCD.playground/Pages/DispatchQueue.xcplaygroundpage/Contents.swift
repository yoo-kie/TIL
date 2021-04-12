//: [Previous](@previous)

import Foundation

/*:
 # DispatchQueue
 An object that manages the execution of tasks serially or concurrently on your app's main thread or on a background thread.
 
 # Serial
 한 사람이 여러 작업들을 하나씩 처리 one by one
 
 # Concurrent
 한 사람이 여러 작업들을 우선순위에 따라
 
 # GCD 시스템은 어떤 작업을 진행 중인가요-!
 Except for the dispatch queue representing your app's main thread, the system makes no guarantees about which thread it uses to execute a task.
 
 # 간략한 GCD를 효율적으로 쓰는 법
 create private concurrent dispatch queue for concurrent tasks execution
 -> run out of thread
 -> submit tasks to one of the global concurrent dispatch queues
 
 # Grand Dispatch Queue 종류
 ## dispatch_queue_main_t
 ## dispatch_queue_global_t
 ##
 
 공장 = 코어
 라인 = 스레드
 라인에 접근 하는 주소 = 메모리
 */

let count: Int = 300

// Thread <- Queue(Tasks)

/*
// 1. Serial - async
let serialQueue1 = DispatchQueue(label: "gaegul")

// serial한 gaegul에서는 async로 했을 때 아래 🐸(gaegul)과 ⭐️(main)이 섞여 나오고(비동기라는 것)
// ❤️는 🐸과 같은 gaegul이라는 serial queue에 할당되기 때문에 동시에 출력되지 않음(one by one)

// gaegul queue  : ⭐️ ❤️
// main queue    :  🐸
// gaegul thread :  ⭐️ ❤️
// main thread   :  🐸

// gaegul queue
serialQueue1.async {
    (0..<count).forEach {
        print("⭐️ \($0) >> ", Thread.current.threadName)
    }
}

// gaegul queue
serialQueue1.async {
    (0..<count).forEach {
        print("❤️ \($0) >> ", Thread.current.threadName)
    }
}

// main queue
(0..<count).forEach {
    print("🐸 \($0) >> ", Thread.current.threadName)
}
*/

/*
// 2. Serial - sync
let serialQueue2 = DispatchQueue(label: "gaegul")

// Serial에 sync로 돌리면 gaegul이던 main이던 다른 스레드던간에 순서대로(동기적으로) 출력됨

// gaegul queue :  ⭐️ ❤️
// main queue   :  🐸
// main thread  :  ⭐️ ❤️ 🐸

// gaegul
serialQueue2.sync {
    (0..<count).forEach {
        print("⭐️ \($0) >> ", Thread.current.threadName)
    }
}

// gaegul
serialQueue2.sync {
    (0..<count).forEach {
        print("❤️ \($0) >> ", Thread.current.threadName)
    }
}

// main
(0..<count).forEach {
    print("🐸 \($0) >> ", Thread.current.threadName)
}
*/

/*
// 3. Concurrent - sync
let concurrentQueue1 = DispatchQueue.global(qos: .default)

// Concurrent도 Serial과 마찬가지로 sync로 돌리면 gaegul이던 main이던 다른 스레드던간에 순서대로(동기적으로) 출력됨

// gaegul queue :  ⭐️ ❤️
// main queue   :  🐸
// main thread  :  ⭐️ ❤️ 🐸

// gaegul
concurrentQueue1.sync {
    (0..<count).forEach {
        print("⭐️ \($0) >> ", Thread.current.threadName)
    }
}

// gaegul
concurrentQueue1.sync {
    (0..<count).forEach {
        print("❤️ \($0) >> ", Thread.current.threadName)
    }
}

// main
(0..<count).forEach {
    print("🐸 \($0) >> ", Thread.current.threadName)
}
*/

/*
// 4. Concurrent - async
let concurrentQueue2 = DispatchQueue.global(qos: .default)
// concurrent는 완료를 기다리지 않음

// serial한 gaegul에서는 async로 했을 때 아래 🐸(gaegul)과 ⭐️(main)이 섞여 나오고(비동기라는 것)
// ❤️는 🐸과 같은 gaegul이라는 queue에 할당되기 때문에 동시에 출력되지 않음
// 하지만 concurrent에서는 async로 했을 때 같은 queue에 있는 ⭐️과 ❤️도 섞여 나옵니다.
 
// gaegul queue   : ⭐️ ❤️
// main queue     : 🐸
// default thread : ⭐️ ❤️
// main thread    : 🐸 
 
// gaegul
concurrentQueue2.async {
    (0..<count).forEach {
        print("⭐️ \($0) >> ", Thread.current.threadName)
    }
}

// gaegul
concurrentQueue2.async {
    (0..<count).forEach {
        print("❤️ \($0) >> ", Thread.current.threadName)
    }
}

// main
(0..<count).forEach {
    print("🐸 \($0) >> ", Thread.current.threadName)
}
*/

// 정리
// Serial : 은행 대기줄 1줄
// Concurrent : 은행 대기줄 n줄
// Syncronous : 은행원이 멀티태스팅이 안 됨(ex. "잠시만요...이 분꺼 처리하고 해드릴게요...")
// Asyncronous : 은행원이 멀티태스킹이 됨(ex. "다 드루와 드루와-!")

//: [Next](@next)
