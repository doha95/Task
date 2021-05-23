//
//  ProfileViewController.swift
//  Task
//
//  Created by Doha Tubaileh on 20/5/2021.
//

import UIKit
import Alamofire



class ProfileController: UIViewController {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var blogLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var hireableLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    var userName : String?
    let networkingManager = NetworkingService.sharedInstance
    
    var detailViewModel: DetailViewModel! {
        didSet {
            nameLabel.text = detailViewModel.name
            companyLabel.text = detailViewModel.company
            blogLabel.text = detailViewModel.blog
            locationLabel.text = detailViewModel.location
            emailLabel.text = detailViewModel.email
            hireableLabel.text = detailViewModel.hireable
            bioLabel.text = detailViewModel.bio
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let userName = userName {
            userNameLabel.text = userName
            networkingManager.requestPersonDetail(with: userName) { [unowned self] (userDetail) in
                detailViewModel = DetailViewModel(detail: userDetail)
            }
        }
    }
}
