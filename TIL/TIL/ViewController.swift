//
//  ViewController.swift
//  TIL
//
//  Created by 유연주 on 2021/04/05.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var arr1: [Int] = [1, 2, 3, 4, 5]
        var arr2 = arr1
        // 1
        withUnsafePointer(to: &arr1) { address in
            print(address)
        }
        // 2
        withUnsafePointer(to: &arr2) { address in
            print(address)
        }

        arr2.append(2)
        // 3
        withUnsafePointer(to: &arr2) { address in
            print(address)
        }
    }

}
