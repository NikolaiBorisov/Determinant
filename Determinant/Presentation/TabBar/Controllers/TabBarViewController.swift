//
//  TabBarViewController.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 19.06.2021.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case info
    case results
    case game
    
    // MARK: - Properties
    
    var icon: UIImage {
        switch self {
        case .info:
            return AppImage.info_circle ?? UIImage()
        case .game:
            return AppImage.game_controller ?? UIImage()
        case .results:
            return AppImage.doc_plaintext ?? UIImage()
        }
    }
    
    var title: String {
        switch self {
        case .info:
            return "TabBar.InfoTab.Title".localized
        case .game:
            return "TabBar.GameTab.Title".localized
        case .results:
            return "TabBar.ResultsTab.Title".localized
        }
    }
}

final class TabBarViewController: UITabBarController {
    
    // MARK: - Private Properties
    
    private lazy var tabBarTopBorder: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemIndigo
        return $0
    }(UIView())
    
    // MARK: - Initialization
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setAppearance()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setAppearance()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupView()
        setupLayout()
    }
    
    // MARK: - Methods
    
    func changeTab(tab: Tabs) {
        selectedIndex = tab.rawValue
    }
    
    // MARK: - Private Methods
    
    private func addSubviews() {
        view.addSubview(tabBarTopBorder)
    }
    
    private func setAppearance() {
        let appearance = UITabBar.appearance()
        appearance.clipsToBounds = true
        appearance.unselectedItemTintColor = .lightGray
        appearance.backgroundColor = .black
        appearance.barTintColor = .black
        appearance.tintColor = .white
    }
    
    private func setupView() {
        var controllers = [UIViewController]()
        let tabs: [Tabs] = [.info, .results, .game]
        for tab in tabs {
            var vc: UIViewController
            switch tab {
            case .info:
                vc = InfoAssembly.assemble()
                vc.title = "InfoVC.Title".localized
            case .game:
                vc = ChooseSignAssembly.assemble()
                vc.title = "ChooseSignVC.Title".localized
            case .results:
                vc = ResultsAssembly.assemble()
                vc.title = "ResultsVC.Title".localized
            }
            let nc = NavigationController(rootViewController: vc)
            nc.configure(with: .init(
                largeTitleForegroundColor: .white,
                titleFont: .getAvenirNext(ofSize: 20, weight: .bold),
                largeTitleTextFont: .getAvenirNext(ofSize: 30, weight: .bold),
                bgColor: .systemIndigo,
                tintColor: .white)
            )
            nc.navigationItem.largeTitleDisplayMode = .always
            nc.tabBarItem = self.getTabBarItem(for: tab)
            nc.navigationItem.title = vc.title
            controllers.append(nc)
        }
        viewControllers = controllers
        tabBar.isTranslucent = false
    }
    
    private func getTabBarItem(for tab: Tabs) -> UITabBarItem {
        let item = UITabBarItem(title: tab.title, image: tab.icon, tag: tab.rawValue)
        item.setTitleTextAttributes([.font:UIFont.getAvenirNext(ofSize: 12, weight: .medium)], for: .normal)
        return item
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tabBarTopBorder.topAnchor.constraint(equalTo: tabBar.topAnchor),
            tabBarTopBorder.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            tabBarTopBorder.widthAnchor.constraint(equalTo: tabBar.widthAnchor),
            tabBarTopBorder.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
}
