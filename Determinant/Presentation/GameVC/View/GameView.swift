//
//  GameView.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 24.07.2021.
//

import UIKit

protocol GameViewDelegate: AnyObject {
    func textFieldTapped(sender: UITextField)
}

final class GameView: UIView {
    
    weak var delegate: GameViewDelegate?
    
    // MARK: - Private Properties
    
    private var isActivePlayer = false
    private var isResultsHidden = true
    private var activeTextField: UITextField?
    
    private var numpadView = NumpadView()
    private var gameFieldView = GameFieldView()
    
    private lazy var winnerLabel = AppLabel(type: .winnerInfoLabel, isRounded: true)
    private lazy var playerLabel = AppLabel(type: .winnerInfoLabel, isRounded: true)
    private lazy var resultsLabel = AppLabel(type: .winnerInfoLabel, isRounded: true)
    
    private lazy var showResultMatrix = AppButton(type: .seeMatrix)
    private lazy var startButton = AppButton(type: .startOverButton)
    
    // MARK: - Private Properties
    
    private lazy var tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.separatorStyle = .none
        $0.backgroundColor = .black
        $0.showsVerticalScrollIndicator = false
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = UITableView.automaticDimension
        $0.register(cell: TextTableViewCell.self)
        $0.register(cell: GameFieldTableViewCell.self)
        $0.register(cell: ButtonTableViewCell.self)
        return $0
    }(UITableView())
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //        setupView()
        //        addSubviews()
        //        setupLayout()
        //        setupButtonAction()
        //        setupGameFieldContainer()
        // gameFieldView.delegate = self
        addSubviews()
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc private func onButtonPressed(_ sender: UIButton) {
        //        switch sender {
        //        case showResultMatrix:
        //            if isResultsHidden {
        //                gameFieldView.hideTextFields()
        //                resultsLabel.isHidden = false
        //                gameFieldView.computeTheDeterminant()
        //            } else {
        //                gameFieldView.showTextFields()
        //                resultsLabel.isHidden = true
        //                gameFieldView.computeTheDeterminant()
        //            }
        //            isResultsHidden = !isResultsHidden
        //        case startButton:
        //            gameFieldView.clearFields()
        //            winnerLabel.isHidden = true
        //            startButton.isHidden = true
        //            resultsLabel.isHidden = true
        //            showResultMatrix.isHidden = true
        //            playerLabel.isHidden = false
        //            gameFieldView.showTextFields()
        //            isResultsHidden = true
        //            numpadView.showTheButtons()
        //        default:
        //            break
        //        }
    }
    
    // MARK: - Methods
    
    func setupDelegate(withTableAdapter tableAdapter: GameTableAdapter) {
        tableView.delegate = tableAdapter
        tableView.dataSource = tableAdapter
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func setupPlayerLabel() {
        //        if isActivePlayer {
        //            activeTextField?.tintColor = .systemRed
        //            activeTextField?.textColor = .systemRed
        //            playerLabel.text = "GameVC.Player(+)Label.Text".localized
        //            playerLabel.textColor = .systemBlue
        //            isActivePlayer = false
        //        } else  {
        //            activeTextField?.tintColor = .systemBlue
        //            activeTextField?.textColor = .systemBlue
        //            playerLabel.text = "GameVC.Player(-)Label.Text".localized
        //            playerLabel.textColor = .systemRed
        //            isActivePlayer = true
        //        }
    }
    
        func setupActiveTextField(with textField: UITextField) {
            activeTextField = textField
        }
    
        func setupTextField(withText ofButton: UIButton) {
            activeTextField?.insertText(ofButton.currentTitle ?? "")
        }
    
        func setupDelegate(on view: GameScreenViewController) {
            numpadView.delegate = view
            // gameFieldView.delegate = view
        }
    
        func numpadView(isActive: Bool) {
            numpadView.isUserInteractionEnabled = isActive
        }
    
        func gameField(isActive: Bool) {
            gameFieldView.isUserInteractionEnabled = isActive
        }
    
    // MARK: - Private Methods
    
    private func addSubviews() {
        addSubview(tableView)
        addSubview(numpadView)
    }
    
    private func setupView() {
        backgroundColor = .black
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: numpadView.topAnchor, constant: -5),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            numpadView.heightAnchor.constraint(equalToConstant: 50),
            numpadView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5),
            numpadView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            numpadView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}

// MARK: - GameViewDelegate

extension GameView: GamePresenterDelegate {
    
    func textFieldTapped(sender: UITextField) {
        delegate?.textFieldTapped(sender: sender)
        activeTextField = sender
    }
    
    func didRequestShowResultMatrix() {
        print("Test")
    }
    
    func didRequestStartOver() {
        gameFieldView.clearFields()
        winnerLabel.isHidden = true
        startButton.isHidden = true
        resultsLabel.isHidden = true
        showResultMatrix.isHidden = true
        playerLabel.isHidden = false
        gameFieldView.showTextFields()
        isResultsHidden = true
        numpadView.showTheButtons()
        reloadData()
    }
}

// MARK: - GameFieldDelegate

//extension GameView: GameFieldDelegate {
//    func textFieldTapped(sender: UITextField) {
//        delegate?.textFieldTapped(sender: sender)
//        activeTextField = sender
//    }
//}
