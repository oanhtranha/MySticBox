//
//  MainTabViewModel.swift
//  MySticBox
//
//  Created by Oanh tran on 12/5/18.
//  Copyright © 2018 Oanh Tran. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

let payButtonIndex = 2
let settingButtonIndex = 4
let homeButtonIndex = 0

class MainTabViewModel: NSObject {
    
    var enableTabs: Driver<[Bool]> { return enableTabsSubject.asDriver(onErrorJustReturn: [false, false, false, false, false]) }
    var selectTab: Driver<Int> { return selectTabSubject.asDriver(onErrorJustReturn: 0) }
    private var enableTabsSubject = BehaviorSubject(value: [false, false, false, false, false])
    private var selectTabSubject = PublishSubject<Int>()
    
    func setup() {
    }
    
//    @objc private func cardActivated() {
//        enableTabsSubject.onNext([true, true, true, true, true])
//        selectTabSubject.onNext(0)
//        payTabSelectionAllowed = true
//    }
    
//    @objc private func cardLocked() {
//        payTabSelectionAllowed = false
//    }
//
//    @objc private func cardUnlocked() {
//        payTabSelectionAllowed = true
//    }
    
//    override init(managerProvider: ManagerProvider) {
//        userProfileManager = managerProvider.userProfileManager
//        zendeskManager = managerProvider.zendeskManager
//        super.init(managerProvider: managerProvider)
//    }
//
//    private let userProfileManager: UserProfileManager
//    private let zendeskManager: ZendeskManager
//    private let disposeBag = DisposeBag()
}


