//
//  AlbumPresenter.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 14.02.2025.
//

import Foundation

protocol AlbumPresenterProtocol {
    func presentAlbumDetails(response: AlbumModels.Response)
}

class AlbumPresenter: AlbumPresenterProtocol {
    weak var viewController: AlbumViewProtocol?

    func presentAlbumDetails(response: AlbumModels.Response) {
        let viewModel = AlbumModels.ViewModel(album: response.album)

        viewController?.displayAlbumDetails(viewModel: viewModel)
    }
}
