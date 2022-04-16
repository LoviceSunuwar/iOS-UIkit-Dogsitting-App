//
//  OwnerConfirmWalkViewController.swift
//  Pawsome
//
//  Created by Roch on 3/31/22.
//

import UIKit

class OwnerConfirmWalkViewController: UIViewController {
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .black
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        return refreshControl
    }()

    var walkRequestService = WalkRequestService()
    var walkRequests: [WalkRequest] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    var confirmWalks: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.getAllConfirmRequest()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Confirmed Walks"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = ""
    }
    
    private func setupViews() {
        setupTableView()
    }
    
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.refreshControl = refreshControl
    }
    
    private func reloadTableView() {
        self.tableView.reloadData()
    }
    
    func getAllConfirmRequest() {
        walkRequestService.getWalkRequest { success, message, walkRequests in
            self.refreshControl.endRefreshing()
            if success {
                self.walkRequests = walkRequests.filter{($0.owner_rejected_at?.isEmpty ?? true)}
                self.reloadTableView()
            } else {
                self.alert(message: message, title: nil, okAction: nil)
            }
        }
    }
    
    @objc private func pullToRefresh() {
        getAllConfirmRequest()
    }

}

extension OwnerConfirmWalkViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return walkRequests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmWalkTableViewCell") as! ConfirmWalkTableViewCell
        cell.walkRequest = walkRequests[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WalkDetailViewController") as! WalkDetailViewController
        vc.walkRequest = walkRequests[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension OwnerConfirmWalkViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
