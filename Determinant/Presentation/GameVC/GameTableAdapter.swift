//
//  GameTableAdapter.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 28.05.2022.
//

import UIKit

protocol GameTableAdapterOutput: AnyObject {
    func itemSelected(atIndex index: Int)
    func textFieldTapped(sender: UITextField)
}

final class GameTableAdapter: NSObject {
    
    // MARK: - Properties
    
    var items: [PreparableViewModel] = []
    weak var output: GameTableAdapterOutput?
}

// MARK: - UITableViewDataSource

extension GameTableAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellId, for: indexPath)
        if let reusableCell = cell as? GameFieldTableViewCell {
            reusableCell.delegate = self
            reusableCell.prepare(withViewModel: viewModel)
        } else if let reusableCell = cell as? Preparable {
            reusableCell.prepare(withViewModel: viewModel)
        }
        return cell
    }
}

// MARK: - UITableViewDelegate

extension GameTableAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        output?.itemSelected(atIndex: indexPath.row)
    }
}

extension GameTableAdapter: GameFieldTableViewCellDelegate {
    func textFieldTapped(sender: UITextField) {
        output?.textFieldTapped(sender: sender)
    }
}
