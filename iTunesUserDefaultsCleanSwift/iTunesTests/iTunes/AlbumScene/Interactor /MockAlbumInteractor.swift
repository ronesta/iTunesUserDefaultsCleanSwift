//
//  MockAlbumInteractor.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 22.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsCleanSwift

final class MockAlbumInteractor: AlbumInteractorProtocol {
    private(set) var viewDidLoadCalled = false

    func viewDidLoad() {
        viewDidLoadCalled = true
    }
}
