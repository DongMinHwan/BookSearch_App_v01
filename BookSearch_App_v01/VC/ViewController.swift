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
import SnapKit

class ViewController: UIViewController {
  
    private lazy var v = MinaView()
    private let disposeBag = DisposeBag()
    var testFloat : Float = 0.0
    let step : Float = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        print("sadfasdfsadfasdgasdg")
        view = v
        setBind()
        setView()
    }
    
//    private enum Constant {
//       static let someViewSize = UIScreen.main.isWiderThan375pt ? CGSize(width: 360, height: 300) : CGSize(width: 300, height: 200)
//     }
    
    private enum Constant {
      static let someViewSize = UIScreen.main.isWiderThan375pt ? CGSize(width: 360, height: 300) : CGSize(width: 300, height: 200)
      static let otherViewWidthRatio = 0.6 // <-
      static let otherViewHeightRatio = 0.2 // <-
    }

//     private let someView: UIView = {
//       let view = UIView()
//       view.backgroundColor = .systemBlue
//       return view
//     }()

   //slider 기본 세팅
    
    func setView() {

        self.v.secondView.snp.removeConstraints()
        self.v.secondView.snp.remakeConstraints{ make in
            make.top.equalTo(v.titleTopView.snp.bottom).offset(15)
            make.left.right.equalToSuperview().inset(15)
            make.height.equalToSuperview().multipliedBy(Constant.otherViewHeightRatio)
        }
        self.v.thridView.snp.removeConstraints()
        self.v.thridView.snp.remakeConstraints{ make in
            make.top.equalTo(v.secondView.snp.bottom).offset(15)
            make.left.right.equalToSuperview().inset(15)
            make.height.equalToSuperview().multipliedBy(Constant.otherViewHeightRatio)
        }
        self.v.fourhView.snp.removeConstraints()
        self.v.fourhView.snp.remakeConstraints{ make in
            make.top.equalTo(v.thridView.snp.bottom).offset(15)
            make.left.right.equalToSuperview().inset(15)
            make.height.equalToSuperview().multipliedBy(Constant.otherViewHeightRatio)
        }
        
        self.v.sliderView.snp.removeConstraints()
        v.sliderView.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(25)
            make.height.equalToSuperview().multipliedBy(Constant.otherViewHeightRatio)
        }
    }
    func setBind() {
        
//        UIScreen.mainScreen().screen
        if DeviceManager.shared.isFourIncheDevices() {
            print("asdfasdf")
        }else {
            print("asdfasdf333")
            v.secondView.snp.updateConstraints{ make in
                make.top.equalTo(v.titleTopView.snp.bottom).offset(15)
            }
        }
        
        v.uiSlider.rx.value.subscribe { value in
            print("value : \(value)")
            self.setSlideValue(value)
            let roundValue = round(value / self.step) * self.step
            print("roundValue \(roundValue)")

        }.disposed(by: disposeBag)
        
        v.uiSlider.rx.tapGesture().when(.recognized).subscribe { value in
            print("value : \(value)")
//            let pointTapped: CGPoint = gestureRecognizer.locationInView(self.view)
            let pointTapped: CGPoint = value.location(in: self.view)
            

            let positionOfSlider: CGPoint = self.v.uiSlider.frame.origin
            let widthOfSlider: CGFloat = self.v.uiSlider.frame.size.width
            let newValue = ((pointTapped.x - positionOfSlider.x) * CGFloat(self.v.uiSlider.maximumValue) / widthOfSlider)
            self.setSlideValue(Float(newValue))
//            self.v.uiSlider.setValue(Float(newValue), animated: true)
        }.disposed(by: disposeBag)
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

