//
//  ChooseSignView.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 24.07.2021.
//

import UIKit

final class ChooseSignView: UIView {
    
    // MARK: - Properties
    
    var gameButtonAction: (() -> Void)?
    var sign1ButtonTapped: ((String) -> Void)?
    var sign2ButtonTapped: ((String) -> Void)?
    
    // MARK: - Private Properties
    
    private var isFirstSignSelected = false
    private var isSecondSignSelected = false
    
    // MARK: - Player1
    
    private lazy var player1Label = AppLabel(type: .firstPlayerLabel)
    private lazy var player1ButtonPlus = PlayerSignButton(type: .buttonPlus)
    private lazy var player1ButtonMinus = PlayerSignButton(type: .buttonMinus)
    
    private lazy var player1ButtonStack = StackViewFactory.generate(
        axis: .horizontal,
        distribution: .fillEqually,
        spacing: 5,
        views: [player1ButtonPlus, player1ButtonMinus]
    )
    
    private lazy var player1ButtonsContainer: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubview(player1ButtonStack)
        return $0
    }(UIView())
    
    private lazy var player1MainStack = StackViewFactory.generate(
        distribution: .fillEqually,
        views: [player1Label, player1ButtonsContainer]
    )
    
    // MARK: - Player2
    
    private lazy var player2Label = AppLabel(type: .secondPlayerLabel)
    private lazy var player2ButtonPlus = PlayerSignButton(type: .buttonPlus)
    private lazy var player2ButtonMinus = PlayerSignButton(type: .buttonMinus)
    
    private lazy var player2ButtonStack = StackViewFactory.generate(
        axis: .horizontal,
        distribution: .fillEqually,
        spacing: 5,
        views: [player2ButtonPlus, player2ButtonMinus]
    )
    
    private lazy var player2ButtonsContainer: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubview(player2ButtonStack)
        return $0
    }(UIView())
    
    private lazy var player2MainStack = StackViewFactory.generate(
        distribution: .fillProportionally,
        views: [player2Label, player2ButtonsContainer]
    )
    
    // MARK: - MainStack
    
    private lazy var mainStack = StackViewFactory.generate(views: [player1MainStack, player2MainStack])
    
    // MARK: - GameButton
    
    private lazy var gameButton = AppButton(type: .game, alpha: 0.5, isEnabled: false)
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        addSubviews()
        setupLayout()
        setupButtonAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc private func onButtonTapped(_ sender: UIButton) {
        guard let sign = sender.titleLabel?.text else { return }
        switch sender {
        case gameButton:
            gameButtonAction?()
        case player1ButtonPlus:
            sign1ButtonTapped?(sign)
            player1ButtonPlus.setTitleColor(.systemBlue, for: .normal)
            player1ButtonMinus.isHidden = true
            isFirstSignSelected = true
            if player1ButtonPlus.currentTitle == "+" {
                player2ButtonPlus.isHidden = true
                player2ButtonMinus.setTitleColor(.systemRed, for: .normal)
                player1Label.text = "✅"
            }
        case player1ButtonMinus:
            sign1ButtonTapped?(sign)
            player1ButtonMinus.setTitleColor(.systemRed, for: .normal)
            player1ButtonPlus.isHidden = true
            isFirstSignSelected = true
            if player1ButtonMinus.currentTitle == "-" {
                player2ButtonMinus.isHidden = true
                player2ButtonPlus.setTitleColor(.systemBlue, for: .normal)
                player1Label.text = "✅"
            }
        case player2ButtonPlus:
            sign2ButtonTapped?(sign)
            player2ButtonPlus.setTitleColor(.systemBlue, for: .normal)
            player2ButtonMinus.isHidden = true
            isSecondSignSelected = true
            if player2ButtonPlus.currentTitle == "+" {
                player1ButtonPlus.isHidden = true
                player1ButtonMinus.setTitleColor(.systemRed, for: .normal)
                player2Label.text = "✅"
            }
        case player2ButtonMinus:
            sign2ButtonTapped?(sign)
            player2ButtonMinus.setTitleColor(.systemRed, for: .normal)
            player2ButtonPlus.isHidden = true
            isSecondSignSelected = true
            if player2ButtonMinus.currentTitle == "-" {
                player1ButtonMinus.isHidden = true
                player1ButtonPlus.setTitleColor(.systemBlue, for: .normal)
                player2Label.text = "✅"
            }
        default:
            break
        }
        if isFirstSignSelected && isSecondSignSelected {
            gameButton.isEnabled = true
            gameButton.backgroundColor = .systemIndigo
        }
    }
    
    // MARK: - Methods
    
    func setLabel(name1: String, name2: String) {
        player1Label.text = name1 + "ChooseSignVC.Player1Label.Text".localized
        player2Label.text = name2 + "ChooseSignVC.Player2Label.Text".localized
    }

    func showView() {
        mainStack.isHidden = false
        gameButton.isHidden = false
    }
    
    // MARK: - Private Methods
    
    private func setupButtonAction() {
        [gameButton, player1ButtonPlus, player1ButtonMinus, player2ButtonPlus, player2ButtonMinus].forEach {
            $0.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
        }
    }
    
    private func setupView() {
        backgroundColor = .black
        mainStack.isHidden = true
        gameButton.isHidden = true
    }
    
    private func addSubviews() {
        [mainStack, gameButton].forEach {
            addSubview($0)
        }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            mainStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            player1ButtonStack.centerXAnchor.constraint(equalTo: player1ButtonsContainer.centerXAnchor),
            player1ButtonStack.centerYAnchor.constraint(equalTo: player1ButtonsContainer.centerYAnchor),
            
            player2ButtonStack.centerXAnchor.constraint(equalTo: player2ButtonsContainer.centerXAnchor),
            player2ButtonStack.centerYAnchor.constraint(equalTo: player2ButtonsContainer.centerYAnchor),
            
            gameButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            gameButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            gameButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
