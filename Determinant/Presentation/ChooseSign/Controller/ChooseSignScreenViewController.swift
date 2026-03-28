//
//  ChooseSignViewController.swift
//  Mathematical Determinant App
//
//  Created by NIKOLAI BORISOV on 21.03.2021.
//

import UIKit

protocol ChooseSignScreenViewInput: AnyObject {
}

protocol ChooseSignScreenViewOutput: AnyObject {
    func gameTapped(playerName: (String, String), playerSign: (String, String))
}

final class ChooseSignScreenViewController: UIViewController, LoadableAlertController {
    
    // MARK: - Private Properties
    
    private var activeTextField: UITextField?
    private lazy var mainView = ChooseSignView()
    private var output: ChooseSignScreenViewOutput
    private var playerName: (String, String) = ("", "")
    private var playerSign: (String, String) = ("", "")
    
    // MARK: - Initialization
    
    init(output: ChooseSignScreenViewOutput) {
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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showAlertHandler()
        prepareNavBar()
        setupButtonAction()
    }
    
    // MARK: - Actions
    
    @objc private func onBackButtonTapped() {
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    
    private func showAlertHandler() {
        showAlert(title: "AlertVC.Title".localized,
                  delegate: self, isTextFieldActive: true) { [weak self] player1, player2 in
            guard let self = self else { return {}() }
            self.mainView.showView()
            self.playerName = (player1, player2)
            return self.mainView.setLabel(name1: player1, name2: player2)
        }
    }
    
    private func setupButtonAction() {
        self.mainView.sign1ButtonTapped = { [weak self] sign in
            self?.playerSign.0 = sign
        }
        self.mainView.sign2ButtonTapped = { [weak self] sign in
            self?.playerSign.1 = sign
        }
        mainView.gameButtonAction = { [weak self] in
            guard let self = self else { return }
            self.output.gameTapped(playerName: self.playerName, playerSign: self.playerSign)
        }
    }
    
    private func prepareNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: AppImage.back_button,
            style: .done,
            target: self,
            action: #selector(onBackButtonTapped)
        )
    }
}

// MARK: - ChooseSignScreenViewInput

extension ChooseSignScreenViewController: ChooseSignScreenViewInput {}

// MARK: - UITextFieldDelegate

extension ChooseSignScreenViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
