//
//  SearchViewControllerSnapshotTests.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 20.04.2025.
//

import XCTest
import SnapshotTesting
@testable import iTunesUserDefaultsCleanSwift

final class SearchViewControllerSnapshotTests: XCTestCase {
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

    func testSearchViewControllerInitialAppearance() {
        let navigationController = UINavigationController(rootViewController: viewController)

        assertSnapshot(of: navigationController, as: .image)
    }

    func testSearchViewControllerWithAlbums() {
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

        viewController.loadViewIfNeeded()

        let navigationController = UINavigationController(rootViewController: viewController)
        let viewModel = Search.ViewModel(albums: albums)

        viewController.displayAlbums(viewModel: viewModel)

        assertSnapshot(of: navigationController, as: .image)
    }
}
