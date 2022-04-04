//
//  WalkerProfileViewController.swift
//  Pawsome
//
//  Created by Roch on 3/31/22.
//

import UIKit
import Cosmos

class WalkerProfileViewController: UIViewController {
    
    var walker: Profile!
    
    @IBOutlet weak var sendWalkerRequestButton: UIButton!
    @IBOutlet weak var walkerNameLabel: UILabel!
    @IBOutlet weak var walkerLocationLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var walkerImageView: UIImageView!
    
    @IBOutlet weak var ratingView: CosmosView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    private func setupViews() {
        setupButton()
        setupImageViews()
        setupData()
    }
    
    private func setupImageViews() {
        walkerImageView.set(cornerRadius: 20)
    }
    
    private func setupButton() {
        sendWalkerRequestButton.setRoundedBorder()
    }
    
    private func setupData() {
        walkerNameLabel.text = walker.name
        bioLabel.text = "\(walker.experience ?? 0)"
        ratingView.rating = walker.average_rating ?? 0
        statusLabel.text = (walker.is_available ?? false) ? "Available for new walks" : "Not currently available for new walks"
        walkerImageView.setImage(urlString: walker.formatted_image_url)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendWalkRequestButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
