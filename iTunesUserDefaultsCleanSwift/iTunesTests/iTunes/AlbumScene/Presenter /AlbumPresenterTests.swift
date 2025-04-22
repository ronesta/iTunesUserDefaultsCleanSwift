//
//  AlbumPresenterTests.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 22.04.2025.
//

import XCTest
@testable import iTunesUserDefaultsCleanSwift

final class AlbumPresenterTests: XCTestCase {
    private var presenter: AlbumPresenter!
    private var mockView: MockAlbumView!
    private var mockAlbum: Album!

    override func setUp() {
        super.setUp()
        mockAlbum = Album(artistId: 111051,
                          artistName: "Eminem",
                          collectionName: "The Eminem Show",
                          artworkUrl100: "url_to_image",
                          collectionPrice: 10.99
                         )
        presenter = AlbumPresenter()
        mockView = MockAlbumView()
        presenter.viewController = mockView
    }

    override func tearDown() {
        presenter = nil
        mockView = nil
        mockAlbum = nil
        super.tearDown()
    }

    func testPresentAlbumDetailsCallsViewController() {
        let image = UIImage()
        let response = AlbumModels.Response(album: mockAlbum, image: image)

        presenter.presentAlbumDetails(response: response)

        XCTAssertEqual(mockView.receivedViewModel?.album, mockAlbum)
        XCTAssertEqual(mockView.receivedViewModel?.image, image)
    }
}
