//
//  InfoScreenViewController.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 06.05.2022.
//

import UIKit

protocol InfoScreenViewInput: AnyObject {
    func handleState(_ state: InfoModels.State)
}

protocol InfoScreenViewOutput {
    func viewDidLoad()
    func onBackTapped()
}

final class InfoScreenViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private lazy var mainView = InfoView()
    private let output: InfoScreenViewOutput
    private let tableAdapter: InfoTableAdapter
    
    // MARK: - Initialization
    
    init(output: InfoScreenViewOutput, tableAdapter: InfoTableAdapter) {
        self.output = output
        self.tableAdapter = tableAdapter
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
        
        prepareNavBar()
        mainView.setupDelegate(withTableAdapter: tableAdapter)
        output.viewDidLoad()
    }
    
    // MARK: - Actions

    @objc
    private func onBackButtonTapped() {
        output.onBackTapped()
    }
    
    // MARK: - Private Methods

    private func prepareNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: AppImage.back_button,
            style: .done,
            target: self,
            action: #selector(onBackButtonTapped)
        )
    }
}

// MARK: - InfoScreenViewInput

extension InfoScreenViewController: InfoScreenViewInput {
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
