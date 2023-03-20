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
    
    let label = UILabel().then {
        $0.text = "황동민"
        $0.font = .systemFont(ofSize: 25)
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
        thirdView.addSubview(label)
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
        
        label.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.width.height.equalTo(80)
            
        }
    }
}

