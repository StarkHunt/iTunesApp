//
//  iTunesModel.swift
//  iTunesApp
//
//  Created by Sugat Nagavkar on 11/8/20.
//

import Foundation

struct iTunes: Codable {
    
    let feed: Feed
}

struct Feed: Codable {
    
    let title: String
    let id: String
    let author: Author
    let links: [Links]
    let copyright: String
    let country: String
    let icon: String
    let updated: String
    let results: [Results]
}

struct Author: Codable {
    
    let name: String
    let uri: String
}

struct Links: Codable {
    
    enum CodingKeys: String, CodingKey {
        case selfKey = "self"
        case alternate
    }
    let selfKey: String?
    let alternate: String?
}

struct Results: Codable {
    let artistName: String
    let id: String
    let releaseDate: String
    let name: String
    let kind: String
    let copyright: String
    let artistId: String
    let contentAdvisoryRating: String?
    let artistUrl: String
    let artworkUrl100: String
    let genres: [Genres]
    let url: String
}

struct Genres: Codable {
    
    let genreId: String
    let name: String
    let url: String
}
