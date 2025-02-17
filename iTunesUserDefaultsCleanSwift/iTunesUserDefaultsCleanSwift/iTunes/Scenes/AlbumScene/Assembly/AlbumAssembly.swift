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

        let viewController = AlbumViewController(interactor: interactor,
                                                 networkManager: networkManager,
                                                 album: album
        )

        presenter.viewController = viewController

        return viewController
    }
}
