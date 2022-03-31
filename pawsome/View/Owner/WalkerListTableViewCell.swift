//
//  WalkerListTableViewCell.swift
//  Pawsome
//
//  Created by Nhuja Shakya on 3/31/22.
//

import UIKit

class WalkerListTableViewCell: UITableViewCell {

    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var walkerImageView: UIImageView!
    @IBOutlet weak var walkerLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    var walker: Walker! {
        didSet {
            setupData()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupViews()
    }
    
    private func setupViews() {
        self.backGroundView.setBorder()
        self.walkerImageView.set(cornerRadius: 20)
    }
    
    private func setupData() {
        walkerLabel.text = walker.fullName
        bioLabel.text = walker.experience
    }

}
