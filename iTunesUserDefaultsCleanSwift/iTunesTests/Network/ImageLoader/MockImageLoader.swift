//
//  MockImageLoader.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 20.04.2025.
//

import UIKit.UIImage
@testable import iTunesUserDefaultsCleanSwift

final class MockImageLoader: ImageLoaderProtocol {
    var mockImage: UIImage?
    var shouldReturnError: Bool = false

    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        if shouldReturnError {
            completion(nil)
        } else {
            completion(mockImage)
        }
    }
}
