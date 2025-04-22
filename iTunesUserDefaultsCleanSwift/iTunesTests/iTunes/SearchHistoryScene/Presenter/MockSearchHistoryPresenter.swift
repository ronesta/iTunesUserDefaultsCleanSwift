//
//  MockSearchHistoryPresenter.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 22.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsCleanSwift

final class MockSearchHistoryPresenter: SearchHistoryPresenterProtocol {
    private(set) var presentedHistory: SearchHistoryModels.Response?

    func presentSearchHistory(response: SearchHistoryModels.Response) {
        presentedHistory = response
    }
}
