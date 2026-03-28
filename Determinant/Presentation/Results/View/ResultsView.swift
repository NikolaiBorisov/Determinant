//
//  ResultsView.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 09.05.2022.
//

import UIKit

final class ResultsView: UIView {
    
    // MARK: - Private Properties
    
    private lazy var tableView: UITableView = {
        $0.separatorStyle = .singleLine
        $0.separatorColor = .white
        $0.backgroundColor = .black
        $0.tableHeaderView = UIView()
        $0.showsVerticalScrollIndicator = false
        $0.rowHeight = UITableView.automaticDimension
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.estimatedRowHeight = UITableView.automaticDimension
        $0.register(cell: ResultsTableViewCell.self)
        return $0
    }(UITableView())
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func setupDelegate(withTableAdapter tableAdapter: ResultsTableAdapter) {
        tableView.delegate = tableAdapter
        tableView.dataSource = tableAdapter
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    // MARK: - Private Methods
    
    private func addSubviews() {
        addSubview(tableView)
    }
    
    private func setupView() {
        backgroundColor = .black
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
