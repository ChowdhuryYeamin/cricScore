//
//  HomePageView.swift
//  cricScore
//
//  Created by Yamin Ayon on 8/9/23.
//

import UIKit

class HomePageView: UIView {
    
    // Header View
    private let headerView = HeaderView()
    
    // Brief Introduction View
    private let introductionView = IntroductionView()
    
    // Interactive Button
    private let interactiveButton = InteractiveButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        //backgroundColor = .red  // You added this earlier for debugging

        // Add HeaderView
        addSubview(headerView)
        
        // Add IntroductionView
        addSubview(introductionView)
        
        // Add InteractiveButton
        addSubview(interactiveButton)

        // Configure subviews with background colors for visibility
//        headerView.backgroundColor = .blue
//        introductionView.backgroundColor = .green
//        interactiveButton.backgroundColor = .yellow

        // Set up constraints for headerView
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 60) // or any desired height
        ])

        // Set up constraints for introductionView
        introductionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            introductionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            introductionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            introductionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            introductionView.heightAnchor.constraint(equalToConstant: 100) // or any desired height
        ])

        // Set up constraints for interactiveButton
        interactiveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            interactiveButton.topAnchor.constraint(equalTo: introductionView.bottomAnchor),
            interactiveButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            interactiveButton.widthAnchor.constraint(equalToConstant: 200),  // or any desired width
            interactiveButton.heightAnchor.constraint(equalToConstant: 50)  // or any desired height
        ])
    }

}
