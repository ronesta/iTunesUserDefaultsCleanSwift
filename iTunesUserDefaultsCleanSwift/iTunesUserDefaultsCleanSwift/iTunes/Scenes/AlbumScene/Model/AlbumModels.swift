//
//  AlbumModels.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 14.02.2025.
//

import Foundation
import UIKit

enum AlbumModels {
    struct Request {
        var album: Album
    }

    struct Response {
        var album: Album
        var image: UIImage
    }
    
    struct ViewModel {
        var album: Album
    }
}
