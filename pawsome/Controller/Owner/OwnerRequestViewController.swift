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
    
    var walkRequestService = WalkRequestService()
    var walkRequests: [WalkRequest] = []

    @IBOutlet weak var tableView: UITableView!
    
    var request: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.getWalkRequests()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Requests Status"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = ""
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
    
    private func getWalkRequests() {
        walkRequestService.getWalkRequest { success, message, walkRequests in
            print(walkRequests)
            self.refreshControl.endRefreshing()
            if success {
                self.walkRequests = walkRequests
                self.reloadTableView()
            } else {
                self.alert(message: message, title: nil, okAction: nil)
            }
        }
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
        return walkRequests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OwnerRequestTableViewCell") as! OwnerRequestTableViewCell
        cell.walkRequest = walkRequests[indexPath.row]
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
