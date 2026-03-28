//
//  CustomGameField.swift
//  Mathematical Determinant App
//
//  Created by NIKOLAI BORISOV on 04.03.2021.
//

import UIKit

protocol GameScreenViewInput: AnyObject {
    func handleState(_ state: InfoModels.State)
}

protocol GameScreenViewOutput {
    func viewDidLoad()
    func onBackTapped()
}

final class GameScreenViewController: UIViewController, LoadableAlertController {
    
    // MARK: - Private Properties
    
    private(set) lazy var mainView = GameView()
    private var output: GameScreenViewOutput
    private let tableAdapter: GameTableAdapter
    
    // MARK: - Initialization
    
    init(output: GameScreenViewOutput, tableAdapter: GameTableAdapter) {
        self.output = output
        self.tableAdapter = tableAdapter
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
        
        prepareNavBar()
        mainView.alpha = 0
        showAlertHandler()
        mainView.setupDelegate(withTableAdapter: tableAdapter)
        mainView.setupDelegate(on: self)
        mainView.delegate = self
        output.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @objc
    private func onBackButtonTapped() {
        output.onBackTapped()
    }
    
    // MARK: - Private Methods
    
    private func showAlertHandler() {
        showAlert(title: "AlertVC.GameBeginning.Text".localized, isTextFieldActive: false, completion: { _,_ in
            self.mainView.alpha = 1
        })
    }
    
    private func prepareNavBar() {
        title = "GameVC.ScreenTitle".localized
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: AppImage.back_button,
            style: .done,
            target: self,
            action: #selector(onBackButtonTapped)
        )
    }
}

// MARK: - GameFieldDelegate

//extension GameScreenViewController: GameFieldDelegate {
//    func textFieldTapped(sender: UITextField) {
//        mainView.setupActiveTextField(with: sender)
//        mainView.numpadView(isActive: true)
//    }
//}

// MARK: - NumpadViewDelegate

extension GameScreenViewController: NumpadViewDelegate {
    func onButtonPressed(button: UIButton) {
        mainView.setupTextField(withText: button)
        mainView.numpadView(isActive: false)
        mainView.gameField(isActive: true)
        mainView.setupPlayerLabel()
    }
}

// MARK: - GameScreenViewInput

extension GameScreenViewController: GameScreenViewInput {
    func handleState(_ state: InfoModels.State) {
        switch state {
        case .success(let items):
            tableAdapter.items = items
            mainView.reloadData()
        case .failure(let error):
            print(error.localizedDescription)
        case .default:
            break
        }
    }
}

extension GameScreenViewController: GameViewDelegate {
    func textFieldTapped(sender: UITextField) {
        mainView.setupActiveTextField(with: sender)
        mainView.numpadView(isActive: true)
    }
}
