//
//  HeaderView.swift
//  cricScore
//
//  Created by Yamin Ayon on 8/9/23.
//

import UIKit

class HeaderView: UIView {
    
    // Logo
    private let logoImageView = UIImageView()
    
    // Notification Icon
    private let notificationIcon = UIImageView()
    
    // User Profile Icon
    private let profileIcon = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // Assuming some URLs for your images (replace with your actual URLs)
        let logoURL = URL(string: "https://example.com/logo.png")
        let notificationIconURL = URL(string: "https://example.com/notification.png")
        let profileIconURL = URL(string: "https://example.com/profile.png")
        
        loadImage(for: logoImageView, from: logoURL)
        loadImage(for: notificationIcon, from: notificationIconURL)
        loadImage(for: profileIcon, from: profileIconURL)
        
        // Add views to the header view
        [logoImageView, notificationIcon, profileIcon].forEach { addSubview($0) }
        
        // Setup constraints (using Auto Layout)
        setupConstraints()
    }
    
    private func loadImage(for imageView: UIImageView, from url: URL?) {
        guard let url = url else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                imageView.image = UIImage(data: data)
            }
        }.resume()
    }
    
    private func setupConstraints() {
        // Assuming you're using Auto Layout, set translatesAutoresizingMaskIntoConstraints to false for each view
        [logoImageView, notificationIcon, profileIcon].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        // Set up constraints (this is just a basic layout, adjust as needed)
        NSLayoutConstraint.activate([
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            notificationIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            notificationIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            profileIcon.trailingAnchor.constraint(equalTo: notificationIcon.leadingAnchor, constant: -16),
            profileIcon.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
