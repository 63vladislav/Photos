//
//  Albums.swift
//  PhotosProject
//
//  Created by 111 on 07.04.2024.
//

import UIKit
import SnapKit

class Albums: UIViewController {
    
    // MARK: - Outlets
    
    private lazy var scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.bounces = false
        scroll.isScrollEnabled = true
        return scroll
    }()
    
    private lazy var contentScrollView: UIView = UIView()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20,
                                       weight: .regular)
        label.text = "Мои альбомы"
        
        return label
    }()
    
    
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20,
                                       weight: .regular)
        label.text = "Люди, питомцы и места"
        
        return label
    }()
    
    private lazy var collectionFirstVC: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: MyCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    private lazy var collectionSecondCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let CV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        CV.delegate = self
        CV.dataSource = self
        CV.register(MyCell.self, forCellWithReuseIdentifier: MyCell.identifier)
        CV.showsHorizontalScrollIndicator = false
        
        return CV
    }()
    
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
        
        view.addSubview(scroll)
        scroll.addSubview(contentScrollView)
        contentScrollView.addSubview(nameLabel)
        contentScrollView.addSubview(collectionFirstVC)
        contentScrollView.addSubview(secondLabel)
        contentScrollView.addSubview(collectionSecondCV)
        
    }
    
    private func setupLayout() {
        
        scroll.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalToSuperview()
        }
        
        contentScrollView.snp.makeConstraints {
            $0.centerX.equalTo(scroll.snp.centerX)
            $0.width.equalTo(scroll.snp.width)
            $0.top.equalTo(scroll.snp.top)
            $0.bottom.equalTo(scroll.snp.bottom)
        }
        
        nameLabel.snp.makeConstraints({
            $0.trailing.equalToSuperview()
            $0.leading.equalToSuperview().offset(25)
            $0.top.equalToSuperview().offset(20)
        })
        
        collectionFirstVC.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.left.leading.trailing.equalToSuperview()
            $0.height.equalTo(470)
        }
        
        secondLabel.snp.makeConstraints({
            $0.top.equalTo(collectionFirstVC.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(25)
            $0.trailing.equalToSuperview()
        })
        
        collectionSecondCV.snp.makeConstraints({
            $0.top.equalTo(secondLabel.snp.bottom).offset(10)
            $0.left.leading.trailing.equalToSuperview()
            $0.height.equalTo(230)
            $0.bottom.equalToSuperview()
        })
    }
    
    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Альбомы"
        titleLabel.font = UIFont.systemFont(ofSize: 30,
                                            weight: .medium)
        titleLabel.textColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
    }
    
}

// MARK: - Extention

extension Albums: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
            
        case collectionFirstVC:
            
            return Model.images.count
            
        case collectionSecondCV:
            
            return Model.animalsPhoto.count
            
        default:
            
            return section
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
            
        case collectionFirstVC:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCell.identifier, for: indexPath) as! MyCell
            cell.image.image = UIImage(named: Model.images[indexPath.item])
            cell.textLabel.text = String(Model.names[indexPath.item])
            cell.textLabelTwo.text = String(indexPath.row + 1)
            
            return cell
            
        case collectionSecondCV:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCell.identifier, for: indexPath) as! MyCell
            cell.image.image = UIImage(named: Model.animalsPhoto[indexPath.item])
            cell.textLabel.text = String(Model.animalsName[indexPath.item])
            cell.textLabelTwo.text = String(indexPath.row + 1)
            
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCell.identifier, for: indexPath) as! MyCell
            cell.image.image = UIImage(named: Model.images[indexPath.item])
            cell.textLabel.text = String(Model.names[indexPath.item])
            cell.textLabelTwo.text = String(indexPath.row + 1)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 2) - 20,
                      height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
    
}
