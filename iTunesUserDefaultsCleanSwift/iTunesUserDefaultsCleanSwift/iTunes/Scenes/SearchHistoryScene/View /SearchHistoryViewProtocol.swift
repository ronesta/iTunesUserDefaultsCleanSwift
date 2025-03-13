//
//  SearchHistoryViewProtocol.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 17.02.2025.
//

import Foundation

protocol SearchHistoryViewProtocol: AnyObject {
    func updateSearchHistory(viewModel: SearchHistoryModels.ViewModel)
}
