//
//  ResultsScreenViewController.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 09.05.2022.
//

import UIKit

protocol ResultsScreenViewInput: AnyObject {
    func handleState(_ state: ResultsModels.State)
}

protocol ResultsScreenViewOutput: AnyObject {
    func viewDidLoad()
    func onBackTapped()
}

final class ResultsScreenViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private lazy var mainView = ResultsView()
    private var output: ResultsScreenViewOutput
    private var tableAdapter: ResultsTableAdapter
    
    // MARK: - Initialization
    
    init(output: ResultsScreenViewOutput, tableAdapter: ResultsTableAdapter) {
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
    
    // MARK: - Lifecycle
    
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

// MARK: - ResultsScreenViewInput

extension ResultsScreenViewController: ResultsScreenViewInput {
    func handleState(_ state: ResultsModels.State) {
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
