//
//  SlantedView.swift
//  CocoaPodsLab
//
//  Created by Gregory Keeley on 3/3/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit
import SnapKit
import CollectionViewSlantedLayout

class SlantedView: UIView {
    
    public lazy var slantedCollectionView: UICollectionView = {
        let slantedSayout = CollectionViewSlantedLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: slantedSayout)
        return cv
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
        constraintsCV()
    }
    private func constraintsCV() {
        addSubview(slantedCollectionView)
        translatesAutoresizingMaskIntoConstraints = false
        slantedCollectionView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalTo(safeAreaLayoutGuide)
        }
    }
}
