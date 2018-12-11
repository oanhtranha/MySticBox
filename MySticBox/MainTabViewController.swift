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
        
        enableTabs([true, true, true, true, true])
        
        viewModel.setup()
        if let photoImage = UIImage(named: "photos_icon"), let filesImage = UIImage(named: "files_icon"), let browsersImage = UIImage(named: "browsers_icon"), let moreImage = UIImage(named: "more_icon") {
            setImage(photoImage, selectedImage:photoImage.withRenderingMode(.alwaysOriginal), atIndex: 0)
            setImage(filesImage, selectedImage:filesImage.withRenderingMode(.alwaysOriginal), atIndex: 1)
            setImage(moreImage, selectedImage:moreImage.withRenderingMode(.alwaysOriginal), atIndex: 2)
            setImage(browsersImage, selectedImage:browsersImage.withRenderingMode(.alwaysOriginal), atIndex: 3)
            setImage(moreImage, selectedImage:moreImage.withRenderingMode(.alwaysOriginal), atIndex: 4)
        }
        
        tabBar.backgroundColor = UIColor.blue
        
    }
    
    private func enableTabs(_ enable: [Bool]) {
        for (i, enableTab) in enable.enumerated() {
            setItemEnabled(enableTab, atIndex: i)
        }
    }
}
