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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        OwnerPostList.append(OwnersPost(ownerName: "Will", date: "Mar 3, 2022", image: "dogs_name_icon", description: "My dog Alice needs a walk! Is anybody available?"))
        
        ownerPostTableView.delegate=self
        ownerPostTableView.dataSource=self
        self.ownerPostTableView.rowHeight = 250;
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

extension WalkerDashboardViewController:UITableViewDelegate {
    
}

extension WalkerDashboardViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ownerPostTableView.dequeueReusableCell(withIdentifier: "cell") as! OwnersPostViewCell
        cell.setOwnerPostCell(ownerPostObj: OwnerPostList[0])
        return cell
        
    }
}
