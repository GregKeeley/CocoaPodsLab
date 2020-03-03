//
//  DetailView.swift
//  CocoaPodsLab
//
//  Created by Gregory Keeley on 2/28/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

class DetailView: UIView {

    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var fullAddressLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var phoneLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var dobLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        constraintsNameLabel()
        constraintsFullAddressLabel()
        constraintsPhoneLabel()
        constraintsDOBLabel()
    }
    private func constraintsNameLabel() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(100)
            make.centerX.equalTo(center)
        }
    }
    private func constraintsFullAddressLabel() {
        addSubview(fullAddressLabel)
       
        fullAddressLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel).inset(40)
            make.centerX.equalTo(center)
        }
    }
    private func constraintsPhoneLabel() {
        addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { (make) in
            make.top.equalTo(fullAddressLabel).inset(80)
            make.centerX.equalTo(center)
        }
    }
    private func constraintsDOBLabel() {
        addSubview(dobLabel)
        dobLabel.snp.makeConstraints { (make) in
            make.top.equalTo(phoneLabel).inset(40)
            make.centerX.equalTo(center)
        }
    }
}
