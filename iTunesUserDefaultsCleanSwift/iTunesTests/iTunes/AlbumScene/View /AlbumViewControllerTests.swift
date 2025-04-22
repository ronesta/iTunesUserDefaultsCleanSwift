//
//  AlbumViewControllerTests.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 22.04.2025.
//

import XCTest
@testable import iTunesUserDefaultsCleanSwift

final class AlbumViewControllerTests: XCTestCase {
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


    func testViewDidLoadCallsInteractor() {
        viewController.viewDidLoad()

        XCTAssertTrue(mockInteractor.viewDidLoadCalled)
    }

    func testDisplayAlbumDetailsUpdatesUI() {
        let image = UIImage()
        let album = Album(artistId: 111051,
                          artistName: "Eminem",
                          collectionName: "The Eminem Show",
                          artworkUrl100: "url_to_image",
                          collectionPrice: 10.99
                         )

        let viewModel = AlbumModels.ViewModel(album: album, image: image)

        viewController.displayAlbumDetails(viewModel: viewModel)

        XCTAssertEqual(viewController.albumNameLabel.text, "The Eminem Show")
        XCTAssertEqual(viewController.artistNameLabel.text, "Eminem")
        XCTAssertEqual(viewController.collectionPriceLabel.text, "10.99 $")
        XCTAssertEqual(viewController.albumImageView.image, image)
    }
}
