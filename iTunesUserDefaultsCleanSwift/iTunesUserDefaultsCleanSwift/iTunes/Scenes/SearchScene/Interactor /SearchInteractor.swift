//
//  SearchInteractor.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 14.02.2025.
//

import Foundation

protocol SearchInteractorProtocol {
    func searchAlbums(request: Search.Request)
}

final class SearchInteractor: SearchInteractorProtocol {
    var presenter: SearchPresenterProtocol
    var worker: SearchWorkerProtocol

    init(presenter: SearchPresenterProtocol,
         worker: SearchWorkerProtocol
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func searchAlbums(request: Search.Request) {
        worker.searchAlbums(with: request.searchTerm) { [weak self] result in
            switch result {
            case .success(let albums):
                let response = Search.Response(albums: albums)
                self?.presenter.presentAlbums(response: response)
            case .failure(_):
                print("Error fetching albums: (error.localizedDescription)")
            }
        }
    }
}
