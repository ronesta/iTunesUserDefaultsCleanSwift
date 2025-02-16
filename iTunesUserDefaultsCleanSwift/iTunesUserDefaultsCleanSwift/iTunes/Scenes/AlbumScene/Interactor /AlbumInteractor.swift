//
//  AlbumInteractor.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 14.02.2025.
//

import Foundation

protocol AlbumInteractorProtocol {
    func fetchAlbumDetails(request: AlbumModels.Request)
}

class AlbumInteractor: AlbumInteractorProtocol {
    var presenter: AlbumPresenterProtocol
    var worker: AlbumWorkerProtocol

    init(presenter: AlbumPresenterProtocol, worker: AlbumWorkerProtocol) {
        self.presenter = presenter
        self.worker = worker
    }

    func fetchAlbumDetails(request: AlbumModels.Request) {
        worker.fetchAlbum(albumID: request.albumID) { album in
            let response = AlbumModels.Response(album: album)
            self.presenter.presentAlbumDetails(response: response)
        }
    }
}
