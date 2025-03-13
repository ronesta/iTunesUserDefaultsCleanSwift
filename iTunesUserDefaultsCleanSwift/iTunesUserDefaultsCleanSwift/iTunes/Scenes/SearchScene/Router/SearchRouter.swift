//
//  SearchRouter.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 14.02.2025.
//

import Foundation

final class SearchRouter: NSObject, SearchRouterProtocol {
    weak var viewController: SearchViewController?

    func routeToAlbumDetails(with album: Album) {
        let albumAssembly = AlbumAssembly()

        let albumViewController = albumAssembly.build(with: album)
        viewController?.navigationController?.pushViewController(albumViewController, animated: true)
    }
}
