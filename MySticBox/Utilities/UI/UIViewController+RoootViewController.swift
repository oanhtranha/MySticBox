//
//  UIViewController+RoootViewController.swift
//  MySticBox
//
//  Created by Oanh tran on 12/5/18.
//  Copyright © 2018 Oanh Tran. All rights reserved.
//

import Foundation

import UIKit

extension UIViewController {
    
    func msb_rootViewController() -> UIViewController {
        
        guard let delegate = UIApplication.shared.delegate as? AppDelegate,
            let rootVC = delegate.window?.rootViewController as? UIViewController else {
                fatalError()
        }
        
        return rootVC
    }
    
    func selectTab(atIndex index: Int) {
        if let tabVC = parent as? UITabBarController {
            tabVC.selectedIndex = index
        }
    }
}

