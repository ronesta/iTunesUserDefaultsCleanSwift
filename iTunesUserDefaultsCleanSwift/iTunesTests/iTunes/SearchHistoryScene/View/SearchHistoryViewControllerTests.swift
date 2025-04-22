//
//  SearchHistoryViewControllerTests.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 22.04.2025.
//

import XCTest
@testable import iTunesUserDefaultsCleanSwift

final class SearchHistoryViewControllerTests: XCTestCase {
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

    func testViewWillAppearCallsInteractorViewDidLoad() {
        viewController.viewWillAppear(false)

        XCTAssertTrue(mockInteractor.viewDidLoadCalled)
    }

    func testUpdateSearchHistoryReloadsTableView() {
        let searchHistory = ["Search1", "Search2"]
        let viewModel = SearchHistoryModels.ViewModel(history: searchHistory)

        viewController.updateSearchHistory(viewModel: viewModel)

        XCTAssertEqual(mockDataSource.searchHistory, viewModel.history)
    }
}
