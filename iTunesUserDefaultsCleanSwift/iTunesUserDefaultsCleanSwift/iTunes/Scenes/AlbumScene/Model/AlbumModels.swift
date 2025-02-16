//
//  AlbumModels.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 14.02.2025.
//

import Foundation

enum AlbumModels {
    struct Request {
        var albumID: String
    }

    struct Response {
        var album: Album
    }
    
    struct ViewModel {
        var album: Album
    }
}
