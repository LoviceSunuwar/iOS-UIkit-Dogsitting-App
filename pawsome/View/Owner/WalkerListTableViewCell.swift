//
//  WalkerListTableViewCell.swift
//  Pawsome
//
//  Created by Roch on 3/31/22.
//

import UIKit
import Cosmos

class WalkerListTableViewCell: UITableViewCell {

    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var walkerImageView: UIImageView!
    @IBOutlet weak var walkerLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    
    var walker: Profile! {
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
        walkerLabel.text = walker.name
        bioLabel.text = "\(walker.experience ?? 0) years experience"
        ratingView.rating = walker.average_rating ?? 0
        walkerImageView.setImage(urlString: walker.formatted_image_url)
    }

}
