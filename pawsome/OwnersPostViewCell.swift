//
//  OwnersPostViewCell.swift
//  pawsome
//
//  Created by Nisha Bhattarai on 2022-03-29.
//

import UIKit

class OwnersPostViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var ownerImg: UIImageView!
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var desc: UITextField!
    @IBOutlet weak var startChatButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setOwnerPostCell(ownerPostObj:OwnersPost)
    {
//        ownerName.text = "Hello"
//        print(ownerPostObj.ownerName)
        ownerName.text = ownerPostObj.ownerName;
        date.text=ownerPostObj.date
        desc.text=ownerPostObj.description
        ownerImg.image = UIImage(named: ownerPostObj.image)
        
    }
    
   
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
