//
//  DetailViewController.swift
//  CocoaPodsLab
//
//  Created by Gregory Keeley on 3/3/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var detailView = DetailView()
    override func loadView() {
        view = detailView
    }
    private var user: User
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        detailView.nameLabel.text = ("\(user.name.first) \(user.name.last)")
        detailView.fullAddressLabel.text = ("""
            \(user.location.street.number) \(user.location.street.name)
            \(user.location.city), \(user.location.state) \(user.location.postcode)
        """)
        detailView.phoneLabel.text = user.phone
        detailView.dobLabel.text = user.dob.date
    }
    



}
