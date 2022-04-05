//
//  WalkDetailViewController.swift
//  Pawsome
//
//  Created by Roch on 04/04/2022.
//

import UIKit

class WalkDetailViewController: UIViewController {
    
    var walkRequest:WalkRequest!
    var walkRequestService = WalkRequestService()
    
    @IBOutlet weak var walkerName: UILabel!
    @IBOutlet weak var walkDate: UILabel!
    @IBOutlet weak var walkTime: UILabel!
    @IBOutlet weak var walkDuration: UILabel!
    
    @IBOutlet weak var cancelWalkBtn: UIButton!
    @IBOutlet weak var viewButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var instructionStack: UIStackView!
    
    @IBOutlet weak var walkerImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupData()
        viewButton.setTitle("View \(walkRequest.walker?.name ?? "")'s profile", for: .normal)
        instructionStack.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.title = "Walk Details"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.title = ""
    }
    
    private func setupData() {
        walkerName.text = walkRequest.walker?.name
        walkDate.text = walkRequest.notice?.requested_date_time
        walkerImageView.setImage(urlString: walkRequest.walker?.formatted_image_url)
    }
    
    @IBAction func viewProfilHandler(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WalkerProfileViewController") as! WalkerProfileViewController
        vc.walker = walkRequest.walker
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func cancelWalkHandler(_ sender: UIButton) {
        walkRequestService.ownerCancelWalk(walkId: String(walkRequest.id)){success, message in
            self.alert(message: message, title: nil){
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func chatHandler(_ sender: UIButton) {
        
    }
    
}
