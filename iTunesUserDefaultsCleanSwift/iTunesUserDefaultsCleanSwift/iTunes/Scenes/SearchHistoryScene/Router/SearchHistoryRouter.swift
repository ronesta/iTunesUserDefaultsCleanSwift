//
//  SearchHistoryRouterProtocol.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 16.02.2025.
//

import UIKit

protocol SearchHistoryDataStore {
}

protocol SearchHistoryRouterProtocol {
    func routeToSearch(with term: String)
}

protocol SearchHistoryDataPassing {
    var dataStore: SearchHistoryDataStore? { get }
}

class SearchHistoryRouter: NSObject, SearchHistoryRouterProtocol, SearchHistoryDataPassing {
    weak var viewController: SearchHistoryViewController?
    var dataStore: SearchHistoryDataStore?

    func routeToSearch(with term: String) {
        guard let searchViewController = SearchAssembly.build() as? UINavigationController,
              let rootViewController = searchViewController.viewControllers.first as? SearchViewController else {
            return
        }

        let request = Search.Request(searchTerm: term)

        rootViewController.searchBar.isHidden = true
        rootViewController.interactor?.searchAlbums(request: request)

        viewController?.navigationController?.pushViewController(rootViewController, animated: true)
    }
}
