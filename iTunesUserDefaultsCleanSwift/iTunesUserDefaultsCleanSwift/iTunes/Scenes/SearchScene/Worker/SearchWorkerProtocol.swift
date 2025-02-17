//
//  SearchWorkerProtocol.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 17.02.2025.
//

import Foundation
import UIKit

protocol SearchWorkerProtocol {
    func searchAlbums(with term: String, completion: @escaping (Result<[Album], Error>) -> Void)
    func loadImage(for album: Album, completion: @escaping (UIImage?) -> Void)
}
