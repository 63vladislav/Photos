//
//  FlowLayoutCell.swift
//  PhotosProject
//
//  Created by 111 on 10.04.2024.
//

import UIKit

class FlowLayoutCell: UICollectionViewCell {
    
    static let identifier = "FlowLayoutCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

