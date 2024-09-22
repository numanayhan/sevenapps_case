//
//  UIViewController.swift
//  Case
//
//  Created by mba on 22.09.2024.
//

import Foundation
import UIKit

extension UIViewController{
    
    func configureNavigationBar(largeTitleColor: UIColor, backgoundColor: UIColor, tintColor: UIColor, title: String, preferredLargeTitle: Bool , hideBackItem:Bool,rightBarShow:Bool) {
         
        navigationController?.navigationBar.prefersLargeTitles = preferredLargeTitle
        navigationItem.title = title
        let attrs = [
            NSAttributedString.Key.foregroundColor:largeTitleColor,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)
        ]
        if preferredLargeTitle {
            navigationItem.largeTitleDisplayMode  = .always
            navigationController?.navigationBar.titleTextAttributes = attrs
        } else {
            navigationItem.largeTitleDisplayMode  = .automatic
        }
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: largeTitleColor]
        navBarAppearance.titleTextAttributes = [.foregroundColor: largeTitleColor]
        navBarAppearance.backgroundColor = backgoundColor
        navBarAppearance.shadowColor = nil
        navBarAppearance.shadowImage = nil
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.compactAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = tintColor
        
        UINavigationBar.appearance().backItem?.title = ""
        UINavigationBar.appearance().backItem?.titleView?.isHidden = true
         
        if hideBackItem{
            setBackButtonVisibility()
        }else {
           setNavbarTitleWithBack(title: title)
        }
    }
    
    func setBackButtonVisibility() {
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true
        navigationController?.navigationBar.backIndicatorImage = UIImage()
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
     
    func setNavbarTitleWithBack(title:String){
        self.navigationController?.navigationBar.backItem?.title = " "
        self.navigationController?.navigationBar.backgroundColor =  UIColor.black
        self.navigationController?.navigationBar.tintColor  = UIColor.white
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor:  UIColor.white]
        self.navigationItem.title = title
        
        guard let navigationController = navigationController else { return }
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor:  UIColor.white]
        
    }
}
