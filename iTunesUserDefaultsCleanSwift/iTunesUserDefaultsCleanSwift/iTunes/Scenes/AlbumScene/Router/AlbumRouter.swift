//
//  AlbumRouterProtocol.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 16.02.2025.
//

import Foundation
import UIKit

protocol AlbumDataStore {
    var album: Album? { get set }
}

protocol AlbumRouterProtocol {
    // Здесь можно добавить логическую маршрутизацию
}

protocol AlbumDataPassing {
    var dataStore: AlbumDataStore? { get }
}

class AlbumRouter: NSObject, AlbumRouterProtocol, AlbumDataPassing {
    weak var viewController: AlbumViewController?
    var dataStore: AlbumDataStore?
}
