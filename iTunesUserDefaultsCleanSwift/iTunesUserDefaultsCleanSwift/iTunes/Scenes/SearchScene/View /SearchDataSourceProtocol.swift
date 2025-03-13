//
//  SearchDataSourceProtocol.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 13.03.2025.
//

import Foundation
import UIKit

protocol SearchDataSourceProtocol: AnyObject, UICollectionViewDataSource {
    var albums: [Album] { get set }
}
