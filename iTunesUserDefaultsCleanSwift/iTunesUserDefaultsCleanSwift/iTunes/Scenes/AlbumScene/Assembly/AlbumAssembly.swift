//
//  AlbumAssembly.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 16.02.2025.
//

import Foundation
import UIKit

final class AlbumAssembly {
    func build(with album: Album) -> UIViewController {
        let storageManager = StorageManager()
        let imageLoader = ImageLoader(storageManager: storageManager)

        let presenter = AlbumPresenter()

        let interactor = AlbumInteractor(presenter: presenter,
                                         imageLoader: imageLoader,
                                         album: album
        )

        let viewController = AlbumViewController(interactor: interactor)

        presenter.viewController = viewController

        return viewController
    }
}
