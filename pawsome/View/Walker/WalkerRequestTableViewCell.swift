//
//  WalkerRequestTableViewCell.swift
//  Pawsome
//
//  Created by Roch on 3/31/22.
//

import UIKit

class WalkerRequestTableViewCell: UITableViewCell {

    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var confirmLabel: UILabel!
    
    @IBOutlet weak var dogImageView: UIImageView!
    
    var confirmButtonClicked:(()->())?
    var ignoreButtonClicked:(()->())?
    
    var dog: Dog! {
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
        dogImageView.set(cornerRadius: 20)
    }
    
    private func setupData() {
        
    }
    
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        self.confirmButtonClicked?()
    }
    
    @IBAction func ignoreButtonTapped(_ sender: Any) {
        self.ignoreButtonClicked?()
    }
    
}
