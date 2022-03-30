//
//  OwnerViewController.swift
//  pawsome
//
//  Created by Nisha Bhattarai on 2022-03-29.
//

import UIKit

class WalkerDashboardViewController: UIViewController {
    
    @IBOutlet weak var ownerPostTableView: UITableView!
    
    var OwnerPostList = [OwnersPost]();
    let ownerService = OwnerService()
       var ownerList = [Owner]()
       var postedRequests = [OwnersPost]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ownerService.getAllOwner(){ success, messsage, data in
                   if success {
                       self.ownerList = data
                       print("owner2 ====> ", self.ownerList)
                       self.getPostedRequest()
                   }
               }
//        OwnerPostList.append(OwnersPost(ownerName: "Will", date: "Mar 3, 2022", image: "dogs_name_icon", description: "My dog Alice needs a walk! Is anybody available?"))
        
        ownerPostTableView.delegate=self
        ownerPostTableView.dataSource=self
        self.ownerPostTableView.rowHeight = 250;
    }
    

    // MARK: General Functions
        func getPostedRequest(){
            ownerService.getAllRequestPosts(){success, message, data in
                if success {
                    
                    self.postedRequests = data
                    
                    for (index,_) in self.postedRequests.enumerated() {
                        self.postedRequests[index].userName = self.ownerList.first(where: {$0._id == self.postedRequests[index].userId})?.fullName ?? ""
                    }
                    self.ownerPostTableView.reloadData()
                }
            }
        }

}

extension WalkerDashboardViewController:UITableViewDelegate {
    
}

extension WalkerDashboardViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postedRequests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ownerPostTableView.dequeueReusableCell(withIdentifier: "cell") as! OwnersPostViewCell
        cell.setOwnerPostCell(ownerPostObj: postedRequests[indexPath.row])
        return cell
        
    }
}
