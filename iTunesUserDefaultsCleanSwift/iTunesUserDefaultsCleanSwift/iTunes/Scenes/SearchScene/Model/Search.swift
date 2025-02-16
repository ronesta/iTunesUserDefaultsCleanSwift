//
//  Search.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 14.02.2025.
//

import Foundation

enum Search {
    struct Request {
        var searchTerm: String
    }

    struct Response {
        var albums: [Album]
    }

    struct ViewModel {
        var albums: [Album]
    }
}
