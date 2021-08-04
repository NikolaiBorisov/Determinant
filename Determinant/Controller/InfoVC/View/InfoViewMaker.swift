//
//  InfoViewMaker.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 24.07.2021.
//

import UIKit
import SnapKit

final class InfoViewMaker {
  
  unowned var container: InfoViewController
  
  init(container: InfoViewController) {
    self.container = container
  }
  
  lazy var matrixImageView: UIImageView = {
    let image = UIImageView()
    image.layer.cornerRadius = 10
    image.clipsToBounds = true
    image.layer.borderWidth = 2
    image.layer.borderColor = UIColor.black.cgColor
    image.image = UIImage(named: Constants.Image.matrixImage)
    
    return image
  }()
  
  lazy var matrixLabel: UILabel = {
    let label = DeterminantLabel(type: .aboutMatrixLabel)
    label.font = UIFont.matrixLabelFont
    label.text = NSLocalizedString(Constants.LabelContent.matrixLabelText, comment: "Label")
    
    return label
  }()
  
  lazy var infoStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.distribution = .fillEqually
    stackView.spacing = 5
    [
      matrixImageView,
      matrixLabel
    ]
    .forEach { stackView.addArrangedSubview($0) }
    
    return stackView
  }()
  
  lazy var matrixInfoButton: UIButton = {
    let button = DeterminantButton(type: .matrixInfo)
    button.setTitle(NSLocalizedString("More about Matrix 3x3", comment: "Button"), for: .normal)
    
    return button
  }()
  
  lazy var gameButton: UIButton = {
    let button = DeterminantButton(type: .game)
    button.backgroundColor = .systemIndigo
    button.setTitle(NSLocalizedString("Game", comment: "Button"), for: .normal)
    
    return button
  }()
  
  lazy var buttonStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.distribution = .fillEqually
    stackView.spacing = 10
    [
      matrixInfoButton,
      gameButton
    ]
    .forEach { stackView.addArrangedSubview($0) }
    
    return stackView
  }()
  
  lazy var mainStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.distribution = .fillProportionally
    stackView.spacing = 10
    [
      infoStackView,
      buttonStackView
    ]
    .forEach { stackView.addArrangedSubview($0) }
    
    return stackView
  }()
  
  func setupLayouts() {
    [
      mainStackView
      //infoStackView,
      //buttonStackView
      //matrixInfoButton,
      //gameButton
    ]
    .forEach { container.view.addSubview($0) }
    
//    matrixInfoButton.snp.makeConstraints {
//      $0.bottom.equalTo(gameButton.snp.top).offset(-10.0)
//      $0.leading.equalToSuperview().offset(20.0)
//      $0.trailing.equalToSuperview().offset(-20.0)
//    }
//
//    gameButton.snp.makeConstraints {
//      $0.bottom.equalTo(container.view.safeAreaLayoutGuide.snp.bottom).offset(-10.0)
//      $0.leading.equalToSuperview().offset(20.0)
//      $0.trailing.equalToSuperview().offset(-20.0)
//    }
    
//    infoStackView.snp.makeConstraints {
//      $0.top.equalTo(container.view.safeAreaLayoutGuide.snp.top).offset(20.0)
//      $0.bottom.equalTo(matrixInfoButton.snp.top).offset(-10.0)
//      $0.leading.equalToSuperview().offset(20.0)
//      $0.trailing.equalToSuperview().offset(-20.0)
//    }
//
//    buttonStackView.snp.makeConstraints {
//      $0.top.equalTo(infoStackView.snp.bottom).offset(10.0)
//      $0.bottom.equalTo(container.view.safeAreaLayoutGuide.snp.bottom).offset(-10.0)
//      $0.leading.equalToSuperview().offset(20.0)
//      $0.trailing.equalToSuperview().offset(-20.0)
//    }
    
    mainStackView.snp.makeConstraints {
      $0.top.bottom.equalTo(container.view.safeAreaLayoutGuide)
      $0.leading.equalToSuperview().offset(20)
      $0.centerX.equalToSuperview()
    }
    
  }
  
}
