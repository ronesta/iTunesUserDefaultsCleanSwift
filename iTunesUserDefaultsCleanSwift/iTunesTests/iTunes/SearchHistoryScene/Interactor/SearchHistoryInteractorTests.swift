//
//  SearchHistoryInteractorTests.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 22.04.2025.
//

import XCTest
@testable import iTunesUserDefaultsCleanSwift

final class SearchHistoryInteractorTests: XCTestCase {
    private var interactor: SearchHistoryInteractor!
    private var mockPresenter: MockSearchHistoryPresenter!
    private var mockStorageManager: MockStorageManager!

    override func setUp() {
        super.setUp()
        mockPresenter = MockSearchHistoryPresenter()
        mockStorageManager = MockStorageManager()
        interactor = SearchHistoryInteractor(
            presenter: mockPresenter,
            storageManager: mockStorageManager
        )
    }

    override func tearDown() {
        interactor = nil
        mockPresenter = nil
        mockStorageManager = nil
        super.tearDown()
    }

    func testLoadSearchHistoryCallsStorageManager() {
        let searchHistory = ["Search1", "Search2"]

        searchHistory.forEach { term in
            mockStorageManager.saveSearchTerm(term)
        }

        interactor.viewDidLoad()

        XCTAssertEqual(mockStorageManager.searchHistory, searchHistory)
        XCTAssertEqual(mockPresenter.presentedHistory?.history, searchHistory)
    }
}
