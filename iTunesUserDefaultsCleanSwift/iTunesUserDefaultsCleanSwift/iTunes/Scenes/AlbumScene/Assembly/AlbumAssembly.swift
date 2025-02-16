//
//  AlbumAssembly.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 16.02.2025.
//


import Foundation
import UIKit

final class AlbumAssembly {
    static func build(with album: Album) -> UIViewController {
        let storageManager = StorageManager()
        let networkManager = NetworkManager(storageManager: storageManager)

        let presenter = AlbumPresenter()
        let worker = AlbumWorker(networkManager: networkManager)
        let interactor = AlbumInteractor(presenter: presenter,
                                         worker: worker
        )

        let router = AlbumRouter()
        let viewController = AlbumViewController(interactor: interactor,
                                                 router: router,
                                                 album: album
        )

        router.viewController = viewController
        presenter.viewController = viewController

        return viewController
    }
}
