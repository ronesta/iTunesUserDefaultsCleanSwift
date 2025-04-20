//
//  MockPresenter.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 20.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsCleanSwift

class MockSearchPresenter: SearchPresenterProtocol {
    private(set) var presentedAlbums: Search.Response?
    private(set) var presentedError: String?

    func presentAlbums(response: Search.Response) {
        presentedAlbums = response
    }

    func presentError(_ message: String) {
        presentedError = message
    }
}
