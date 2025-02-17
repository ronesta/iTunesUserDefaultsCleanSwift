//
//  SearchInteractorProtocol.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 17.02.2025.
//

import Foundation
import UIKit

protocol SearchInteractorProtocol {
    func searchAlbums(request: Search.Request)
    func loadImage(for album: Album, completion: @escaping (UIImage?) -> Void)
}
