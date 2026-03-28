//
//  SplashView.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 24.07.2021.
//

import UIKit

final class SplashView: UIView {
    
    // MARK: - Nested Types
    
    struct Constants {
        static let logoSize: CGFloat = 50
    }
    
    // MARK: - Properties
    
    var isEndOfAnimation: ((Bool) -> Void)?
    
    // MARK: - Private Properties
    
    private lazy var logoContainerView = UIView()
    private lazy var logoImageView = LogoImageView()
    private let appTitle = AppLabelType.appTitle.rawValue
    private lazy var titleLabel = AppLabel(type: .appTitle)
    
    private lazy var mainStackView = StackViewFactory.generate(
        axis: .vertical,
        distribution: .fillProportionally,
        spacing: 10,
        views: [logoContainerView, titleLabel]
    )
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        addSubviews()
        setupLayout()
        startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func startAnimating() {
        titleLabel.text = ""
        var characterIndex = 0.0
        let titleText = AppLabelType.appTitle.rawValue
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * characterIndex, repeats: false) { [weak self] _ in
                guard let self = self else { return }
                self.titleLabel.text?.append(letter)
                self.titleLabel.text == self.appTitle ? self.isEndOfAnimation?(true) : self.isEndOfAnimation?(false)
            }
            characterIndex += 1
        }
    }
    
    private func setupView() {
        backgroundColor = .black
    }
    
    private func addSubviews() {
        logoContainerView.addSubview(logoImageView)
        addSubview(mainStackView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            logoContainerView.heightAnchor.constraint(equalToConstant: Constants.logoSize),
            
            logoImageView.topAnchor.constraint(equalTo: logoContainerView.topAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: Constants.logoSize),
            logoImageView.centerXAnchor.constraint(equalTo: logoContainerView.centerXAnchor),
            logoImageView.bottomAnchor.constraint(equalTo: logoContainerView.bottomAnchor)
        ])
    }
}
