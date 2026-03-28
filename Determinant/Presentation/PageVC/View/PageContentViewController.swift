//
//  PageContentViewController.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 03.05.2022.
//

import UIKit

final class PageContentViewController: UIViewController {
    
    // MARK: - Properties
    
    var presentText = ""
    var currentPage = 0
    var numberOfPages = 0
    
    // MARK: - Private Properties
    
    private lazy var screenTitle = AppLabel(type: .instruction)
    
    private lazy var closeButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(AppImage.icon_close, for: .normal)
        $0.tintColor = .white
        $0.isHidden = true
        return $0
    }(UIButton(type: .system))
    
    private lazy var presentTextLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.textColor = .white
        $0.font = .getAvenirNext(ofSize: 20, weight: .medium)
        return $0
    }(UILabel())
    
    private lazy var pageControl: UIPageControl = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.pageIndicatorTintColor = .darkGray
        $0.currentPageIndicatorTintColor = .white
        return $0
    }(UIPageControl())
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        addSubviews()
        setupLayout()
        addButtonAction()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupLayout()
    }
    // MARK: - Actions
    
    @objc 
    private func onCloseButtonTapped() {
        dismiss(animated: true)
    }
    
    // MARK: - Methods
    
    func showCloseButton() {
        closeButton.isHidden = false
    }
    
    func hideScreenTitle() {
        screenTitle.isHidden = true
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        view.backgroundColor = .systemIndigo
        
        presentTextLabel.text = presentText
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
    }
    
    private func addSubviews() {
        view.addSubview(screenTitle)
        view.addSubview(closeButton)
        view.addSubview(presentTextLabel)
        view.addSubview(pageControl)
    }
    
    private func addButtonAction() {
        closeButton.addTarget(self, action: #selector(onCloseButtonTapped), for: .touchUpInside)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            screenTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            screenTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            
            presentTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            presentTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            presentTextLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            presentTextLabel.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -10),
            
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
