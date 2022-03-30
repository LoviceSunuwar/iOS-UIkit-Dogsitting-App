//
//  WalkersListViewController.swift
//  pawsome
//
//  Created by Nisha Bhattarai on 2022-03-29.
//

import UIKit

class OwnerDashboardViewController: UIViewController {
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
////        return OwnerPostList.count
//        return 2
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = walkersListTableView.dequeueReusableCell(withIdentifier: "walkersListCell") as! WalkersListTableViewCell
//        cell.setWalkerListCell(walkerListObj: WalkersDetailsList[0])
//        return cell
//
//    }
    
    
    
    @IBOutlet weak var walkersListTableView: UITableView!
    @IBOutlet weak var navBar: UINavigationBar!
    
    var walkerList = [Walker]();
    var walkerService = WalkerService()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navBar.topItem?.title = "Walkers List"
        
//        WalkersDetailsList.append(WalkersList(walkerName: "Rozy Rana", rating: "4.4", walkerImage: "person.fill", walkerBio: "This is walker's bio!"))
        
        walkersListTableView.delegate=self
        walkersListTableView.dataSource=self
        self.walkersListTableView.rowHeight = 250;
        
        walkerService.getAllWalker(){success, message, data in
            self.walkerList = data
            self.walkersListTableView.reloadData()
        }
        
    }
    
    @IBAction func logoutHandler(_ sender: UIBarButtonItem) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "username")
        appDelegate.goToLoginPage();
    }
    
}

//MARK: UITABLEVIEWDATASOURCE
extension OwnerDashboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return walkerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = walkersListTableView.dequeueReusableCell(withIdentifier: "walkersListCell") as! WalkersListTableViewCell
        cell.setWalkerListCell(walkerListObj: walkerList[indexPath.row])
        return cell
    }
    
    
}

//MARK: UITABLEVIEWDELEGATE
extension OwnerDashboardViewController: UITableViewDelegate {
    
}

