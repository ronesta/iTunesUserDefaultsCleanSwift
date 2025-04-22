//
//  SearchHistoryViewControllerSnapshotTests.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 22.04.2025.
//

import XCTest
import SnapshotTesting
@testable import iTunesUserDefaultsCleanSwift

final class SearchHistoryViewControllerSnapshotTests: XCTestCase {
    private var viewController: SearchHistoryViewController!
    private var mockInteractor: MockSearchHistoryInteractor!
    private var mockDataSource: MockSearchHistoryDataSource!

    override func setUp() {
        super.setUp()
        mockInteractor = MockSearchHistoryInteractor()
        mockDataSource = MockSearchHistoryDataSource()
        viewController = SearchHistoryViewController(
            interactor: mockInteractor,
            tableViewDataSource: mockDataSource
        )
    }

    override func tearDown() {
        viewController = nil
        mockInteractor = nil
        mockDataSource = nil
        super.tearDown()
    }

    func testDefaultAppearance() {
        let navigationController = UINavigationController(rootViewController: viewController)

        assertSnapshot(of: navigationController, as: .image)
    }

    func testAppearanceWithUpdatedData() {
        let searchHistory = ["Search1", "Search2"]
        let viewModel = SearchHistoryModels.ViewModel(history: searchHistory)

        let navigationController = UINavigationController(rootViewController: viewController)

        viewController.loadViewIfNeeded()
        viewController.updateSearchHistory(viewModel: viewModel)
        
        assertSnapshot(of: navigationController, as: .image)
    }
}
