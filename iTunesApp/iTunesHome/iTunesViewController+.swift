//
//  iTunesViewController+.swift
//  iTunesApp
//
//  Created by Sugat Nagavkar on 11/9/20.
//

import UIKit

extension iTunesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.result?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: itunesCellID, for: indexPath) as? iTunesTableViewCell
        cell?.viewModel = viewModel?.result?[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailViewController = iTunesDetailViewController()
        detailViewController.result = viewModel?.result?[indexPath.row]
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
