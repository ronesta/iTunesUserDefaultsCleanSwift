//
//  SearchAssembly.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 16.02.2025.
//

import Foundation
import UIKit

final class SearchAssembly {
    func build() -> UIViewController {
        let storageManager = StorageManager()
        let iTunesService = ITunesService()
        let imageLoader = ImageLoader(storageManager: storageManager)

        let presenter = SearchPresenter()
        let interactor = SearchInteractor(presenter: presenter,
                                          iTunesService: iTunesService,
                                          storageManager: storageManager
        )

        let router = SearchRouter()

        let collectionViewDataSource = SearchCollectionViewDataSource(imageLoader: imageLoader)

        let viewController = SearchViewController(
            interactor: interactor,
            collectionViewDataSource: collectionViewDataSource
        )

        router.viewController = viewController
        presenter.viewController = viewController

        let navigationController = UINavigationController(rootViewController: viewController)

        configureOnSelect(for: viewController, with: collectionViewDataSource, router: router)

        let tabBarItem = UITabBarItem(title: "Search",
                                      image: UIImage(systemName: "magnifyingglass"),
                                      tag: 0)
        tabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 16)], for: .normal)
        navigationController.tabBarItem = tabBarItem

        return navigationController
    }

    private func configureOnSelect(for viewController: SearchViewController,
                                   with collectionViewDataSource: SearchCollectionViewDataSource,
                                   router: SearchRouterProtocol
    ) {
        viewController.onSelect = { indexPath in
            let album = collectionViewDataSource.albums[indexPath.item]

            router.routeToAlbumDetails(with: album)
        }
    }
}
