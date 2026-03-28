//
//  PageViewControllerRouter.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 02.05.2022.
//

import UIKit

protocol PageViewControllerRouterInput {}

final class PageViewControllerRouter {
    
    // MARK: - Properties
    
    weak var view: UIViewController?
}

// MARK: - PageViewControllerRouterInput

extension PageViewControllerRouter: PageViewControllerRouterInput {}
