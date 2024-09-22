//
//  StatusBarBanner.swift
//  Case
//
//  Created by mba on 22.09.2024.
//

import Foundation
import UIKit

class StatusBarBanner {
    
    private static var bannerWindow: UIWindow?
    
    static func showBanner(message: String, backgroundColor: UIColor = .red, textColor: UIColor = .white, duration: TimeInterval = 2.0) {
        
        // UIWindow instance oluştur
        let window = UIWindow(frame: UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
        
        // Banner'ın boyutlarını ayarla
        let bannerHeight: CGFloat = 100.0
        let bannerFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: bannerHeight)
        
        // Banner view oluştur
        let bannerView = UIView(frame: bannerFrame)
        bannerView.backgroundColor = backgroundColor
        
        // Label ekle
        let label = UILabel(frame: bannerFrame)
        label.text = message
        label.textAlignment = .center
        label.textColor = textColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        // Label'ı banner'a ekle
        bannerView.addSubview(label)
        
        // Banner'ı UIWindow içerisine ekle
        window.windowLevel = UIWindow.Level.statusBar + 1
        window.addSubview(bannerView)
        window.isHidden = false
        bannerWindow = window
        
        // Animasyonlu olarak görünmesini sağla
        bannerView.transform = CGAffineTransform(translationX: 0, y: -bannerHeight)
        UIView.animate(withDuration: 0.3, animations: {
            bannerView.transform = .identity
        }) { _ in
            // Belirtilen süre kadar sonra banner'ı gizle
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                hideBanner()
            }
        }
    }
    
    // Banner'ı gizleme fonksiyonu
    static func hideBanner() {
        guard let bannerWindow = bannerWindow else { return }
        
        UIView.animate(withDuration: 0.3, animations: {
            bannerWindow.alpha = 0
        }) { _ in
            bannerWindow.isHidden = true
            self.bannerWindow = nil
        }
    }
}
