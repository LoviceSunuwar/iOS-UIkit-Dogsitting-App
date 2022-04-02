//
//  WalkerConfirmWalkTableViewCell.swift
//  Pawsome
//
//  Created by Roch on 3/31/22.
//

import UIKit

class WalkerConfirmWalkTableViewCell: UITableViewCell {

    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var walkerImageView: UIImageView!
    @IBOutlet weak var walkerNameLabel: UILabel!
    
    @IBOutlet weak var walkerAmount: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupViews()
    }
    
    private func setupImageView() {
        walkerImageView.set(cornerRadius: 20)
        backGroundView.setBorder()
    }
    
    private func setupViews() {
        setupImageView()
    }

}
