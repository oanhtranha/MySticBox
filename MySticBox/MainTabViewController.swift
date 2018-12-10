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
    private let tabbarTitles = ["HOME","ANALYTICS","PAYMENTS","ACCOUNT","SETTINGS"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.enableTabs.drive(onNext: { [weak self] value in
            self?.enableTabs(value)
        }).addDisposableTo(disposeBag)
        
//        viewModel.selectTab.drive(onNext: { [weak self] index in
//            self?.msb_rootViewController().selectTab(atIndex: index)
//        }).addDisposableTo(disposeBag)
        
        viewModel.setup()
        if let image = UIImage(named: "Photos") {
            setImage(image.withRenderingMode(.alwaysOriginal), selectedImage:UIImage(named: "Files") , atIndex: 0)
        }
       
//        setImage(.withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "tab_home_selected").withRenderingMode(.alwaysOriginal), atIndex: 0)
//        setImage(#imageLiteral(resourceName: "tab_expenses").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "tab_expenses_selected").withRenderingMode(.alwaysOriginal), atIndex: 1)
//        setImage(#imageLiteral(resourceName: "tab_payments").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "tab_payments_selected").withRenderingMode(.alwaysOriginal), atIndex: 2)
//        setImage(#imageLiteral(resourceName: "tab_cards").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "tab_cards_selected").withRenderingMode(.alwaysOriginal), atIndex: 3)
//        setImage(#imageLiteral(resourceName: "tab_setting").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "tab_setting_selected").withRenderingMode(.alwaysOriginal), atIndex: 4)
//        tabbarTitles.enumerated().forEach({(index, title) in setTitle(title, atIndex: index)})
        
        tabBar.shadowImage = UIImage()
        tabBar.backgroundColor = .white
        
//        let points = [GradientPoint(location: 0, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), GradientPoint(location: 0.8, color: #colorLiteral(red: 0.9058823529, green: 0.9098039216, blue: 0.9176470588, alpha: 1))]
//        let image = UIImage(size: CGSize(width: tabBar.bounds.width, height: tabBar.bounds.height / UIScreen.main.scale), gradientPoints: points)
//        tabBar.backgroundImage = image
        
//        setTabbarItemFont()
        
//        updateUnreadMessagesBadge(unreadMessagesCount: viewModel.unreadMessagesCount)
//        NotificationCenter.default.addObserver(self, selector: #selector(updateUnreadMessagesBadge(notification:)), name: .BPChatHasUnreadMessages, object: nil)
    }
    
    private func enableTabs(_ enable: [Bool]) {
        for (i, enableTab) in enable.enumerated() {
            setItemEnabled(enableTab, atIndex: i)
        }
    }
    
}
