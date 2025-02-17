//
//  SearchWorker.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 14.02.2025.
//

import Foundation
import UIKit

final class SearchWorker: SearchWorkerProtocol {
    var networkManager: NetworkManagerProtocol
    var storageManager: StorageManagerProtocol

    init(networkManager: NetworkManagerProtocol,
         storageManager: StorageManagerProtocol
    ) {
        self.networkManager = networkManager
        self.storageManager = storageManager
    }

    func searchAlbums(with term: String, completion: @escaping (Result<[Album], Error>) -> Void) {
        if let savedAlbums = storageManager.loadAlbums(for: term) {
            completion(.success(savedAlbums))
            return
        }

        networkManager.loadAlbums(albumName: term) { [weak self] result in
            switch result {
            case .success(let albums):
                let sortedAlbums = albums.sorted { $0.collectionName < $1.collectionName }
                completion(.success(sortedAlbums))
                self?.storageManager.saveAlbums(albums, for: term)
                print("Successfully loaded \(albums.count) albums.")
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func loadImage(for album: Album, completion: @escaping (UIImage?) -> Void) {
        networkManager.loadImage(from: album.artworkUrl100, completion: completion)
    }
}
