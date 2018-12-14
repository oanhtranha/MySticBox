//
//  PresentingTabBarController.swift
//  MySticBox
//
//  Created by Oanh Tran on 11/30/18.
//  Copyright © 2018 Oanh Tran. All rights reserved.
//

import UIKit

protocol PresentingTab: class {}

class PresentingTabBarController: UITabBarController {
    
    fileprivate var storedTabs: [UIViewController] = []
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Need to call custom setter
        if let viewControllers = self.viewControllers {
            self.viewControllers = viewControllers
        }
    }
    
    override var viewControllers: [UIViewController]? {
        get {
            return super.viewControllers
        }
        
        set {
            guard let newViewControllers = newValue else {
                super.viewControllers = nil
                return
            }
            
            storedTabs = newViewControllers
            
            super.viewControllers = storedTabs.map { vc in
                if (vc is PresentingTab) {
                    let placeHolder = UIViewController()
                    placeHolder.tabBarItem.title = vc.tabBarItem.title
                    placeHolder.tabBarItem.image = vc.tabBarItem.image
                    return placeHolder
                }
                
                return vc
            }
        }
    }
    
    func setTabbarItemTitleAttributes() {
        let font = UIFont.msb_PTMonoRegular(ofSize: 12)
        viewControllers?.forEach {
            $0.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
            $0.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: UIColor.blue], for: .selected)
        }
    }
    
    func setItemEnabled(_ enabled: Bool, atIndex index: Int) {
        viewControllers?[index].tabBarItem.isEnabled = enabled
    }
    
    func setImage(_ image: UIImage, selectedImage: UIImage?, atIndex index: Int) {
        viewControllers?[index].tabBarItem.image = image
        viewControllers?[index].tabBarItem.selectedImage = selectedImage
    }
    
    func setTitle(_ title: String, atIndex index: Int) {
        viewControllers?[index].tabBarItem.title = title
    }
}
