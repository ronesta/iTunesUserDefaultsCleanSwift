//
//  SearchHistoryInteractor.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 14.02.2025.
//

import Foundation

protocol SearchHistoryInteractorProtocol {
    func fetchSearchHistory(request: SearchHistoryModels.Request)
}

final class SearchHistoryInteractor: SearchHistoryInteractorProtocol, SearchHistoryDataStore {
    var presenter: SearchHistoryPresenterProtocol
    var worker: SearchHistoryWorkerProtocol

    init(presenter: SearchHistoryPresenterProtocol,
         worker: SearchHistoryWorkerProtocol
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func fetchSearchHistory(request: SearchHistoryModels.Request) {
        let history = worker.loadSearchHistory()

        let response = SearchHistoryModels.Response(history: history)
        presenter.presentSearchHistory(response: response)
    }
}
