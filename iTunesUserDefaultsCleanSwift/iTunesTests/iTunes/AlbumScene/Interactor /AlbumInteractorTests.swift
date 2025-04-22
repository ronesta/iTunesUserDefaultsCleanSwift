//
//  AlbumInteractorTests.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 22.04.2025.
//

import XCTest
@testable import iTunesUserDefaultsCleanSwift

final class AlbumInteractorTests: XCTestCase {
    private var interactor: AlbumInteractor!
    private var mockPresenter: MockAlbumPresenter!
    private var mockImageLoader: MockImageLoader!
    private var mockAlbum: Album!

    override func setUp() {
        super.setUp()
        mockAlbum = Album(artistId: 111051,
                          artistName: "Eminem",
                          collectionName: "The Eminem Show",
                          artworkUrl100: "url_to_image",
                          collectionPrice: 10.99
                         )
        mockPresenter = MockAlbumPresenter()
        mockImageLoader = MockImageLoader()
        interactor = AlbumInteractor(
            presenter: mockPresenter,
            imageLoader: mockImageLoader,
            album: mockAlbum
        )
    }

    override func tearDown() {
        interactor = nil
        mockPresenter = nil
        mockImageLoader = nil
        mockAlbum = nil
        super.tearDown()
    }

    func testviewDidLoadCallsPresenterWithData() {
        let mockImage = UIImage()

        interactor.viewDidLoad()
        mockImageLoader.mockImage = mockImage

        let response = AlbumModels.Response(album: mockAlbum, image: mockImage)
        mockPresenter.presentAlbumDetails(response: response)

        XCTAssertEqual(mockPresenter.receivedResponse?.album, mockAlbum)
        XCTAssertEqual(mockPresenter.receivedResponse?.image, mockImage)
    }
}
