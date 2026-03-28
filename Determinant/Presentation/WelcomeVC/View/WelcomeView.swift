//
//  WelcomeView.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 24.07.2021.
//

import UIKit

final class WelcomeView: UIView {
    
    // MARK: - Properties
    
    var onButtonTappedClosure: ((AppButton.ButtonType) -> Void)?
    
    // MARK: - Private Properties
    
    private lazy var welcomeLabel: UILabel = {
        $0.text = "WelcomeVC.WelcomeLabel.text".localized
        return $0
    }(AppLabel(type: .welcomeVCLabel))
    
    private lazy var logoImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = AppImage.matrix
        $0.tintColor = .white
        return $0
    }(UIImageView())
    
    private lazy var gameButton = AppButton(type: .game)
    private lazy var instructionButton = AppButton(type: .instruction, bgColour: .black)
    
    private lazy var buttonStackView = StackViewFactory.generate(
        axis: .vertical,
        distribution: .fillEqually,
        spacing: 5,
        views: [gameButton, instructionButton]
    )
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addSubviews()
        setupLayout()
        addButtonAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc private func onButtonTapped(_ sender: UIButton) {
        switch sender {
        case gameButton: onButtonTappedClosure?(.game)
        case instructionButton: onButtonTappedClosure?(.instruction)
        default: break
        }
    }
    
    // MARK: - Private Methods
    
    private func addButtonAction() {
        instructionButton.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
        gameButton.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
    }
    
    private func setupView() {
        backgroundColor = .black
    }
    
    private func addSubviews() {
        [welcomeLabel, logoImageView, buttonStackView].forEach {
            addSubview($0)
        }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            welcomeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            buttonStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            buttonStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}
