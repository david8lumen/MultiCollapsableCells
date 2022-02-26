//
//  ViewController.swift
//  MultiCollapsableCells
//
//  Created by David Grigoryan on 26.02.2022.
//

import UIKit

class ViewController: UIViewController {

    enum Section {
        case main
    }
    
    typealias CategoryDiffableDataSouce = UICollectionViewDiffableDataSource<Section, CategoryItem>
    var dataSource: CategoryDiffableDataSouce!
    var categoryCollectionView: UICollectionView!
    
    private lazy var categoryLayout: UICollectionViewLayout = {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .sidebar)
        listConfiguration.backgroundColor = .white
        let layout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Categories"
        setupCollectionView()
        setupDatasource()
    }
    
    private func setupCollectionView() {
        categoryCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: categoryLayout)
        categoryCollectionView.delegate = self
        view.addSubview(categoryCollectionView)
        categoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoryCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            categoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setupDatasource() {
        let categoryCellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, CategoryItem> {
            (cell, indexPath, categoryItem) in

            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = categoryItem.text
            
            cell.contentConfiguration = contentConfiguration
            cell.accessories = categoryItem.subcategories.isEmpty ? [] : [.outlineDisclosure(options: .init(style: .header))]
            cell.backgroundConfiguration = .clear()
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, CategoryItem>(collectionView: categoryCollectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, item: CategoryItem) -> UICollectionViewCell? in
            
            return collectionView.dequeueConfiguredReusableCell(using: categoryCellRegistration, for: indexPath, item: item)
        }

        let snapshot = categoriesSnapshot()
        dataSource.apply(snapshot, to: .main, animatingDifferences: false)
    }
    
    private func categoriesSnapshot() -> NSDiffableDataSourceSectionSnapshot<CategoryItem> {
        var snapshot = NSDiffableDataSourceSectionSnapshot<CategoryItem>()
        addItems(into: &snapshot, CategoryItemsBuilder.categoryItems, to: nil)
        return snapshot
    }
    
    private func addItems(into snapshot: inout NSDiffableDataSourceSectionSnapshot<CategoryItem>,
                          _ categoryItems: [CategoryItem],
                          to parent: CategoryItem?) {
        snapshot.append(categoryItems, to: parent)
        categoryItems
            .filter { !$0.subcategories.isEmpty }
            .forEach { addItems(into: &snapshot, $0.subcategories, to: $0) }
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
