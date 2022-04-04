//
//  OwnerRequestViewController.swift
//  Pawsome
//
//  Created by Roch on 3/31/22.
//

import UIKit

class OwnerRequestViewController: UIViewController {
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .black
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        return refreshControl
    }()

    @IBOutlet weak var tableView: UITableView!
    
    var request: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    private func setupViews() {
        setupTableView()
        getAllRequest()
    }
    
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.refreshControl = refreshControl
    }
    
    private func reloadTableView() {
        self.tableView.reloadData()
    }
    
    func getAllRequest() {
        refreshControl.endRefreshing()
        reloadTableView()
    }
    
    @objc private func pullToRefresh() {
        getAllRequest()
    }

}

extension OwnerRequestViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OwnerRequestTableViewCell") as! OwnerRequestTableViewCell
        
        return cell
    }
    
    
    
}

extension OwnerRequestViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
