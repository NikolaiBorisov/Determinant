//
//  InfoTableAdapter.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 06.05.2022.
//

import UIKit

protocol InfoTableAdapterOutput: AnyObject {
    func itemSelected(atIndex index: Int)
}

final class InfoTableAdapter: NSObject {
    
    // MARK: - Properties
    
    var items: [PreparableViewModel] = []
    weak var output: InfoTableAdapterOutput?
}

// MARK: - UITableViewDataSource

extension InfoTableAdapter: UITableViewDataSource {
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

extension InfoTableAdapter: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        output?.itemSelected(atIndex: indexPath.row)
    }
}
