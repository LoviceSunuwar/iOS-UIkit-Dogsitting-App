//
//  OwnersPostTableViewCell.swift
//  Pawsome
//
//  Created by Roch on 4/4/22.
//

import UIKit

class OwnersPostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var postNameLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var postDescriptionLabel: UILabel!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var postImageView: UIImageView!
    
    
    var post: Notice! {
        didSet {
            setupData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    private func setupViews() {
        backGroundView.setBorder()
        postButton.setRoundedBorder()
        postImageView.set(cornerRadius: 20)
    }
    
    private func setupData() {
        postNameLabel.text = post.animal?.animal_name ?? ""
        postDateLabel.text = post.requested_date_time ?? ""
        postDescriptionLabel.text = post.notice_description ?? ""
        postImageView.setImage(urlString: post.animal?.animal_image_url)
    }

}
