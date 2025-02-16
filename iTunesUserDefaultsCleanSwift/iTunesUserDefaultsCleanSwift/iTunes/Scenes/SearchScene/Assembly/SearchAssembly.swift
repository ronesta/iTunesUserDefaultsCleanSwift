//
//  SearchAssembly.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 16.02.2025.
//

import Foundation
import UIKit

final class SearchAssembly {
    static func build() -> UIViewController {
        let storageManager = StorageManager()
        let networkManager = NetworkManager(storageManager: storageManager)

        let viewController = SearchViewController()

        let presenter = SearchPresenter()
        let worker = SearchWorker(networkManager: networkManager,
                                  storageManager: storageManager
        )
        let interactor = SearchInteractor(presenter: presenter,
                                          worker: worker
        )
        let router = SearchRouter()

        viewController.interactor = interactor
        viewController.router = router
        viewController.storageManager = storageManager
        viewController.networkManager = networkManager

        router.viewController = viewController
        presenter.viewController = viewController

        let navigationController = UINavigationController(rootViewController: viewController)
        let tabBarItem = UITabBarItem(title: "Search",
                                      image: UIImage(systemName: "magnifyingglass"),
                                      tag: 0)
        tabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 16)], for: .normal)
        navigationController.tabBarItem = tabBarItem

        return navigationController
    }
}
