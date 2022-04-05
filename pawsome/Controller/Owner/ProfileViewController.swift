//
//  ProfileViewController.swift
//  Pawsome
//
//  Created by Roch on 4/3/22.
//

import UIKit

class ProfileViewController: UITableViewController {
    enum otherCells: Int {
        case createANotice = 0
        case changePassword = 1
        case more = 2
    }
    
    enum profileSections {
        case profile
        case other
        case logout
    }
    
    var tableViewSections: [profileSections] = [.profile, .other, .logout]
    
    lazy var tableViewRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .black
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        return refreshControl
    }()
    
    // MARK: IBOutlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var moreContainerStackView: UIStackView!
    @IBOutlet weak var moreArrowButton: UIButton!
    
    let profileServices = ProfileService()
    var profile: Profile? {
        didSet {
            setupData()
        }
    }
    
    
    // MARK: VC's Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Profile"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = ""
    }
    
    // MARK: didSelectRowAt
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = tableViewSections[indexPath.section]

        switch section {
        case .profile:
            print("profile")
        case .other:
            if let element = otherCells.init(rawValue: indexPath.row) {
                switch element {
                case .createANotice:
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreateNoticeViewController") as! CreateNoticeViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                    break
                case .changePassword:
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordViewController") as! ChangePasswordViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                    break
                case .more:
                    break
               
                }
            }
        case .logout:
            alertWithOkCancel(message: "Are you sure you want to logout?", title: "Logout ?", okTitle: "Logout", style: UIDevice.current.userInterfaceIdiom == .pad ? .alert : .actionSheet, okStyle: .destructive, okAction: {
                NSLoginManager.clearLogSessions()
                appDelegate.goToWalkthroughNavigationControllerPage()
            })
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }
    
    // MARK: IBActions
    @IBAction func editProfileButtonTapped(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditProfileViewController") as! EditProfileViewController
        vc.profile = profile
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func aboutUsButtonTapped(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "StaticPageViewController") as! StaticPageViewController
        vc.endPoint = EStaticPage.aboutUs.rawValue
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func privacyPolicyButtonTapped(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "StaticPageViewController") as! StaticPageViewController
        vc.endPoint = EStaticPage.privacyPolicy.rawValue
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func termsOfServiceButtonTapped(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "StaticPageViewController") as! StaticPageViewController
        vc.endPoint = EStaticPage.termsAndCondition.rawValue
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func moreArrowButtonTapped(_ sender: UIButton) {
        moreArrowButton.isSelected = !moreArrowButton.isSelected
        moreContainerStackView.isHidden = !moreContainerStackView.isHidden
        reloadTableView()
    }
    
    // MARK: Other Functions
    private func setup() {
        // all setup should be done here
        getProfile()
        setupImageView()
        setupTableView()
        moreContainerStackView.isHidden = true
    }
    
    // MARK: setupImageView
    private func setupImageView() {
        profileImageView.rounded()
    }
    
    private func setupTableView() {
        tableView.refreshControl = tableViewRefreshControl
        
        tableView.backgroundColor = .white
    }
    
    private func reloadTableView() {
        tableView.reloadData()
    }
    
    // MARK: objc functions
    @objc private func pullToRefresh() {
        getProfile()
    }
    
    private func getProfile() {
        profileServices.getProfile { success, message, profile in
            self.refreshControl?.endRefreshing()
            if success {
                self.profile = profile
            } else {
                self.alert(message: message, title: nil, okAction: nil)
            }
        }
    }
    
    private func setupData() {
        profileImageView.setImage(urlString: profile?.formatted_image_url)
        nameLabel.text = profile?.name ?? ""
        emailLabel.text = profile?.email ?? ""
        phoneNumberLabel.text = profile?.phone_number ?? ""
    }
    
    
    
    
}

extension ProfileViewController: EditProfileProtocol {
    func successfull(profile: Profile) {
        self.profile = profile
    }
}
