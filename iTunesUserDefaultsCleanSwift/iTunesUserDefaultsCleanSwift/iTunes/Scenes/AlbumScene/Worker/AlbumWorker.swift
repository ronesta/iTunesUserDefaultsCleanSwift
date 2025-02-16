//
//  AlbumWorker.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 14.02.2025.
//

import Foundation

protocol AlbumWorkerProtocol {
    func fetchAlbum(albumID: String, completion: @escaping (Album) -> Void)
}

class AlbumWorker: AlbumWorkerProtocol {
    var networkManager: NetworkManagerProtocol

    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }

    func fetchAlbum(albumID: String, completion: @escaping (Album) -> Void) {
        // Используем NetworkManager для загрузки альбома по ID
        networkManager.loadAlbums(albumName: albumID) { (result) in
            switch result {
            case .success(let albums):
                if let album = albums.first {
                    completion(album)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
