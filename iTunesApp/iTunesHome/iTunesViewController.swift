//
//  ViewController.swift
//  iTunesApp
//
//  Created by Sugat Nagavkar on 11/8/20.
//

import UIKit

class iTunesViewController: UIViewController {

    //MARK:- Properties
    let itunesCellID = "iTunesCellID"
    var viewModel: iTunesViewModel?
    
    let tableView: UITableView = {
       let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK:- Life Cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        setUpViews()
        fetchData()
    }
    
    func configure() {
        title = "Itunes Albums"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        tableView.register(iTunesTableViewCell.self, forCellReuseIdentifier: itunesCellID)
    }
    
    func setUpViews() {
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func fetchData() {
        
        viewModel = iTunesViewModel(result: [])
        
        viewModel?.fetchRecords(completion: { [weak self] result in
            switch result {
            case .success(_ ):
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_ ):
                DispatchQueue.main.async {
                    self?.showAlert()
                }
            }
        })
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: "Oops, Something went wrong", message: "Unable to get iTunes Albums", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
}



