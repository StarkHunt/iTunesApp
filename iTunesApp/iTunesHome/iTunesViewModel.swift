//
//  iTunesViewModel.swift
//  iTunesApp
//
//  Created by Sugat Nagavkar on 11/8/20.
//

import UIKit

protocol FetchProtocol: class {
    func fetchRecords(completion: @escaping (Result<[Results], Error>)->())
}

class iTunesViewModel {
    
    var result: [Results]?
    let fetchProtocol: FetchProtocol
    
    init(fetchProtocol: FetchProtocol = FetchRequest(), result: [Results]?) {
        self.fetchProtocol = fetchProtocol
        self.result = result
    }
    
    func fetchRecords(completion: @escaping (Result<Bool, Error>)->()) {

        fetchProtocol.fetchRecords { [weak self] (result) in
            switch result {
                case .success(let results):
                    self?.result = results
                    completion(.success(true))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }  
}
