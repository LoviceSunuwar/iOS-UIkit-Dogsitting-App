//
//  DogListTableViewCell.swift
//  Pawsome
//
//  Created by Roch on 3/31/22.
//

import UIKit

class DogListTableViewCell: UITableViewCell {

    var dog: Dog! {
        didSet {
            setupData()
        }
    }
    
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageSexLabel: UILabel!
    @IBOutlet weak var decriptionLabel: UILabel!
    @IBOutlet weak var dogImageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupViews()
    }
    
    private func setupViews() {
        dogImageview.set(cornerRadius: 20)
        backGroundView.setBorder()
    }
    
    private func setupData() {
        nameLabel.text = dog.name
        ageSexLabel.text = dog.sex + "-" + dog.age
        decriptionLabel.text = dog.description
        dogImageview.setImage(urlString: dog.image)
    }

}
