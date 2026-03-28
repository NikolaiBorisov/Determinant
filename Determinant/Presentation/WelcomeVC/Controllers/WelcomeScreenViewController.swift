//
//  WelcomeScreenViewController.swift
//  Mathematical Determinant App
//
//  Created by NIKOLAI BORISOV on 14.03.2021.
//

import UIKit

protocol WelcomeScreenViewInput: AnyObject {}

protocol WelcomeScreenViewOutput {
    func onGameTapped()
    func onInstructionTapped()
}

final class WelcomeScreenViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private lazy var mainView = WelcomeView()
    private var output: WelcomeScreenViewOutput
    
    // MARK: - Initialization
    
    init(output: WelcomeScreenViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func loadView() {
        
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCallback()
    }
    
    // MARK: - Private Methods
    
    private func setupCallback() {
        mainView.onButtonTappedClosure = { [weak self] buttonType in
            guard let self = self else { return }
            switch buttonType {
            case .game:
                self.output.onGameTapped()
            case .instruction:
                self.output.onInstructionTapped()
            case .matrixInfo, .numberpadButton, .seeMatrix, .startOverButton:
                break
            }
        }
    }
}

// MARK: - WelcomeScreenViewInput

extension WelcomeScreenViewController: WelcomeScreenViewInput {}
