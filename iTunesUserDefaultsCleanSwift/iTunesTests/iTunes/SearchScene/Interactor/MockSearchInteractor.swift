//
//  MockSearchInteractor.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 20.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsCleanSwift

final class MockSearchInteractor: SearchInteractorProtocol {
    private(set) var lastRequest: Search.Request?

    func searchFromHistory(with request: Search.Request) {
        lastRequest = request
    }

    func searchButtonClicked(with request: Search.Request?) {
        lastRequest = request
    }

    func didTypeSearch(_ request: Search.Request) {
        lastRequest = request
    }
}
