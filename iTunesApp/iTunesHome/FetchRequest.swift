//
//  FetchRequest.swift
//  iTunesApp
//
//  Created by Sugat Nagavkar on 11/9/20.
//

import Foundation

class FetchRequest: FetchProtocol {
    
    func fetchRecords(completion: @escaping (Result<[Results], Error>) -> ()) {
        
        let urlString = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/100/explicit.json"
        Network().fetchData(urlString: urlString) { (result) in
            switch result {
                case .success(let data):
                    let decodeData = try? JSONDecoder().decode(iTunes.self, from: data)
                    completion(.success(decodeData?.feed.results ?? []))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
