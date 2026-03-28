//
//  EmptyView.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 05.05.2022.
//

import UIKit

final class EmptyView: UIView {
    
    // MARK: - Properties
    
    let titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.textColor = .white
        return $0
    }(UILabel())
    
    let subtitleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.textColor = .white
        return $0
    }(UILabel())
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods

    func setupSelf(on vc: UIViewController) {
        self.translatesAutoresizingMaskIntoConstraints = false
        vc.view.addSubview(self)
        self.titleLabel.text = "Экран в разработке 🛠"
        self.subtitleLabel.text = ""
        
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.trailingAnchor),
            self.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor)
        ])
    }
    
    // MARK: - Private Methods
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            subtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10)
        ])
    }
}
