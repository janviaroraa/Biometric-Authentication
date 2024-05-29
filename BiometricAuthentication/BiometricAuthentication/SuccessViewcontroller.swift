//
//  SuccessViewcontroller.swift
//  BiometricAuthentication
//
//  Created by Janvi Arora on 27/05/24.
//

import UIKit

class SuccessViewcontroller: UIViewController {

    private lazy var imageView: UIImageView = {
        let imageV = UIImageView()
        imageV.translatesAutoresizingMaskIntoConstraints = false
        imageV.image = UIImage(systemName: "checkmark.circle.fill")?.withRenderingMode(.alwaysTemplate)
        imageV.tintColor = .systemGreen
        return imageV
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Success!"
        view.backgroundColor = .systemBackground
        setupImage()
    }

    private func setupImage() {
        view.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
}
