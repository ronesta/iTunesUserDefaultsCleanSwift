//
//  SearchRouter.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 14.02.2025.
//

import Foundation
import UIKit

protocol SearchDataStore {
    var albums: [Album] { get set }
}

protocol SearchRouterProtocol {
    func routeToAlbumDetail(albumID: Int)
}

protocol SearchDataPassing {
    var dataStore: SearchDataStore? { get }
}

class SearchRouter: NSObject, SearchRouterProtocol, SearchDataPassing {
    weak var viewController: SearchViewController?
    var dataStore: SearchDataStore?

    func routeToAlbumDetail(albumID: Int) {
        guard let album = dataStore?.albums[albumID] else { return }

        let albumViewController = AlbumAssembly.build(with: album)
        viewController?.navigationController?.pushViewController(albumViewController, animated: true)
    }
}
