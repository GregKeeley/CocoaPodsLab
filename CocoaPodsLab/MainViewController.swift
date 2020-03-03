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
    private var users = [User]() {
        didSet {
            DispatchQueue.main.async {
                self.mainView.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(UINib(nibName: "RandomUserCellNib", bundle: nil), forCellReuseIdentifier: "cell")
        getRandomUsers()
    }
    private func getRandomUsers() {
        APIClient.getRandomUsers() { [weak self] (results) in
            switch results {
            case .failure(let error):
                print("Error:\(error)")
            case .success(let usersData):
                DispatchQueue.main.async {
                    self?.users = usersData.results
                }
            }
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? RandomUserCell else {
            fatalError("Failed to dequeue as a randomUserCell")
        }
        let user = users[indexPath.row]
        cell.configureCell(for: user)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did select")
        let user = users[indexPath.row]
        let detailVC = DetailViewController(user: user)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
}
