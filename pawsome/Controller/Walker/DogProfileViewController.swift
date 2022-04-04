//
//  DogProfileViewController.swift
//  Pawsome
//
//  Created by Roch on 3/31/22.
//

import UIKit

class DogProfileViewController: UIViewController {
    
    
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var dogNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var dogDescription: UILabel!
    
    @IBOutlet weak var sexView: UIView!
    
    @IBOutlet weak var ageView: UIView!
    
    @IBOutlet weak var weightView: UIView!
    
    var dog: Dog!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupData()
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
        dogImageView.set(cornerRadius: 20)
        sexView.setBorder()
        ageView.setBorder()
        weightView.setBorder()
    }
    
    private func setupData() {
        dogNameLabel.text = dog.name
        locationLabel.text = dog.location
        sexLabel.text = dog.sex
        ageLabel.text = dog.age
        weightLabel.text = dog.weight
        dogDescription.text = dog.description
        dogImageView.setImage(urlString: dog.image)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
