//
//  LaunchScreen.swift
//  BookSearch_App_v01
//
//  Created by DongMin Hwang on 2023/03/04.
//

import UIKit

class LaunchScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nextMove()
    }
    
    func nextMove(){
//        print("sdfadsf")
//        let vc = ViewController()
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: false)
//
//        let main = UIStoryboard(name: "Main", bundle: Bundle(for: type(of: self)))
//        window.rootViewController = main.instantiateInitialViewController()
        
        if let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window {
           // let main = UIStoryboard(name: "Main", bundle: Bundle(for: type(of: self)))
            let vc = ViewController()
            window.rootViewController = vc
        }
    }

}
