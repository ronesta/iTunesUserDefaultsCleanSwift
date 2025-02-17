//
//  SearchHistoryPresenter.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 14.02.2025.
//

import Foundation

final class SearchHistoryPresenter: SearchHistoryPresenterProtocol {
    weak var viewController: SearchHistoryViewProtocol?

    func presentSearchHistory(response: SearchHistoryModels.Response) {
        let viewModel = SearchHistoryModels.ViewModel(history: response.history)
        viewController?.displaySearchHistory(viewModel: viewModel)
    }
}
