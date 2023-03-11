//
//  ViewController.swift
//  BookSearch_App_v01
//
//  Created by DongMin Hwang on 2023/03/04.
//

import UIKit
import RxCocoa
import RxSwift
import RxViewController
import RxGesture

class ViewController: UIViewController {

    private lazy var v = MinaView()
    var testFloat : Float = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        print("sadfasdfsadfasdgasdg")
        view = v
        setBind()
    }

   //slider 기본 세팅
    func setBind() {
        
        
        v.uiSlider.rx.value.subscribe { value in
            print("value : \(value)")
            self.setSlideValue(value)

        }
        
        v.uiSlider.rx.tapGesture().when(.recognized).subscribe { value in
            print("value : \(value)")
//            let pointTapped: CGPoint = gestureRecognizer.locationInView(self.view)
            let pointTapped: CGPoint = value.location(in: self.view)
            

            let positionOfSlider: CGPoint = self.v.uiSlider.frame.origin
            let widthOfSlider: CGFloat = self.v.uiSlider.frame.size.width
            let newValue = ((pointTapped.x - positionOfSlider.x) * CGFloat(self.v.uiSlider.maximumValue) / widthOfSlider)
            self.setSlideValue(Float(newValue))
//            self.v.uiSlider.setValue(Float(newValue), animated: true)
        }
    }
    
    func setSlideValue(_ value : Float) {
        print("value : \(value)")
        switch value {
        case 0 ..< 0.27:
            self.testFloat = 0
            //0.7x
        case 0.29 ..< 0.57:
            self.testFloat = 0.35
            //1.0x
        case 0.59 ..< 0.87 :
            self.testFloat = 0.68
            //1.5x
        case 0.89 ..< 1.1 :
            self.testFloat = 1.0
            //2.0x
        default :
            self.v.uiSlider.value = self.testFloat
        }
        
        self.v.uiSlider.value = self.testFloat
    }
    

}

