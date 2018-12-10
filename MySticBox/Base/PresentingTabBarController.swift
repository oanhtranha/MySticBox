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
    
    fileprivate var customButtonsForIndexes: [Int : UIButton] = [:]
    fileprivate var storedTabs: [UIViewController] = []
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
        
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
    
    func setItemEnabled(_ enabled: Bool, atIndex index: Int) {
        customButtonsForIndexes[index]?.isEnabled = enabled
        viewControllers?[index].tabBarItem.isEnabled = enabled
    }
    
    func setImage(_ image: UIImage, selectedImage: UIImage?, atIndex index: Int) {
        viewControllers?[index].tabBarItem.image = image
        viewControllers?[index].tabBarItem.selectedImage = selectedImage
    }
    
    func setTitle(_ title: String, atIndex index: Int) {
        viewControllers?[index].tabBarItem.title = title
    }
    
    func shouldSelectTab(atIndex: Int) -> Bool {
        return true
    }
    
    @objc private func customButtonClicked(sender: UIButton) {
        let index = sender.tag
        if checkIndexSelected(atIndex: index) {
            presentViewController(atIndex: index)
        } else if shouldSelectTab(atIndex: index) {
            selectedIndex = index
        }
    }
    
    private func checkIndexSelected(atIndex index : Int) -> Bool {
        if index < storedTabs.count, storedTabs[index] is PresentingTab {
            return true
        }
        return false
    }
    
    private func presentViewController(atIndex index : Int) {
        if shouldSelectTab(atIndex: index) {
            present(storedTabs[index], animated: true) {}
        }
    }
}

extension PresentingTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        guard let index = viewControllers?.index(of: viewController) else {
            return false
        }
        
        if checkIndexSelected(atIndex: index) {
            presentViewController(atIndex: index)
            return false
        }
        
        return shouldSelectTab(atIndex: index)
    }
}
