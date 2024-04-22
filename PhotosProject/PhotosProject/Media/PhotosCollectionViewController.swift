//
//  PhotosCollectionViewController.swift
//  PhotosProject
//
//  Created by 111 on 07.04.2024.
//

import UIKit

class PhotosCollectionViewController: UIViewController {
    
    // MARK: - Outlets
    
    private lazy var collectionFirstVC: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyMediaCell.self, forCellWithReuseIdentifier: MyMediaCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    private lazy var myLabel = UILabel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        
        view.addSubview(collectionFirstVC)
        view.addSubview(myLabel)
    }
    
    private func setupLayout() {
        
        myLabel.snp.makeConstraints({
            $0.trailing.equalToSuperview()
            $0.leading.equalToSuperview().offset(25)
            $0.top.bottom.equalToSuperview()
        })
        
        collectionFirstVC.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.leading.bottom.trailing.equalToSuperview()
            $0.height.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Медиатека"
        titleLabel.font = UIFont.systemFont(ofSize: 30,
                                            weight: .medium)
        titleLabel.textColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
    }
    
}

    //MARK: - Extension

extension PhotosCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model.animalsPhoto.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyMediaCell.identifier, for: indexPath) as! MyMediaCell
        cell.image.image = UIImage(named: Model.animalsPhoto[indexPath.item])
        cell.textLabel.text = String(Model.animalsName[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        CGSize(width: view.frame.width - 10,
               height: (view.frame.height / 3) - 10
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
}

