//
//  MainTabBarController.swift
//  PhotosProject
//
//  Created by 111 on 07.04.2024.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .white
        view.tintColor = .blue
        
        
        viewControllers = [
            
            generateNavigationController(rootViewController: PhotosCollectionViewController(), title: "Медиатека", image: UIImage(named: "photo.fill.on.rectangle.fill")!),
            generateNavigationController(rootViewController: ViewController(), title: "Для Вас", image: UIImage(named: "heart.text.square.fill")!),
            generateNavigationController(rootViewController: Albums(), title: "Альбомы", image: UIImage(named: "rectangle.stack.fill")!),
            generateNavigationController(rootViewController: Search(), title: "Поиск", image: UIImage(named: "magnifyingglass")!)
            
        ]
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
