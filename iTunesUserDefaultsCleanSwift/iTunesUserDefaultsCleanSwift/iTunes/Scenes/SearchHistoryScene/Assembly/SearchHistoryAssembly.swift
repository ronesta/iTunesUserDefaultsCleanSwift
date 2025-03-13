//
//  SearchHistoryAssembly.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 16.02.2025.
//

import Foundation
import UIKit

final class SearchHistoryAssembly {
    func build() -> UIViewController {
        let storageManager = StorageManager()

        let presenter = SearchHistoryPresenter()
        let interactor = SearchHistoryInteractor(presenter: presenter,
                                                 storageManager: storageManager
        )
        let tableViewDataSource = SearchHistoryTableViewDataSource()

        let router = SearchHistoryRouter()

        let viewController = SearchHistoryViewController(
            interactor: interactor,
            tableViewDataSource: tableViewDataSource
        )

        router.viewController = viewController
        presenter.viewController = viewController

        let navigationController = UINavigationController(rootViewController: viewController)

        configureOnSelect(for: viewController, with: tableViewDataSource, router: router)

        let tabBarItem = UITabBarItem(title: "History",
                                      image: UIImage(systemName: "clock"),
                                      tag: 1)
        tabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 16)], for: .normal)
        navigationController.tabBarItem = tabBarItem

        return navigationController
    }

    private func configureOnSelect(for viewController: SearchHistoryViewController,
                                   with tableViewDataSource: SearchHistoryTableViewDataSource,
                                   router: SearchHistoryRouterProtocol
    ) {
        viewController.onSelect = { indexPath in
            let selectedTerm = tableViewDataSource.searchHistory[indexPath.row]
            router.routeToSearch(with: selectedTerm)
        }
    }
}
