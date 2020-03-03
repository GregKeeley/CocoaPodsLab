//
//  MainView.swift
//  CocoaPodsLab
//
//  Created by Gregory Keeley on 2/28/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit
import SnapKit

class MainView: UIView {

    public lazy var tableView: UITableView = {
        let table = UITableView()
        return table
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
        constraintsTableView()
    }
    private func constraintsTableView() {
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.bottom.top.leading.trailing.equalTo(safeAreaLayoutGuide)
        }
    }

}
