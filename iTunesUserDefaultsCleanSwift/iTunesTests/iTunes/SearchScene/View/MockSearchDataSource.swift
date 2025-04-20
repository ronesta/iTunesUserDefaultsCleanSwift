//
//  MockSearchDataSource.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 20.04.2025.
//

import UIKit
@testable import iTunesUserDefaultsCleanSwift

final class MockSearchDataSource: NSObject, SearchDataSourceProtocol {
    var albums = [Album]()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        albums.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AlbumCollectionViewCell.id,
            for: indexPath)
                as? AlbumCollectionViewCell else {
            return UICollectionViewCell()
        }

        let album = albums[indexPath.item]
        let image = UIImage(systemName: "checkmark.diamond")

        cell.configure(with: album, image: image)

        return cell
    }
}
