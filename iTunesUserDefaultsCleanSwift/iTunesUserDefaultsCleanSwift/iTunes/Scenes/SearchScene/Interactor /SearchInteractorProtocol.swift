//
//  SearchInteractorProtocol.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 17.02.2025.
//

import Foundation

protocol SearchInteractorProtocol {
    func didTypeSearch(_ searchQuery: Search.Request)
    func searchButtonClicked(with request: Search.Request?)
    func searchFromHistory(with request: Search.Request)
}
