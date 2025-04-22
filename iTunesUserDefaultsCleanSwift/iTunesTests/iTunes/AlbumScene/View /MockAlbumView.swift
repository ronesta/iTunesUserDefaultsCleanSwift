//
//  MockAlbumView.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 22.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsCleanSwift

final class MockAlbumView: AlbumViewProtocol {
    private(set) var receivedViewModel: AlbumModels.ViewModel?

    func displayAlbumDetails(viewModel: AlbumModels.ViewModel) {
        receivedViewModel = viewModel
    }
}

