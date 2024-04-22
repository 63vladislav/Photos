//
//  MyCell.swift
//  PhotosProject
//
//  Created by 111 on 17.04.2024.
//
import UIKit
import SnapKit

class MyCell: UICollectionViewCell {
    
    static let identifier = "myCell"
    
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
        image.clipsToBounds = true
        
        return image
    }()
    
    lazy var textLabel: UILabel = UILabel()
    
    lazy var textLabelTwo: UILabel = UILabel()
    
    
    
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
        addSubview(textLabelTwo)
    }
    
    private func setupLayout() {
        
        image.snp.makeConstraints { make in
            make.height.equalTo(170)
            make.width.equalTo(170)
            make.leading.top.equalToSuperview()
        }
        textLabel.snp.makeConstraints({
            $0.top.equalTo(image.snp.bottom).offset(10)
            $0.trailing.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            $0.height.equalTo(20)
        })
        textLabelTwo.snp.makeConstraints({
            $0.top.equalTo(textLabel.snp.bottom).offset(10)
            $0.trailing.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            $0.height.equalTo(20)
            
        })
        
    }
    
    override func prepareForReuse() {
        self.image.image = nil
    }
}
