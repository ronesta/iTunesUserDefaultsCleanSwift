//
//  MockITunesServiceForInteractor.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 20.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsCleanSwift

final class MockITunesServiceForInteractor: ITunesServiceProtocol {
    private(set) var albumName: String?
    var shouldReturnError = false
    var albums = [Album]()

    func loadAlbums(albumName: String, completion: @escaping (Result<[Album], Error>) -> Void) {
        if shouldReturnError {
            let error = NSError(domain: "Test", code: 0, userInfo: nil)
            completion(.failure(error))
        } else {
            self.albumName = albumName
            completion(.success(albums))
        }
    }
}
