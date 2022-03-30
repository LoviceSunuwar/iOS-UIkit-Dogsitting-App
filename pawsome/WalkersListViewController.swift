//
//  WalkersListViewController.swift
//  pawsome
//
//  Created by Nisha Bhattarai on 2022-03-29.
//

import UIKit

class WalkersListViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
//        return OwnerPostList.count
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = walkersListTableView.dequeueReusableCell(withIdentifier: "walkersListCell") as! WalkersListTableViewCell
        cell.setWalkerListCell(walkerListObj: WalkersDetailsList[0])
        return cell
        
    }
    
    
    
    @IBOutlet weak var walkersListTableView: UITableView!
    
    var WalkersDetailsList = [WalkersList]();
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        WalkersDetailsList.append(WalkersList(walkerName: "Rozy Rana", rating: "4.4", walkerImage: "person.fill", walkerBio: "This is walker's bio!"))
        
        walkersListTableView.delegate=self
        walkersListTableView.dataSource=self
        self.walkersListTableView.rowHeight = 250;
        
        
        
    }


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

