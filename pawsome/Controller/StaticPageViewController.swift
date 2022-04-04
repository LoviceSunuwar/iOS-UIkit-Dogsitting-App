//
//  StaticPageViewController.swift
//  Pawsome
//
//  Created by Roch on 4/3/22.
//

import UIKit

class StaticPageViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var staticPage: StaticPage?
    var endPoint: String = ""
    let staticPageService = StaticPageService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getStaticPage()
    }
    
    private func getStaticPage() {
        staticPageService.getStaticPage(endPoint: endPoint) { success, message, staticPage in
            if success {
                self.staticPage = staticPage
                self.loadStaticPage()
            } else {
                self.alert(message: message, title: nil, okAction: nil)
            }
        }
    }
    
    private func loadStaticPage() {
        titleLabel.text = staticPage?.name ?? ""
        descriptionLabel.text = (staticPage?.description ?? "").htmlToString
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
