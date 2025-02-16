//
//  SearchHistoryWorker.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 14.02.2025.
//

import Foundation

protocol SearchHistoryWorkerProtocol {
    func loadSearchHistory() -> [String]
}

final class SearchHistoryWorker: SearchHistoryWorkerProtocol {
    var storageManager: StorageManagerProtocol

    init(storageManager: StorageManagerProtocol) {
        self.storageManager = storageManager
    }

    func loadSearchHistory() -> [String] {
        let history = storageManager.getSearchHistory()

        return history
    }
}
