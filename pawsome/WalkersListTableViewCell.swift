//
//  WalkersListTableViewCell.swift
//  pawsome
//
//  Created by Nisha Bhattarai on 2022-03-29.
//

import UIKit

class WalkersListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var walkerImage: UIImageView!
    @IBOutlet weak var walkerName: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var walkerBio: UITextField!
    @IBOutlet weak var startChatButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setWalkerListCell(walkerListObj:Walker)
    {
        walkerImage.image = UIImage(systemName: "person.fill")
        walkerName.text = walkerListObj.fullName
        rating.text = walkerListObj.price
        walkerBio.text = walkerListObj.email
        
    }
    
   
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
