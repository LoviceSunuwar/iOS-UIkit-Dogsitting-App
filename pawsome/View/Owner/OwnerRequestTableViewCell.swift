//
//  OwnerRequestTableViewCell.swift
//  Pawsome
//
//  Created by Roch on 3/31/22.
//

import UIKit

class OwnerRequestTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    var walkRequest: WalkRequest! {
        didSet {
            setupData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupViews()
    }
    
    private func setupViews() {
        backGroundView.setBorder()
    }
    
    private func setupData() {
        titleLabel.text = "You’ve requested \(String(describing: walkRequest.walker?.name ?? "") ) for a walk."
        amountLabel.isHidden = true
        statusLabel.text = (walkRequest.owner_approved_at?.isEmpty ?? true) && (walkRequest.owner_rejected_at?.isEmpty ?? true) ? "Pending" : !(walkRequest.owner_rejected_at?.isEmpty ?? true) ? "Declined" : "Approved"
        
        if statusLabel.text == "Declined" {
            statusLabel.backgroundColor =  UIColor(hexString: "#D81C3B")
        } else if statusLabel.text == "Approved"  {
            statusLabel.backgroundColor =  UIColor(hexString: "#41B45C")
        } else {
            statusLabel.backgroundColor =  UIColor(hexString: "#F8B927")
        }
    }
    
}
