//
//  PageViewController.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 03.05.2022.
//

import UIKit

protocol PageViewControllerViewInput: AnyObject {}

protocol PageViewControllerViewOutput: AnyObject {
    var instructionText: [String] { get }
}

final class PageViewController: UIPageViewController {
    
    // MARK: - Private Properties
    
    private var textContent = [String]()
    private var output: PageViewControllerViewOutput
    
    // MARK: - Initialization
    
    init(
        transitionStyle style: UIPageViewController.TransitionStyle = .scroll,
        navigationOrientation: UIPageViewController.NavigationOrientation = .horizontal,
        options: [UIPageViewController.OptionsKey : Any]? = nil,
        output: PageViewControllerViewOutput
    ) {
        self.output = output
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: options)
        self.textContent = output.instructionText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        dataSource = self
        modalTransitionStyle = .crossDissolve
        
        if let contentViewController = showViewControllerAtIndex(0) {
            setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    private func showViewControllerAtIndex(_ index: Int) -> PageContentViewController? {
        guard index >= 0 else { return nil }
        guard index < textContent.count else { return nil }
        let contentVC = PageContentViewController()
        contentVC.presentText = textContent[index]
        contentVC.currentPage = index
        contentVC.numberOfPages = textContent.count
        if contentVC.currentPage == textContent.count - 1 {
            contentVC.showCloseButton()
            contentVC.hideScreenTitle()
        }
        return contentVC
    }
}

// MARK: - UIPageViewControllerDataSource

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard var pageNumber = (viewController as? PageContentViewController)?.currentPage else { return nil }
        pageNumber -= 1
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard var pageNumber = (viewController as? PageContentViewController)?.currentPage else { return nil }
        pageNumber += 1
        return showViewControllerAtIndex(pageNumber)
    }
}

// MARK: - PageViewControllerViewInput

extension PageViewController: PageViewControllerViewInput {}
