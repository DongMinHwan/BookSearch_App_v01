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

class ViewController: UIViewController {

    private lazy var v = MinaView()
    var testFloat : Float = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        print("sadfasdfsadfasdgasdg")
        view = v
        setBind()
    }

    
    func setBind() {
        v.uiSlider.rx.value.subscribe { value in
            print("value : \(value)")
            switch Float(value) {
            case 0 ..< 0.20:
                self.testFloat = 0
                
            case 0.22 ..< 0.50:
                self.testFloat = 0.35
            case 0.52 ..< 0.82 :
                self.testFloat = 0.68
            case 0.84 ..< 1.0 :
                self.testFloat = 1.0
            default :
                self.v.uiSlider.value = self.testFloat
            }
            
            self.v.uiSlider.value = self.testFloat
        }
        
       
    }

}

