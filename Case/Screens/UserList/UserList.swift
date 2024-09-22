//
//  UserList.swift
//  Case
//
//  Created by mba on 22.09.2024.
//

import UIKit

class UserList: Base {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setLayout()
    }
    
    func setLayout() {
        
        configureNavigationBar(
            largeTitleColor: .white ,
            backgoundColor: UIColor.clear,
            tintColor: .white,
            title: "User List" ,
            preferredLargeTitle: true,
            hideBackItem: true,
            rightBarShow: false)
    }
}
