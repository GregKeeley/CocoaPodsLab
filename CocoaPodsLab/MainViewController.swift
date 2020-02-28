//
//  ViewController.swift
//  CocoaPodsLab
//
//  Created by Gregory Keeley on 2/28/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainView = MainView()
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.largeContentTitle = "Greg"
        return cell
    }
    
    
}

extension MainViewController: UITableViewDelegate {
    
}
