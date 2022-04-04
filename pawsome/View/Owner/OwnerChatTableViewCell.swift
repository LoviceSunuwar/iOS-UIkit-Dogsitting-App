//
//  OwnerChatTableViewCell.swift
//  Pawsome
//
//  Created by Nhuja Shakya on 3/31/22.
//

import UIKit

class OwnerChatTableViewCell: UITableViewCell {

    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var walkerImageView: UIImageView!
    @IBOutlet weak var walkerNameLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!
    @IBOutlet weak var lastMessageTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupViews()
    }
    
    private func setupViews() {
        setupImageView()
        backGroundView.setBorder()
    }
    
    private func setupImageView() {
        walkerImageView.set(cornerRadius: 20)
    }
    
    private func setupData() {
        
    }

}
