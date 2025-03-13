//
//  AlbumInteractor.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 14.02.2025.
//

import Foundation
import UIKit

final class AlbumInteractor: AlbumInteractorProtocol {
    private let presenter: AlbumPresenterProtocol
    private let imageLoader: ImageLoaderProtocol
    private let album: Album

    init(presenter: AlbumPresenterProtocol,
         imageLoader: ImageLoaderProtocol,
         album: Album
    ) {
        self.presenter = presenter
        self.imageLoader = imageLoader
        self.album = album
    }

    func viewDidLoad() {
        let request = AlbumModels.Request(album: album)
        loadAlbumDetails(request: request)
    }

    private func loadAlbumDetails(request: AlbumModels.Request) {
        imageLoader.loadImage(from: request.album.artworkUrl100) { [weak self] loadedImage in

            guard let self,
                  let loadedImage else {
                return
            }

            let response = AlbumModels.Response(album: request.album, image: loadedImage)

            self.presenter.presentAlbumDetails(response: response)
        }
    }
}
