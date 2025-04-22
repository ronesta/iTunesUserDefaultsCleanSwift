//
//  MockSearchHistoryView.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 22.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsCleanSwift

final class MockSearchHistoryView: SearchHistoryViewProtocol {
    private(set) var receivedViewModel: SearchHistoryModels.ViewModel?

    func updateSearchHistory(viewModel: SearchHistoryModels.ViewModel) {
        receivedViewModel = viewModel
    }
}
