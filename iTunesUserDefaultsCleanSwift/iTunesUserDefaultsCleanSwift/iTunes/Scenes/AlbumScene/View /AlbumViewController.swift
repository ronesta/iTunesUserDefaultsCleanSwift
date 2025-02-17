//
//  AlbumViewController.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 11.02.2025.
//

import Foundation
import UIKit
import SnapKit

protocol AlbumViewProtocol: AnyObject {
    func displayAlbumDetails(viewModel: AlbumModels.ViewModel)
}

final class AlbumViewController: UIViewController {
    var interactor: AlbumInteractorProtocol
    var networkManager: NetworkManagerProtocol

    var album: Album

    private let albumImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        return image
    }()

    private let albumNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()

    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .systemGray
        return label
    }()

    private let collectionPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .systemOrange
        return label
    }()

    init(interactor: AlbumInteractorProtocol,
         networkManager: NetworkManagerProtocol,
         album: Album
    ) {
        self.interactor = interactor
        self.networkManager = networkManager
        self.album = album
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        fetchAlbum()
    }

    private func setupViews() {
        view.addSubview(albumImageView)
        view.addSubview(albumNameLabel)
        view.addSubview(artistNameLabel)
        view.addSubview(collectionPriceLabel)
        view.backgroundColor = .white

        albumImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(200)
        }

        albumNameLabel.snp.makeConstraints { make in
            make.top.equalTo(albumImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.equalTo(albumImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
        }

        artistNameLabel.snp.makeConstraints { make in
            make.top.equalTo(albumNameLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }

        collectionPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(artistNameLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
    }

    private func setupAlbum() {
        //        guard let album else {
        //            return
        //        }
        //
        //        let urlString = album.artworkUrl100
        //        NetworkManager.shared.loadImage(from: urlString) { [weak self] loadedImage in
        //            DispatchQueue.main.async {
        //                self?.albumImageView.image = loadedImage
        //            }
        //        }
        //
        //        albumNameLabel.text = album.collectionName
        //        artistNameLabel.text = album.artistName
        //        collectionPriceLabel.text = "\(album.collectionPrice) $"
    }

    func fetchAlbum() {
        let request = AlbumModels.Request(album: album)
        interactor.loadAlbumDetails(request: request)
    }

}

// MARK: - AlbumViewProtocol
extension AlbumViewController: AlbumViewProtocol {
    func displayAlbumDetails(viewModel: AlbumModels.ViewModel) {
        albumNameLabel.text = viewModel.album.collectionName
        artistNameLabel.text = viewModel.album.artistName
        collectionPriceLabel.text = "\(viewModel.album.collectionPrice) $"

        let urlString = album.artworkUrl100
        networkManager.loadImage(from: urlString) { [weak self] loadedImage in
            DispatchQueue.main.async {
                self?.albumImageView.image = loadedImage
            }
        }
    }
}
