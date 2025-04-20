//
//  MockSearchView.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 20.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsCleanSwift

final class MockSearchView: SearchViewProtocol {
    private(set) var displayedAlbums: Search.ViewModel?
    private(set) var displayedError: String?

    func displayAlbums(viewModel: Search.ViewModel) {
        displayedAlbums = viewModel
    }

    func displayError(_ message: String) {
        displayedError = message
    }
}
