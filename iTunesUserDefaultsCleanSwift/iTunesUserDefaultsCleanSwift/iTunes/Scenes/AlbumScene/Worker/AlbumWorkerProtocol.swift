//
//  AlbumWorkerProtocol.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 17.02.2025.
//

import Foundation
import UIKit

protocol AlbumWorkerProtocol {
    func loadAlbumDetails(with album: AlbumModels.Request, completion: @escaping (UIImage?) -> Void)
}
