//
//  Album.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 11.02.2025.
//

import Foundation

struct PostAlbums: Codable {
    let results: [Album]
}

struct Album: Codable, Equatable {
    let artistId: Int
    let artistName: String
    let collectionName: String
    let artworkUrl100: String
    let collectionPrice: Double
}
