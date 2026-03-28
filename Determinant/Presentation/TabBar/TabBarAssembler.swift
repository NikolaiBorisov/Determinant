//
//  TabBarAssembler.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 30.04.2022.
//

import UIKit

final class TabBarAssembler {
    static func assemble() -> UITabBarController {
        let tabBarVC = TabBarViewController()
        tabBarVC.changeTab(tab: .info)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.modalTransitionStyle = .flipHorizontal
        return tabBarVC
    }
}
