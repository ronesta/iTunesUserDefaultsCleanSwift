//
//  SearchHistoryViewController.swift
//  iTunesUserDefaultsCleanSwift
//
//  Created by Ибрагим Габибли on 11.02.2025.
//

import Foundation
import UIKit

final class SearchHistoryViewController: UIViewController {
    var interactor: SearchHistoryInteractorProtocol?
    var router: SearchHistoryRouterProtocol?

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    private let id = "cell"
    var searchHistory = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateSearchHistory()
    }

    private func setupNavigationBar() {
        title = "History"
    }

    private func setupViews() {
        view.addSubview(tableView)
        view.backgroundColor = .systemGray6

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: id)

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func updateSearchHistory() {
        let request = SearchHistoryModels.Request()
        interactor?.fetchSearchHistory(request: request)
    }
}
// MARK: - SearchHistoryViewProtocol
extension SearchHistoryViewController: SearchHistoryViewProtocol {
    func displaySearchHistory(viewModel: SearchHistoryModels.ViewModel) {
        searchHistory = viewModel.history
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension SearchHistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchHistory.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        cell.textLabel?.text = searchHistory[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SearchHistoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedTerm = searchHistory[indexPath.row]
        router?.routeToSearch(with: selectedTerm)
    }
}
