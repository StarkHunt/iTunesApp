//
//  Network.swift
//  iTunesApp
//
//  Created by Sugat Nagavkar on 11/9/20.
//

import Foundation
import UIKit

class Network {
    
    func fetchData(urlString: String, completion: @escaping (Result<Data, Error>)->()) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }
            
            if let data = data {
                completion(.success(data))
            }
        }
        .resume()
    }
}
