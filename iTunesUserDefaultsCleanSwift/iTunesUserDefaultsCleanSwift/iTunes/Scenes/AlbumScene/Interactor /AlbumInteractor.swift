//
//  AlbumInteractor.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 14.02.2025.
//

import Foundation
import UIKit

protocol AlbumInteractorProtocol {
    func loadAlbumDetails(request: AlbumModels.Request)
}

class AlbumInteractor: AlbumInteractorProtocol {
    var presenter: AlbumPresenterProtocol
    var worker: AlbumWorkerProtocol

    init(presenter: AlbumPresenterProtocol, worker: AlbumWorkerProtocol) {
        self.presenter = presenter
        self.worker = worker
    }

    func loadAlbumDetails(request: AlbumModels.Request) {
        worker.loadAlbumDetails(with: request) { image in
            let response = AlbumModels.Response(album: request.album, image: image ?? UIImage())
            self.presenter.presentAlbumDetails(response: response)
        }
    }
}
