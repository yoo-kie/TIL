//
//  PriorityViewController.swift
//  TIL
//
//  Created by 유연주 on 2021/05/24.
//

import UIKit

class PriorityViewController: UIViewController {

    /*
     - intrinsicContentSize : view의 본질적인 크기(width와 height)
     - content hugging : 최대 크기에 대한 제한
     - compression resistance : 최소 크기에 대한 제한
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // #1. Content Hugging 예제
        /*
         첫번째 상황 : label 2개가 SuperView와 서로에 대해 Constant 0을 가지고 있는 상황
         결과 : label에 대한 hugging priority를 정해달라고 경고가 뜬다.
         
         두번째 상황 : 좌측 label의 content hugging priority를 하나 더 높인 상황
         결과 : 좌측 label의 본질적인 크기에 맞춰 레이아웃이 설정됐다.
         */
        
        // #2. Compression Resistance 예제
        /*
         첫번째 상황 : button의 title이 길어서 본질적인 크기가 긴데 width가 그 크기보다 작게 제한되어 있는 상황
         결과 : button의 title이 width constant만큼 축소되어 ...으로 노출된다.
         
         두번째 상황 : button의 priority도 1000, width constraint의 priority도 1000인데 width의 priority를 999로 낮춘 상황
         결과 : button의 title 전체가 노출된다. 본질적인 크기에 맞춰 레이아웃이 설정됐다.
         */
         
         // #3. 결론
         /*
          - Content Hugging의 priority는 높을수록 본질적인 크기를 갖는다.
          - Compression Resistance의 priority는 낮을수록 본질적인 크기를 갖는다.
          */
    }

}
