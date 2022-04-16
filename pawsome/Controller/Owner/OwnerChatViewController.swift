//
//  OwnerChatViewController.swift
//  Pawsome
//
//  Created by Roch on 3/31/22.
//

import UIKit

class OwnerChatViewController: UIViewController {
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .black
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        return refreshControl
    }()
    
    @IBOutlet weak var tableView: UITableView!
    var chats:[String] = []
    
    var noticeService = NoticeService()
    var noticeList = [Notice]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Posts"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = ""
    }
    
    private func setupViews() {
        setupTableView()
        self.getChatData()
    }
    
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.refreshControl = refreshControl
    }
    
    private func reloadTableView() {
        self.tableView.reloadData()
    }
    
    private func getChatData() {
        refreshControl.endRefreshing()
        noticeService.getNotices(){success,message,notices in
            self.refreshControl.endRefreshing()
            if success {
                self.noticeList = notices
                self.reloadTableView()
            } else {
                self.alert(message: message, title: nil, okAction: nil)
            }
        }
    }
    
    @objc private func pullToRefresh() {
        getChatData()
    }
}

extension OwnerChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OwnersPostTableViewCell") as! OwnersPostTableViewCell
        cell.isOwner = true;
        cell.post = noticeList[indexPath.row]
        
        return cell
    }
    
    
}

extension OwnerChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
