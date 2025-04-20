//
//  SearchInteractor.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 14.02.2025.
//

import Foundation

final class SearchInteractor: SearchInteractorProtocol {
    private let presenter: SearchPresenterProtocol
    private let iTunesService: ITunesServiceProtocol
    private let storageManager: StorageManagerProtocol

    init(presenter: SearchPresenterProtocol,
         iTunesService: ITunesServiceProtocol,
         storageManager: StorageManagerProtocol
    ) {
        self.presenter = presenter
        self.iTunesService = iTunesService
        self.storageManager = storageManager
    }

    private func saveSearchTerm(_ searchQuery: Search.Request) {
        storageManager.saveSearchTerm(searchQuery.searchTerm)
    }

    func didTypeSearch(_ searchQuery: Search.Request) {
        guard !searchQuery.searchTerm.isEmpty else {
            return
        }

        searchAlbums(with: searchQuery)
    }

    func searchButtonClicked(with request: Search.Request?) {
        guard let request, !request.searchTerm.isEmpty else {
            return
        }

        saveSearchTerm(request)
        searchAlbums(with: request)
    }

    func searchFromHistory(with request: Search.Request) {
        searchAlbums(with: request)
    }

    private func searchAlbums(with request: Search.Request) {
        if let savedAlbums = storageManager.loadAlbums(for: request.searchTerm) {
            let response = Search.Response(albums: savedAlbums)
            self.presenter.presentAlbums(response: response)
            return
        }

        iTunesService.loadAlbums(albumName: request.searchTerm) { [weak self] result in
            switch result {
            case .success(let albums):
                let sortedAlbums = albums.sorted { $0.collectionName < $1.collectionName }
                let response = Search.Response(albums: sortedAlbums)
                self?.presenter.presentAlbums(response: response)
                self?.storageManager.saveAlbums(albums, for: request.searchTerm)
                print("Successfully loaded \(albums.count) albums.")
            case .failure(let error):
                self?.presenter.presentError(error.localizedDescription)
                print("Error fetching albums: (error.localizedDescription)")
            }
        }
    }
}
