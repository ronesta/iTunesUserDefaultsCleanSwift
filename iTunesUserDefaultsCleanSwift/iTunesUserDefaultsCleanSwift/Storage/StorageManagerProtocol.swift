//
//  StorageManagerProtocol.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 14.02.2025.
//

import Foundation

protocol StorageManagerProtocol: AnyObject {
    func saveAlbums(_ albums: [Album], for searchTerm: String)

    func loadAlbums(for searchTerm: String) -> [Album]?

    func saveImage(_ image: Data, key: String)

    func loadImage(key: String) -> Data?

    func saveSearchTerm(_ term: String)

    func getSearchHistory() -> [String]
}
