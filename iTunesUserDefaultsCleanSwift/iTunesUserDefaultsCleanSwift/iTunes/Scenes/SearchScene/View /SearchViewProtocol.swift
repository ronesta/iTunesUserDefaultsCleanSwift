//
//  SearchViewProtocol.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 17.02.2025.
//

import Foundation

protocol SearchViewProtocol: AnyObject {
    func displayAlbums(viewModel: Search.ViewModel)
    
    func displayError(_ message: String)
}
