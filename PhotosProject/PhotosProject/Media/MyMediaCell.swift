//
//  MyMediaCell.swift
//  PhotosProject
//
//  Created by 111 on 21.04.2024.
//

import UIKit
import SnapKit

class MyMediaCell: UICollectionViewCell {
    
    static let identifier = "myMediaCell"
    
    // MARK: - Oulets
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.sizeThatFits(CGSize(width: 170, height: 170))
        image.layer.shadowColor = UIColor.white.cgColor
        image.layer.shadowOpacity = 0.3
        image.layer.shadowOffset = .zero
        image.layer.shadowRadius = 10
        image.layer.shouldRasterize = true
        image.layer.rasterizationScale = UIScreen.main.scale
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        
        return image
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20,
                                       weight: .medium)
        label.textColor = .systemGray6
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        
        addSubview(image)
        addSubview(textLabel)
    }
    
    private func setupLayout() {
        
        image.snp.makeConstraints {
            $0.height.equalToSuperview()
            //      $0.width.equalToSuperview()
            $0.top.equalToSuperview().offset(25)
            $0.leading.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(50)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        textLabel.snp.makeConstraints({
            $0.top.equalTo(image.snp.top).offset(10)
            $0.width.equalToSuperview()
            $0.leading.equalTo(image.snp.leading).offset(10)
            $0.height.equalTo(30)
        })
        
    }
    
    override func prepareForReuse() {
        self.image.image = nil
    }
}
