//
//  SearchPresenterProtocol.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 17.02.2025.
//

import Foundation

protocol SearchPresenterProtocol {
    func presentAlbums(response: Search.Response)
    func presentError(_ message: String)
}
