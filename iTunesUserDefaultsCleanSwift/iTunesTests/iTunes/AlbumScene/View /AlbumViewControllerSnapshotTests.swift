//
//  AlbumViewControllerSnapshotTests.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 22.04.2025.
//

import XCTest
import SnapshotTesting
@testable import iTunesUserDefaultsCleanSwift

final class AlbumViewControllerSnapshotTests: XCTestCase {
    private var mockInteractor: MockAlbumInteractor!
    private var viewController: AlbumViewController!

    override func setUp() {
        super.setUp()
        mockInteractor = MockAlbumInteractor()
        viewController = AlbumViewController(interactor: mockInteractor)
    }

    override func tearDown() {
        viewController = nil
        mockInteractor = nil
        super.tearDown()
    }

    func testAppearanceWithData() {
        let image = UIImage(systemName: "checkmark.diamond")
        let album = Album(artistId: 111051,
                          artistName: "Eminem",
                          collectionName: "The Eminem Show",
                          artworkUrl100: "url_to_image",
                          collectionPrice: 10.99
                         )

        let viewModel = AlbumModels.ViewModel(album: album, image: image ?? UIImage())

        viewController.displayAlbumDetails(viewModel: viewModel)

        assertSnapshot(of: viewController, as: .image)
    }
}
