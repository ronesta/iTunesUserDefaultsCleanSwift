//
//  SearchInteractorTests.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 20.04.2025.
//

import XCTest
@testable import iTunesUserDefaultsCleanSwift

final class SearchInteractorTests: XCTestCase {
    private var mockSearchPresenter: MockSearchPresenter!
    private var mockITunesService: MockITunesServiceForInteractor!
    private var mockStorageManager: MockStorageManager!
    private var interactor: SearchInteractor!

    override func setUp() {
        super.setUp()
        mockSearchPresenter = MockSearchPresenter()
        mockITunesService = MockITunesServiceForInteractor()
        mockStorageManager = MockStorageManager()
        interactor = SearchInteractor(
            presenter: mockSearchPresenter,
            iTunesService: mockITunesService,
            storageManager: mockStorageManager
        )
    }

    override func tearDown() {
        mockSearchPresenter = nil
        mockITunesService = nil
        mockStorageManager = nil
        interactor = nil
        super.tearDown()
    }

    func testDidTypeSearchWithEmptyTermDoesNothing() {
        let emptyRequest = Search.Request(searchTerm: "")

        interactor.didTypeSearch(emptyRequest)

        XCTAssertNil(mockSearchPresenter.presentedAlbums)
        XCTAssertNil(mockSearchPresenter.presentedError)
    }

    func testDidTypeSearchWithSavedAlbumsPresentsAlbums() {
        let term = "SavedAlbums"

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

        mockStorageManager.saveAlbums(albums, for: term)

        let request = Search.Request(searchTerm: term)
        interactor.didTypeSearch(request)

        XCTAssertEqual(mockSearchPresenter.presentedAlbums?.albums, albums)

        let savedAlbums = mockStorageManager.loadAlbums(for: term)
        XCTAssertEqual(savedAlbums, albums)
    }

    func testDidTypeSearchWithNewAlbumsLoadsFromServiceSuccess() {
        let term = "Eminem"

        let albums = [
            Album(artistId: 111051,
                  artistName: "Eminem",
                  collectionName: "The Eminem Show",
                  artworkUrl100: "url_to_image",
                  collectionPrice: 10.99
                 )
        ]

        mockITunesService.albums = albums
        let request = Search.Request(searchTerm: term)

        interactor.didTypeSearch(request)

        XCTAssertEqual(mockSearchPresenter.presentedAlbums?.albums, albums)

        let savedAlbums = mockStorageManager.loadAlbums(for: term)
        XCTAssertEqual(savedAlbums, albums)
    }

    func testDidTypeSearchLoadsFromServiceFailure() {
        let term = "Timati"
        mockITunesService.shouldReturnError = true

        let request = Search.Request(searchTerm: term)
        interactor.didTypeSearch(request)

        XCTAssertNotNil(mockSearchPresenter.presentedError)
    }

    func testSearchButtonClickedWithNilRequestDoesNothing() {
        interactor.searchButtonClicked(with: nil)

        XCTAssertTrue(mockStorageManager.searchHistory.isEmpty)
        XCTAssertNil(mockSearchPresenter.presentedAlbums)
    }

    func testSearchButtonClickedWithEmptyTermDoesNothing() {
        let request = Search.Request(searchTerm: "")

        interactor.searchButtonClicked(with: request)

        XCTAssertTrue(mockStorageManager.searchHistory.isEmpty)
        XCTAssertNil(mockSearchPresenter.presentedAlbums)
    }

    func testSearchButtonClickedWithValidTermSavesSearchTerm() {
        let term = "Eminem"

        let albums = [
            Album(artistId: 111051,
                  artistName: "Eminem",
                  collectionName: "The Eminem Show",
                  artworkUrl100: "url_to_image",
                  collectionPrice: 10.99
                 )
        ]

        let request = Search.Request(searchTerm: term)

        mockStorageManager.saveAlbums(albums, for: term)
        interactor.searchButtonClicked(with: request)

        XCTAssertTrue(mockStorageManager.searchHistory.contains(term))
        XCTAssertEqual(mockSearchPresenter.presentedAlbums?.albums, albums)
    }

    func testSearchFromHistoryPresentsAlbumsFromStorage() {
        let term = "Eminem"

        let albums = [
            Album(artistId: 111051,
                  artistName: "Eminem",
                  collectionName: "The Eminem Show",
                  artworkUrl100: "url_to_image",
                  collectionPrice: 10.99
                 )
        ]

        mockStorageManager.saveAlbums(albums, for: term)
        interactor.searchFromHistory(with: Search.Request(searchTerm: term))

        XCTAssertEqual(mockSearchPresenter.presentedAlbums?.albums, albums)
    }
}
