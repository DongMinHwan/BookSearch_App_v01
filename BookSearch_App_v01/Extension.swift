//
//  Extension.swift
//  BookSearch_App_v01
//
//  Created by DongMin Hwang on 2023/03/14.
//

import UIKit


extension CGFloat {
    var adjusted: CGFloat {
        let ratio: CGFloat = UIScreen.main.bounds.width / 375
        return self * ratio
    }
}

extension Double {
    var adjusted: CGFloat {
        let ratio: CGFloat = UIScreen.main.bounds.width / 375
        return CGFloat(self) * ratio
    }
}


extension UIScreen {
  /// - Mini, SE: 375.0
  /// - pro: 390.0
  /// - pro max: 428.0
  var isWiderThan375pt: Bool { self.bounds.size.width > 375 }
}
