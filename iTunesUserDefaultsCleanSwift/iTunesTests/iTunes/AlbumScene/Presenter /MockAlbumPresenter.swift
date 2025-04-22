//
//  MockAlbumPresenter.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 22.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsCleanSwift

final class MockAlbumPresenter: AlbumPresenterProtocol {
    private(set) var receivedResponse: AlbumModels.Response?

    func presentAlbumDetails(response: AlbumModels.Response) {
        receivedResponse = response
    }
}
