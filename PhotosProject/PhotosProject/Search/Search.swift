//
//  Search.swift
//  PhotosProject
//
//  Created by 111 on 07.04.2024.
//

import UIKit

class Search: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupNavigationBar()
        view.backgroundColor = .white
    }
    
    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Поиск"
        titleLabel.font = UIFont.systemFont(ofSize: 30,
                                            weight: .medium)
        titleLabel.textColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
    }
}
