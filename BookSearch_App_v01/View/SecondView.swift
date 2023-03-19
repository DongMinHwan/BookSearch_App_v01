//
//  SecondView.swift
//  BookSearch_App_v01
//
//  Created by DongMin Hwang on 2023/03/19.
//

import UIKit
import SnapKit
import Then


class SecondView : UIView {
    
    let firstView = UIView().then {
        $0.backgroundColor = .red
    }
    
    let secondView = UIView().then {
        $0.backgroundColor = .black
    }
    
    let thirdView = UIView().then {
        $0.backgroundColor = .blue
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        setLayout()
    }
    
    func setup() {
        backgroundColor = .black
        addSubview(firstView)
        addSubview(secondView)
        addSubview(thirdView)
    }
    
    func setLayout() {
        
        firstView.snp.makeConstraints{ make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(200)
        }
        
        secondView.snp.makeConstraints{ make in
            make.top.equalTo(firstView.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(45)
            make.height.equalTo(200)
        }
        
        thirdView.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(200)
        }
    }
}

