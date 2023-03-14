//
//  MainView.swift
//  BookSearch_App_v01
//
//  Created by DongMin Hwang on 2023/03/04.
//

import UIKit
import SnapKit
import Then

class MinaView : UIView{
    
    
    let main = UIView().then {
        $0.backgroundColor = .white
    }
    
    let titleTopView = UIView().then {
        $0.backgroundColor = .green
    }
    
    let sliderView = UIView().then{
        $0.backgroundColor = .blue
    }
    let uiSlider = UISlider()
    let stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 60
    }
    let testButton = UIButton().then{
        $0.setTitle("0.7x", for: .normal)
        $0.setTitleColor(UIColor.gray, for: .normal)
    }
    let testButton01 = UIButton().then{
        $0.setTitle("1.0x", for: .normal)
        $0.setTitleColor(UIColor.gray, for: .normal)
    }
    let testButton02 = UIButton().then{
        $0.setTitle("1.5x", for: .normal)
        $0.setTitleColor(UIColor.gray, for: .normal)
    }
    let testButton03 = UIButton().then{
        $0.setTitle("2.0x", for: .normal)
        $0.setTitleColor(UIColor.gray, for: .normal)
    }
    
    let searchTextFiled = UITextField().then{
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        $0.layer.cornerRadius = 8
    }
    let searchButton = UIButton().then {
        $0.backgroundColor = .gray
        $0.setTitle("검색", for: .normal)
        $0.layer.cornerRadius = 8
    }
    
    let secondView = UIView().then {
        $0.backgroundColor = .red
    }
    let thridView = UIView().then {
        $0.backgroundColor = .blue
    }
    let fourhView = UIView().then {
        $0.backgroundColor = .yellow
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
        backgroundColor = .white
        addSubview(main)
        main.addSubview(titleTopView)
        titleTopView.addSubview(searchTextFiled)
        titleTopView.addSubview(searchButton)
        main.addSubview(sliderView)
        main.addSubview(secondView)
        main.addSubview(thridView)
        main.addSubview(fourhView)
        sliderView.addSubview(uiSlider)
        sliderView.addSubview(stackView)

        stackView.addArrangedSubview(testButton)
        stackView.addArrangedSubview(testButton01)
        stackView.addArrangedSubview(testButton02)
        stackView.addArrangedSubview(testButton03)
    }
    
    func setLayout(){
        
        main.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        titleTopView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(55)
        }
        
        searchTextFiled.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(10)
            make.height.equalTo(34)
        }
        
        searchButton.snp.makeConstraints{ make in
            make.top.bottom.equalTo(searchTextFiled)
            make.right.equalToSuperview().offset(-10)
            make.width.equalTo(35)
            make.left.equalTo(searchTextFiled.snp.right).offset(5)
        }
        
        secondView.snp.makeConstraints { make in
            make.top.equalTo(titleTopView.snp.bottom).offset(15)
            make.left.right.equalToSuperview().inset(15)
            make.height.equalTo(140)
        }
        
        thridView.snp.makeConstraints { make in
            make.top.equalTo(secondView.snp.bottom).offset(15)
            make.left.right.equalTo(secondView)
            make.height.equalTo(140)
        }
        
        fourhView.snp.makeConstraints { make in
            make.top.equalTo(thridView.snp.bottom).offset(15)
            make.left.right.equalTo(secondView)
            make.height.equalTo(140)
        }
        
        sliderView.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(150)
        }
//
        uiSlider.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(55)
        }

        stackView.snp.makeConstraints{ make in
            make.top.equalTo(uiSlider.snp.bottom).offset(15)
            make.left.right.equalTo(uiSlider)

        }
        
    }
}
