//
//  SplashViewController.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 09.04.2021.
//

import UIKit

protocol SplashScreenViewInput: AnyObject {}

protocol SplashScreenViewOutput: AnyObject {
    func viewDidLoad()
}

final class SplashScreenViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private lazy var mainView = SplashView()
    private var output: SplashScreenViewOutput
    
    // MARK: - Initialization
    
    init(output: SplashScreenViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCallback()
    }
    
    // MARK: - Private Methods
    
    private func setupCallback() {
        mainView.isEndOfAnimation = { [weak self] isEndOfAnimation in
            if isEndOfAnimation {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self?.setupEndOfAnimation()
                }
            }
        }
    }
    
    private func setupEndOfAnimation() {
        view.subviews.forEach { $0.removeFromSuperview() }
        output.viewDidLoad()
    }
}

// MARK: - SplashScreenViewInput

extension SplashScreenViewController: SplashScreenViewInput {}
