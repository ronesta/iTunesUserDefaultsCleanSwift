//
//  NetworkManagerProtocol.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 14.02.2025.
//

import Foundation

protocol ITunesServiceProtocol: AnyObject {
    func loadAlbums(albumName: String, completion: @escaping (Result<[Album], Error>) -> Void)
}
