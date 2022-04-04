//
//  WalkerListViewController.swift
//  Pawsome
//
//  Created by Roch on 3/31/22.
//

import UIKit

class WalkerListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .black
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        return refreshControl
    }()
    
    var walkerService = WalkerService()
    var walkers: [Profile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.getWalkers()
        
//        [[UILabel appearance] setFont:[UIFont fontWithName:@"Ubuntu-Regular" size:17.0]];
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Walkers' List"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = ""
    }
    
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.refreshControl = refreshControl
    }
    
    private func reloadTableView() {
        self.tableView.reloadData()
    }
    
    private func getWalkers() {
        walkerService.getAllWalker { success, message, walkers in
            self.refreshControl.endRefreshing()
            if success {
                self.walkers = walkers
                self.reloadTableView()
            } else {
                self.alert(message: message, title: nil, okAction: nil)
            }
        }
    }
    
    // MARK: pullToRefresh
    @objc private func pullToRefresh() {
        getWalkers()
    }
    
}

extension WalkerListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return walkers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WalkerListTableViewCell") as! WalkerListTableViewCell
        cell.walker = walkers[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WalkerProfileViewController") as! WalkerProfileViewController
        vc.walker = walkers[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension WalkerListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
