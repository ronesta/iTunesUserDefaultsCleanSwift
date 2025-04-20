//
//  SearchPresenterTests.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 20.04.2025.
//

import XCTest
@testable import iTunesUserDefaultsCleanSwift

final class SearchPresenterTests: XCTestCase {
    private var presenter: SearchPresenter!
    private var mockView: MockSearchView!

    override func setUp() {
        super.setUp()
        presenter = SearchPresenter()
        mockView = MockSearchView()
        presenter.viewController = mockView
    }

    override func tearDown() {
        presenter = nil
        mockView = nil
        super.tearDown()
    }

    func testPresentAlbumsCallsViewWithCorrectViewModel() {
        let albums = [
            Album(artistId: 111051,
                  artistName: "Eminem",
                  collectionName: "The Eminem Show",
                  artworkUrl100: "url_to_image",
                  collectionPrice: 10.99
                 ),
            Album(artistId: 20044,
                  artistName: "Eminem",
                  collectionName: "Levitating",
                  artworkUrl100: "url_to_image",
                  collectionPrice: 9.99
                 )
        ]

        let response = Search.Response(albums: albums)

        presenter.presentAlbums(response: response)

        XCTAssertNil(mockView.displayedError)
        XCTAssertEqual(mockView.displayedAlbums?.albums, albums)
    }

    func testPresentErrorCallsViewWithErrorMessage() {
        let error = NSError(domain: "Test", code: 0, userInfo: nil)

        presenter.presentError(error.localizedDescription)

        XCTAssertNil(mockView.displayedAlbums)
        XCTAssertEqual(mockView.displayedError, error.localizedDescription)
    }
}
