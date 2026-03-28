//
//  NavigationController.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 05.05.2022.
//

import UIKit

final class NavigationController: UINavigationController {
    
    // MARK: - Nested Types
    
    struct Settings {
        var titleForegroundColor: UIColor? = .white
        var largeTitleForegroundColor: UIColor? = .white
        var titleFont: UIFont = .getAvenirNext(ofSize: 24, weight: .bold)
        var largeTitleTextFont: UIFont = .getAvenirNext(ofSize: 34, weight: .bold)
        var bgColor: UIColor? = .systemIndigo
        var tintColor: UIColor? = .white
        var isLargeTitle: Bool = true
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - Methods
    
    func setupView() {
        configure(with: Settings())
    }
    
    func configure(with settings: Settings) {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithTransparentBackground()
            navBarAppearance.titleTextAttributes = [
                .foregroundColor: settings.titleForegroundColor ?? .white,
                .font: settings.titleFont
            ]
            navBarAppearance.largeTitleTextAttributes = [
                .foregroundColor: settings.largeTitleForegroundColor ?? .white,
                .font: settings.largeTitleTextFont
            ]
            navBarAppearance.backgroundColor = settings.bgColor
            navigationBar.standardAppearance = navBarAppearance
            navigationBar.scrollEdgeAppearance = navBarAppearance
            navigationBar.prefersLargeTitles = settings.isLargeTitle
        } else {
            navigationBar.isTranslucent = false
            navigationBar.barTintColor = settings.tintColor
            navigationBar.backgroundColor = settings.bgColor
            navigationBar.prefersLargeTitles = settings.isLargeTitle
            navigationBar.titleTextAttributes = [
                .foregroundColor: settings.titleForegroundColor ?? .white,
                .font: settings.titleFont
            ]
            navigationBar.largeTitleTextAttributes = [
                .foregroundColor: settings.largeTitleForegroundColor ?? .white,
                .font: settings.largeTitleTextFont
            ]
        }
        navigationBar.tintColor = settings.tintColor
    }
}
