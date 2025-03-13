//
//  ImageLoaderProtocol.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 13.03.2025.
//

import Foundation
import UIKit.UIImage

protocol ImageLoaderProtocol {
    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void)
}
