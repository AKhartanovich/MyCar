//
//  CollectionViewController.swift
//  MyCar
//
//  Created by MacBook on 7.12.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

    var collectionView: UICollectionView?
    var layoutOne: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
        return layout
    }()
    
//    var layoutTwo: UICollectionViewFlowLayout = {
//        let layout = UICollectionViewFlowLayout()
////        layout.itemSize = CGSize(width: 150, height: 150)
////        layout.scrollDirection = .horizontal
//        return layout
//    }()
    let reuseID = "cell"
    
    
    override func loadView() {
        super.loadView()

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layoutOne)
        collectionView = collection
        
        
        view.addSubview(collection)
//        collection.fillSuperView()
        collection.activateConstraint()
        collection.leading(equalTo: view.leadingAnchor)
        collection.trailing(equalTo: view.trailingAnchor)
        collection.bottom(equalTo: view.bottomAnchor, constant: -40)
        collection.height(constant: 200)
        layoutOne.itemSize = CGSize(width: view.frame.width / 2, height: 100)
        collection.backgroundColor = .white
        collection.dataSource = self
//        collection.delegate = self
        collection.register(MyCustomCollectionCell.self, forCellWithReuseIdentifier: reuseID)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseID, for: indexPath) as! MyCustomCollectionCell
        cell.backgroundColor = .red
        return cell
    }
    
    
}


//extension CollectionViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if indexPath.row % 2 == 0 {
//            collectionView.setCollectionViewLayout(layoutOne, animated: true)
//        } else {
//            collectionView.setCollectionViewLayout(layoutOne, animated: true)
//        }
//    }
//}

//extension CollectionViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if indexPath.row % 10 == 0 {
//            return CGSize(width: 70, height: 200)
//        }
//        return CGSize(width: 100, height: 100)
//    }
//}


class MyCustomCollectionCell: UICollectionViewCell {
    var label: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func create() {
        addSubview(label)
        label.activateConstraint()
        label.top(equalTo: self.topAnchor)
        label.leading(equalTo: self.leadingAnchor)
        label.trailing(equalTo: self.trailingAnchor)
        label.bottom(equalTo: self.bottomAnchor)
        label.numberOfLines = 4
        label.textColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
