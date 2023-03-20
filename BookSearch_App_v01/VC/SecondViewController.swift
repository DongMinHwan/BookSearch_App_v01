//
//  SecondViewController.swift
//  BookSearch_App_v01
//
//  Created by DongMin Hwang on 2023/03/19.
//

import UIKit
import PullUpController

class SecondViewController: PullUpController {
    
    enum InitialState {
        case contracted
        case expanded
    }
    
    private lazy var v = SecondView()
    public var portraitSize: CGSize = .zero
    public var landscapeFrame: CGRect = .zero
    
    private var safeAreaAdditionalOffset: CGFloat {
        hasSafeArea ? 20 : 0
    }
    var initialState: InitialState = .contracted
    var initialPointOffset: CGFloat {
        switch initialState {
        case .contracted:
            return UIScreen.main.bounds.size.height
            
        case .expanded:
            return pullUpControllerPreferredSize.height
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view = v
        print("first01 : \(safeAreaAdditionalOffset)")
        print("first02 : \(v.secondView.frame.height)" )
        
        portraitSize = CGSize(width: min(UIScreen.main.bounds.width, UIScreen.main.bounds.height),
                              height: v.thirdView.frame.maxY)
        landscapeFrame = CGRect(x: 5, y: 50, width: 280.0, height: 812)
    }
    
 
    
    override func pullUpControllerWillMove(to stickyPoint: CGFloat) {
//        print("will move to \(stickyPoint)")
    }
    
    override func pullUpControllerDidMove(to stickyPoint: CGFloat) {
//        print("did move to \(stickyPoint)")
    }
    
    override func pullUpControllerDidDrag(to point: CGFloat) {
//        print("did drag to \(point)")
    }
    
    override var pullUpControllerPreferredSize: CGSize {
        return portraitSize
    }
    
    override var pullUpControllerPreferredLandscapeFrame: CGRect {
        return landscapeFrame
    }
    
    override var pullUpControllerMiddleStickyPoints: [CGFloat] {
        print("initialState : \(initialState)")
        switch initialState {
        case .contracted:
            return [v.frame.maxY]
        case .expanded:
            return [v.thirdView.frame.maxY + safeAreaAdditionalOffset, v.firstView.frame.maxY]
        }
    }
    
    override var pullUpControllerBounceOffset: CGFloat {
        return 20
    }
    
    override func pullUpControllerAnimate(action: PullUpController.Action,
                                          withDuration duration: TimeInterval,
                                          animations: @escaping () -> Void,
                                          completion: ((Bool) -> Void)?) {
        switch action {
        case .move:
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 0,
                           options: .layoutSubviews,
                           animations: animations,
                           completion: completion)
        default:
            UIView.animate(withDuration: 0.3,
                           animations: animations,
                           completion: completion)
        }
    }
}
