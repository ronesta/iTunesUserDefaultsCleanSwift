//
//  SearchViewControllerTests.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 20.04.2025.
//

import XCTest
import ViewControllerPresentationSpy
@testable import iTunesUserDefaultsCleanSwift

final class SearchViewControllerTests: XCTestCase {
    private var viewController: SearchViewController!
    private var mockInteractor: MockSearchInteractor!
    private var mockDataSource: MockSearchDataSource!

    override func setUp() {
        super.setUp()
        mockInteractor = MockSearchInteractor()
        mockDataSource = MockSearchDataSource()
        viewController = SearchViewController(
            interactor: mockInteractor,
            collectionViewDataSource: mockDataSource
        )
    }

    override func tearDown() {
        viewController = nil
        mockDataSource = nil
        mockInteractor = nil
        super.tearDown()
    }

    func testDisplayAlbumsSetsAlbumsAndReloadsCollectionView() {
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

        let viewModel = Search.ViewModel(albums: albums)

        viewController.displayAlbums(viewModel: viewModel)

        XCTAssertEqual(mockDataSource.albums, albums)
    }

    @MainActor func testDisplayErrorShowsAlert() {
        let errorMessage = "Test Error"
        let alertVerifier = AlertVerifier()

        viewController.displayError(errorMessage)

        alertVerifier.verify(
            title: "Error",
            message: "Test Error",
            animated: true,
            actions: [
                .default("OK")
            ],
            presentingViewController: viewController
        )
    }

    func testPerformSearchHidesSearchBarAndCallsInteractor() {
        let term = "SomeTerm"

        viewController.searchBar.isHidden = false
        viewController.performSearch(with: term)

        XCTAssertTrue(viewController.searchBar.isHidden)
        XCTAssertEqual(mockInteractor.lastRequest?.searchTerm, term)
    }

    func testSearchBarSearchButtonClickedCallsInteractor() {
        let term = "SomeTerm"

        viewController.searchBar.text = term
        viewController.searchBarSearchButtonClicked(viewController.searchBar)

        XCTAssertEqual(mockInteractor.lastRequest?.searchTerm, term)
    }

    func testSearchBarTextDidChangeCallsInteractor() {
        let term = "SomeTerm"

        viewController.searchBar(viewController.searchBar, textDidChange: term)

        XCTAssertEqual(mockInteractor.lastRequest?.searchTerm, term)
    }
}
