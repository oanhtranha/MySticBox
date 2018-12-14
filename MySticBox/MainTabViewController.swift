//
//  MainTabViewController.swift
//  MySticBox
//
//  Created by Oanh Tran on 11/30/18.
//  Copyright © 2018 Oanh Tran. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MainTabViewController: PresentingTabBarController {
    private let disposeBag = DisposeBag()
    private var viewModel = MainTabViewModel()
    private let tabbarTitles = ["Photos","Files","Add","Browsers","More"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setup()
        configTabbar()
        
        viewModel.enableTabs.drive(onNext: { [weak self] value in
            self?.enableTabs(value)
        }).disposed(by: disposeBag)
        
    }
    
    private func configTabbar() {
        setImage(#imageLiteral(resourceName: "tab_home_selected").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "tab_payments_selected").withRenderingMode(.alwaysOriginal), atIndex: 0)
        setImage(#imageLiteral(resourceName: "tab_expenses").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "tab_expenses_selected").withRenderingMode(.alwaysOriginal), atIndex: 1)
        setImage(#imageLiteral(resourceName: "tab_cards").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "tab_cards_selected").withRenderingMode(.alwaysOriginal), atIndex: 3)
        setImage(#imageLiteral(resourceName: "tab_setting").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "tab_setting_selected").withRenderingMode(.alwaysOriginal), atIndex: 4)
        tabbarTitles.enumerated().forEach({(index, title) in setTitle(title, atIndex: index)})
        tabBar.backgroundImage =  UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.isTranslucent = true
        tabBar.backgroundColor = UIColor.init(hex: 0x6087FA)
        
        setTabbarItemTitleAttributes()
    }
    
    private func enableTabs(_ enable: [Bool]) {
        for (i, enableTab) in enable.enumerated() {
            setItemEnabled(enableTab, atIndex: i)
        }
    }
    
    private func payTabButton() -> UIButton {
        let button = UIButton(type: .custom)
        
        button.shadowOffset = CGSize(width: 0, height: 20)
        button.shadowColor = UIColor(white: 0, alpha: 0.2)
        button.shadowRadius = 10.0
        button.shadowOpacity = 1.0
        
        button.frame = CGRect(x: 0, y: 0, width: 60.0, height: 60.0)
        button.setBackgroundImage(#imageLiteral(resourceName: "payButtonCopy"), for: .normal)
        
        return button
    }
}
