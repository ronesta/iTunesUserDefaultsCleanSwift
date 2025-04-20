//
//  ViewController.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 11.02.2025.
//

import UIKit
import SnapKit

final class SearchViewController: UIViewController {
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search Albums"
        searchBar.sizeToFit()
        return searchBar
    }()

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 15, height: 130)
        layout.minimumLineSpacing = 7
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets.zero

        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout
        )
        collectionView.backgroundColor = .clear
        collectionView.register(
            AlbumCollectionViewCell.self,
            forCellWithReuseIdentifier: AlbumCollectionViewCell.id
        )

        return collectionView
    }()

    private let interactor: SearchInteractorProtocol
    private let collectionViewDataSource: SearchDataSourceProtocol

    var onSelect: ((IndexPath) -> Void)?

    init(interactor: SearchInteractorProtocol,
         collectionViewDataSource: SearchDataSourceProtocol
    ) {
        self.interactor = interactor
        self.collectionViewDataSource = collectionViewDataSource
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        view.backgroundColor = .systemGray6
        view.addSubview(searchBar)
        view.addSubview(collectionView)
        navigationItem.titleView = searchBar

        searchBar.delegate = self
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = self

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
        }
    }
}

// MARK: - SearchViewProtocol
extension SearchViewController: SearchViewProtocol {
    func displayAlbums(viewModel: Search.ViewModel) {
        collectionViewDataSource.albums = viewModel.albums
        collectionView.reloadData()
    }

    func displayError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
    }

    func performSearch(with term: String) {
        searchBar.isHidden = true
        let request = Search.Request(searchTerm: term)

        interactor.searchFromHistory(with: request)
    }
}

// MARK: - UICollectionViewDelegate
extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onSelect?(indexPath)
    }
}

// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let searchTerm = searchBar.text else {
            return
        }

        let request = Search.Request(searchTerm: searchTerm)

        interactor.searchButtonClicked(with: request)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let request = Search.Request(searchTerm: searchText)

        interactor.didTypeSearch(request)
    }
}
