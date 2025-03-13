//
//  SearchHistoryInteractor.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 14.02.2025.
//

import Foundation

final class SearchHistoryInteractor: SearchHistoryInteractorProtocol {
    private let presenter: SearchHistoryPresenterProtocol
    private let storageManager: StorageManagerProtocol

    init(presenter: SearchHistoryPresenterProtocol,
         storageManager: StorageManagerProtocol
    ) {
        self.presenter = presenter
        self.storageManager = storageManager
    }

    func viewDidLoad() {
        loadSearchHistory()
    }

    private func loadSearchHistory() {
        let history = storageManager.getSearchHistory()

        let response = SearchHistoryModels.Response(history: history)
        presenter.presentSearchHistory(response: response)
    }
}
