//
//  AlbumWorker.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 14.02.2025.
//

import Foundation
import UIKit

final class AlbumWorker: AlbumWorkerProtocol {
    var networkManager: NetworkManagerProtocol

    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }

    func loadAlbumDetails(with album: AlbumModels.Request, completion: @escaping (UIImage?) -> Void) {
        networkManager.loadImage(from: album.album.artworkUrl100, completion: completion)
    }
}
