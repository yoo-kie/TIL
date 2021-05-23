//
//  ViewController.swift
//  TIL
//
//  Created by 유연주 on 2021/04/05.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    enum Section: CaseIterable {
        case list
    }
    
    enum Item: String, Hashable, CaseIterable {
        case priority = "AutoLayout Priority"
    }
    
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionView()
        configureDataSource()
        applySnapshots()
    }
    
    func setCollectionView() {
        collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: configureLayout()
        )
        collectionView.delegate = self
        
        view.addSubview(collectionView)
    }
    
    func configureLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection in
                
            let section = NSCollectionLayoutSection.list(
                using: .init(appearance: .plain),
                layoutEnvironment: layoutEnvironment
            )
            
            return section
        }
        
        return layout
    }
    
    func configureDataSource() {
        let listCellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Item> { (cell, indexPath, item) in
            var contentConfiguration = UIListContentConfiguration.valueCell()
            contentConfiguration.text = item.rawValue
            cell.contentConfiguration = contentConfiguration
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(
                using: listCellRegistration,
                for: indexPath,
                item: item
            )
        }
    }
    
    func applySnapshots() {
        let sections = Section.allCases
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(sections)
        dataSource.apply(snapshot)
        
        var listSnapshot = NSDiffableDataSourceSectionSnapshot<Item>()
        listSnapshot.append(Item.allCases)
        dataSource.apply(listSnapshot, to: .list)
    }
    
}
