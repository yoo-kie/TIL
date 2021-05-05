//: [Previous](@previous)

import UIKit
import WebKit

/*:
 # DispatchSemaphore
 비동기 코드를 동기처럼 사용할 때
 wait과 signal, counting value를 이용해서 리소스 접근을 제어함
 작업의 순서를 통제할 수 있음
 요청과 대기의 반복
 ## signal
 원하는 작업이 끝났음을 노티함
 ## wait
 원하는 작업이 끝나기 전까지 해당 라인에서 무한 대기를 타며 다음 소스는 실행되지 않음
 */

/*
let semaphore = DispatchSemaphore(value: 0)
let webView = WKWebView()
var userAgent = "default"

webView.evaluateJavaScript("navigator.userAgent") { (result, error) in
    guard let result = result else { return }
    userAgent = "UserAgent : \(result)"
    semaphore.signal()
}

semaphore.wait()
print(userAgent)
 */

let session = URLSession(configuration: .default)
let semaphore = DispatchSemaphore(value: 0)

let task = session.dataTask(with: URL(string: "https://itunes.apple.com/search?term=jack+johnson")!) {
  data, response, error in
  if let data = data {
    print("I've got data!")
    print(data)
  }
  semaphore.signal()
}

task.resume()
semaphore.wait()
print("end")

//: [Next](@next)
