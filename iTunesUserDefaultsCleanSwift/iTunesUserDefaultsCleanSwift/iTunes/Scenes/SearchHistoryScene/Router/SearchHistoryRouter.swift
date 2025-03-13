//
//  SearchHistoryRouterProtocol.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 16.02.2025.
//

import Foundation
import UIKit

final class SearchHistoryRouter: NSObject, SearchHistoryRouterProtocol {
    weak var viewController: SearchHistoryViewController?

    func routeToSearch(with term: String) {
        let searchAssembly = SearchAssembly()

        guard let searchViewController = searchAssembly.build() as? UINavigationController,
              let rootViewController = searchViewController.viewControllers.first as? SearchViewController else {
            return
        }

        rootViewController.performSearch(with: term)

        viewController?.navigationController?.pushViewController(rootViewController, animated: true)
    }
}
