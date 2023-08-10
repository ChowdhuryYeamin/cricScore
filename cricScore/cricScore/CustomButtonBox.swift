//
//  CustomButtonBox.swift
//  cricScore
//
//  Created by Yamin Ayon on 8/10/23.
//

import UIKit

// Base class for custom buttons
class CustomButtonBox: UIView {
    
    // Button
    private let button = UIButton()

    // Designated initializer
    init(title: String) {
        super.init(frame: .zero)
        setupButton(title: title)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupButton(title: String) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.isUserInteractionEnabled = false // Disable button interaction
        
        addSubview(button)
        backgroundColor = UIColor.darkGray
        layer.cornerRadius = 10
        clipsToBounds = true

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }

    // To be overridden by subclasses for specific actions
    @objc func buttonTapped() {
        // Intentionally left empty
    }
}

// Derived class for New Game button
class NewGameButton: CustomButtonBox {
    override init(title: String = "New Game") {
        super.init(title: title)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func buttonTapped() {
        print("New Game Button Tapped")
        // Additional logic for New Game Button can be added here
    }
}

// Derived class for Add Team button
class AddTeamButton: CustomButtonBox {
    override init(title: String = "Add Team") {
        super.init(title: title)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func buttonTapped() {
        print("Add Team Button Tapped")
        // Additional logic for Add Team Button can be added here
    }
}
