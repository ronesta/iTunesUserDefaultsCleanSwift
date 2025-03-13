//
//  SearchHistoryDataSourceProtocol.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 13.03.2025.
//

import Foundation
import UIKit

protocol SearchHistoryDataSourceProtocol: AnyObject, UITableViewDataSource {
    var searchHistory: [String] { get set }
}
