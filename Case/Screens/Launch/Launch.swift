//
//  Launch.swift
//  Case
//
//  Created by mba on 22.09.2024.
//

import UIKit

class Launch: Base {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if NetworkConnection.shared.isConnected() {
            self.navigationController?.pushViewController(UserList(), animated: true)
        }
    }
}
