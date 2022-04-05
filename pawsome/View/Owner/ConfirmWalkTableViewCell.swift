//
//  ConfirmWalkTableViewCell.swift
//  Pawsome
//
//  Created by Roch on 3/31/22.
//

import UIKit

class ConfirmWalkTableViewCell: UITableViewCell {

    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var walkerImageView: UIImageView!
    @IBOutlet weak var walkerNameLabel: UILabel!
    
    @IBOutlet weak var walkerAmount: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    var walkRequest: WalkRequest! {
        didSet {
            setupData()
        }
    }
    
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
    
    private func setupData() {
        walkerImageView.setImage(urlString: walkRequest.walker?.formatted_image_url)
        walkerNameLabel.text = walkRequest.walker?.name
        walkerAmount.isHidden = true
        dateLabel.text = "Walk At: " + (walkRequest.notice?.requested_date_time ?? "")
        timeLabel.isHidden = true
        durationLabel.isHidden = true
    }

}
