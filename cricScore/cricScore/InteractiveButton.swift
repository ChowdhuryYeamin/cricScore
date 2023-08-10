//
//  InteractiveButton.swift
//  cricScore
//
//  Created by Yamin Ayon on 8/9/23.
//
import UIKit

class InteractiveButton: UIView {

    // Transparent boxes for buttons (now inherited from the CustomButtonBox class)
    private let newGameButton = NewGameButton()
    private let addTeamButton = AddTeamButton()

    // Label to display text based on button click
    private let displayLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        // Add styled boxes to the view
        addSubview(newGameButton)
        addSubview(addTeamButton)

        // Add label to the view
        addSubview(displayLabel)
        displayLabel.textAlignment = .center

        // Layout boxes and label
        setupConstraints()
        
        // Attach tap gestures to new buttons
        let newGameTap = UITapGestureRecognizer(target: self, action: #selector(newGameButtonTapped))
        newGameButton.addGestureRecognizer(newGameTap)
        
        let addTeamTap = UITapGestureRecognizer(target: self, action: #selector(addTeamButtonTapped))
        addTeamButton.addGestureRecognizer(addTeamTap)
    }

    private func setupConstraints() {
        newGameButton.translatesAutoresizingMaskIntoConstraints = false
        addTeamButton.translatesAutoresizingMaskIntoConstraints = false
        displayLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Position boxes side by side
            newGameButton.topAnchor.constraint(equalTo: topAnchor),
            newGameButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            newGameButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            newGameButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -15), // Take into account the spacing

            addTeamButton.topAnchor.constraint(equalTo: topAnchor),
            addTeamButton.leadingAnchor.constraint(equalTo: newGameButton.trailingAnchor, constant: 10),
            addTeamButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            addTeamButton.widthAnchor.constraint(equalTo: newGameButton.widthAnchor),

            // Position label below boxes
            displayLabel.topAnchor.constraint(equalTo: bottomAnchor, constant: 10),
            displayLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            displayLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            displayLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc private func newGameButtonTapped() {
        highlightButtonBox(newGameButton)
        unhighlightButtonBox(addTeamButton)
        displayLabel.text = "New Game Selected"
    }

    @objc private func addTeamButtonTapped() {
        highlightButtonBox(addTeamButton)
        unhighlightButtonBox(newGameButton)
        displayLabel.text = "Add Team Selected"
    }

    private func highlightButtonBox(_ box: CustomButtonBox) {
        box.backgroundColor = UIColor.blue
    }

    private func unhighlightButtonBox(_ box: CustomButtonBox) {
        box.backgroundColor = UIColor.darkGray
    }
}
