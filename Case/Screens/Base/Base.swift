//
//  Base.swift
//  Case
//
//  Created by mba on 22.09.2024.
//

import UIKit
 
class Base: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        checkNetworkConnection()
        setupLayout()
    }
    
    // Layout ayarları
    func setupLayout() {
        view.backgroundColor = .black
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    func checkNetworkConnection(){
        // İnternet kontrolü yapılıyor
        if NetworkConnection.shared.isConnected() {
            print("Ağ mevcut, uygulama devam edebilir")
        } else {
            // İnternet bağlantısı yoksa uyarı banner'ı gösteriliyor
            showNoInternetBanner()
        }
    }
    // İnternet yoksa uyarı gösteren fonksiyon
    func showNoInternetBanner() {
        
    }
}

