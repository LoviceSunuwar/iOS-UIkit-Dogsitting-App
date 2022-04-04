//
//  OwnerRequestTableViewCell.swift
//  Pawsome
//
//  Created by Nhuja Shakya on 3/31/22.
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupViews()
    }
    
    private func setupViews() {
        backGroundView.setBorder()
    }
    
    private func setupData() {
        
    }

}
