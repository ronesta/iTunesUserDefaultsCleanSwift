//
//  SearchHistoryPresenterTests.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 22.04.2025.
//

import XCTest
@testable import iTunesUserDefaultsCleanSwift

final class SearchHistoryPresenterTests: XCTestCase {
    private var presenter: SearchHistoryPresenter!
    private var mockView: MockSearchHistoryView!

    override func setUp() {
        super.setUp()
        presenter = SearchHistoryPresenter()
        mockView = MockSearchHistoryView()
        presenter.viewController = mockView
    }

    override func tearDown() {
        presenter = nil
        mockView = nil
        super.tearDown()
    }

    func testPresentSearchHistoryPassesViewModelToView() {
        let searchHistory = ["Search1", "Search2"]
        let response = SearchHistoryModels.Response(history: searchHistory)

        presenter.presentSearchHistory(response: response)

        XCTAssertEqual(mockView.receivedViewModel?.history, searchHistory)
    }
}
