//
//  SearchPresenter.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 14.02.2025.
//

import Foundation

protocol SearchPresenterProtocol {
    func presentAlbums(response: Search.Response)
}

final class SearchPresenter: SearchPresenterProtocol {
    weak var viewController: SearchViewProtocol?

    func presentAlbums(response: Search.Response) {
        let viewModel = Search.ViewModel(albums: response.albums)
        viewController?.displayAlbums(viewModel: viewModel)
    }
}
