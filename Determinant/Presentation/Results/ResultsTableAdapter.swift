//
//  ResultsTableAdapter.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 09.05.2022.
//

import UIKit

protocol ResultsTableAdapterOutput: AnyObject {
}

final class ResultsTableAdapter: NSObject {
    
    // MARK: - Properties
    
    var items: [PreparableViewModel] = []
    weak var output: ResultsTableAdapterOutput?
}

// MARK: - UITableViewDataSource

extension ResultsTableAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellId, for: indexPath)
        if let reusableCell = cell as? Preparable {
            reusableCell.prepare(withViewModel: viewModel)
        }
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ResultsTableAdapter: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
