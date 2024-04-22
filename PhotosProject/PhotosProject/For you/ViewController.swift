//
//  ViewController.swift
//  PhotosProject
//
//  Created by 111 on 07.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupNavigationBar()
        view.backgroundColor = .white
        button()
    }
    
    private func button() {
        
        let button = UIButton(frame: CGRect(x: 50, y: 200, width: 150, height: 50))
        view.addSubview(button)
        button.center = view.center
        button.layer.cornerRadius = 12
        button.backgroundColor = .red
        button.setTitle("Кнопка", for: .normal)
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(clikedButton), for: .touchUpInside)
        
    }
    
    @objc func clikedButton() {
        print("button pressed")
    }
    
    private func setupNavigationBar() {
        
        let titleLabel = UILabel()
        titleLabel.text = "Для Вас"
        titleLabel.font = UIFont.systemFont(ofSize: 30,
                                            weight: .medium)
        titleLabel.textColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
    }
}

