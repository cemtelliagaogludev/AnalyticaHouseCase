//
//  LaunchViewController.swift
//  AnalyticaHouseCase
//
//  Created by admin on 21.03.2023.
//

import UIKit

class LaunchViewController: UIViewController{
    //MARK: - Properties
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "launch")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        navigationController?.setNavigationBarHidden(true, animated: true)
        view.backgroundColor = .white
        let width = UIScreen.main.bounds.size.width - 40
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: width),
            imageView.heightAnchor.constraint(equalToConstant: width)
        ])
    }
}
