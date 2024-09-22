//
//  UserDetail.swift
//  Case
//
//  Created by mba on 22.09.2024.
//

import UIKit
import TinyConstraints

class UserDetail: Base {
    let nameLabel = UserLabel()
    let emailLabel = UserLabel()
    let phoneLabel  = UserLabel()
    let websiteLabel = UserLabel()
    
    private let user: User
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setLayout()
        setupUI()
    }
    
    func setLayout() {
        
        configureNavigationBar(
            largeTitleColor: .white ,
            backgoundColor: UIColor.clear,
            tintColor: .white,
            title: "User List" ,
            preferredLargeTitle: true,
            hideBackItem: false,
            rightBarShow: false)
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        
        nameLabel.text = "Name: \(user.name)"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        emailLabel.text = "Email: \(user.email)"
        phoneLabel.text = "Phone: \(user.phone)"
        websiteLabel.text = "website: \(user.website)"
        
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, emailLabel, phoneLabel, websiteLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
        stackView.topToSuperview(offset: 50, usingSafeArea: true)
        stackView.leadingToSuperview(offset: 20)
        stackView.trailingToSuperview(offset: 20)
    }
}
