//
//  Base.swift
//  Case
//
//  Created by mba on 22.09.2024.
//

import UIKit
import TinyConstraints

class Base: UIViewController {
    let networkStatus = UserLabel()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupLayout()
        checkNetworkConnection()
    }
     
    func setupLayout() {
        view.backgroundColor = .black
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        networkStatus.text = "İnternet Bağlantısı Yok!"
        networkStatus.isHidden = true
        view.addSubview(networkStatus)
        networkStatus.centerInSuperview()
        networkStatus.leadingToSuperview(offset: 20)
        networkStatus.trailingToSuperview(offset: 20)
    }
    
    func checkNetworkConnection(){
      
        if NetworkConnection.shared.isConnected() {
            networkStatus.isHidden = true
        } else {
            networkStatus.isHidden = false
        }
    }
     
}

