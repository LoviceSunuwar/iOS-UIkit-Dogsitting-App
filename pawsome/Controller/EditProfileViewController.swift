//
//  EditProfileViewController.swift
//  Pawsome
//
//  Created by Roch on 4/3/22.
//

import UIKit
import SwiftSpinner

protocol EditProfileProtocol: class {
    func successfull(profile: Profile)
}

class EditProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var yearExperienceTextField: UITextField!
    @IBOutlet weak var areYouAvailbleSwitch: UISwitch!
    
    @IBOutlet weak var availbleView: UIStackView!
    
    @IBOutlet weak var experienceView: UIStackView!
    
    var profile: Profile!
    var imagePicker: ImagePicker?
    var imageStr64: String = ""
    var profileServices = ProfileService()
    
    weak var delegate: EditProfileProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupData()
        setupGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Edit Profile"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = ""
    }
    
    private func setupViews() {
        switch GlobalConstants.KeyValues.userType ?? .walker {
        case .owner:
            setupOwnerView()
        case .walker:
            setupWalkerView()
        }
        
        nameTextField.setUnderLine()
        phoneNumberTextField.setUnderLine()
        yearExperienceTextField.setUnderLine()
        setupImageView()
        
    }
    
    private func setupOwnerView() {
        availbleView.isHidden = true
        experienceView.isHidden = true
    }
    
    private func setupWalkerView() {
        availbleView.isHidden = false
        experienceView.isHidden = false
    }
    
    private func setupImageView() {
        profileImageView.layoutIfNeeded()
        profileImageView.rounded()
    }
    
    private func setupData() {
        profileImageView.setImage(urlString: profile.formatted_image_url) {
            let myImage = self.profileImageView.image
            let imageData:NSData = myImage!.pngData()! as NSData
            self.imageStr64 = imageData.base64EncodedString(options: .lineLength64Characters)
        }
        nameTextField.text = profile.name
        phoneNumberTextField.text = profile.phone_number
        yearExperienceTextField.text = profile.experience
        areYouAvailbleSwitch.isOn = profile.is_available ?? false
        
    }
    
    private func setupGesture() {
        profileImageView.isUserInteractionEnabled = true
        let profileImageViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(profileImageViewTapped))
        profileImageView.addGestureRecognizer(profileImageViewTapGesture)
    }
    
    // MARK: objc function
    // MARK: profileImageViewTapped
    @objc func profileImageViewTapped() {
        imagePicker = ImagePicker(presentationController: self)
        imagePicker?.present(from: self.view)
        imagePicker?.completion = { [weak self] selectedImage in
            guard let self = self else { return }
            self.profileImageView.image = selectedImage
            let imageData = selectedImage.jpegData(compressionQuality: 0.8)!
            self.imageStr64 = imageData.base64EncodedString(options: .lineLength64Characters)
        }
    }
    
    @IBAction func editButtonClicked(_ sender: Any) {
        self.view.endEditing(true)
        switch GlobalConstants.KeyValues.userType ?? .walker {
        case .owner:
            editOwnerProfile()
        case .walker:
            editWalkerProfile()
        }
    }
    
    private func editOwnerProfile() {
        guard let name = nameTextField.text, !name.isEmpty else {
            self.alert(message: "Name is Empty", title: nil, okAction: nil)
            return}
        guard let phone = phoneNumberTextField.text, !phone.isEmpty else {
            self.alert(message: "Phone is Empty", title: nil, okAction: nil)
            return}
        guard phone.isPhoneNumber else {
            self.alert(message: "Phone is invalid", title: nil, okAction: nil)
            return}
        
        SwiftSpinner.show("Editing... ")
        profileServices.editProfile(fullName: name, phone: phone, image: imageStr64, experience: "1", isAvailable: false) { success, message, profile in
            SwiftSpinner.hide()
            if success {
                guard let profile = profile else {
                    return
                }
                self.alert(message: "Edit Successfully", title: "Success") {
                    self.delegate?.successfull(profile: profile)
                    self.navigationController?.popViewController(animated: true)
                }
            } else {
                self.alert(message: message, title: nil, okAction: nil)
            }
        }
        
    }
    
    private func editWalkerProfile() {
        guard let name = nameTextField.text, !name.isEmpty else {
            self.alert(message: "Name is Empty", title: nil, okAction: nil)
            return}
        guard let phone = phoneNumberTextField.text, !phone.isEmpty else {
            self.alert(message: "Phone is Empty", title: nil, okAction: nil)
            return}
        guard phone.isPhoneNumber else {
            self.alert(message: "Phone is invalid", title: nil, okAction: nil)
            return}
        guard let experience = yearExperienceTextField.text, !experience.isEmpty else {
            self.alert(message: "Experience is Empty", title: nil, okAction: nil)
            return}
        let isAvailable = areYouAvailbleSwitch.isOn
        SwiftSpinner.show("Editing... ")
        profileServices.editProfile(fullName: name, phone: phone, image: imageStr64, experience: experience, isAvailable: isAvailable) { success, message, profile in
            SwiftSpinner.hide()
            if success {
                self.alert(message: "Edit Successfully", title: "Success") {
                    self.navigationController?.popViewController(animated: true)
                }
            } else {
                self.alert(message: message, title: nil, okAction: nil)
            }
        }
    }
}
