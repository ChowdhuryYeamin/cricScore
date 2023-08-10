//
//  InteractiveButton.swift
//  cricScore
//
//  Created by Yamin Ayon on 8/9/23.
//
import UIKit

class InteractiveButton: UIView {

    // Transparent boxes for buttons
    private let newGameBox = UIView()
    private let addTeamBox = UIView()

    // Buttons
    private let newGameButton = UIButton()
    private let addTeamButton = UIButton()

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
        // Button setup inside styled boxes
        setupButton(newGameButton, withTitle: "New Game", inside: newGameBox)
        setupButton(addTeamButton, withTitle: "Add Team", inside: addTeamBox)

        // Add styled boxes to the view
        addSubview(newGameBox)
        addSubview(addTeamBox)

        // Add label to the view
        addSubview(displayLabel)
        displayLabel.textAlignment = .center

        // Layout boxes, buttons, and label
        setupConstraints()
    }

    private func setupButton(_ button: UIButton, withTitle title: String, inside box: UIView) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.isUserInteractionEnabled = false // Disable button interaction
        
        box.addSubview(button)
        box.backgroundColor = UIColor.darkGray
        box.layer.cornerRadius = 10
        box.clipsToBounds = true

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: box.topAnchor, constant: 10),
            button.bottomAnchor.constraint(equalTo: box.bottomAnchor, constant: -10),
            button.leadingAnchor.constraint(equalTo: box.leadingAnchor, constant: 10),
            button.trailingAnchor.constraint(equalTo: box.trailingAnchor, constant: -10)
        ])

        let tapGesture = UITapGestureRecognizer(target: self, action: (title == "New Game" ? #selector(newGameButtonTapped) : #selector(addTeamButtonTapped)))
        box.addGestureRecognizer(tapGesture)
    }

    private func setupConstraints() {
        newGameBox.translatesAutoresizingMaskIntoConstraints = false
        addTeamBox.translatesAutoresizingMaskIntoConstraints = false
        displayLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Position boxes side by side
            newGameBox.topAnchor.constraint(equalTo: topAnchor),
            newGameBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            newGameBox.bottomAnchor.constraint(equalTo: bottomAnchor),
            newGameBox.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -15),

            addTeamBox.topAnchor.constraint(equalTo: topAnchor),
            addTeamBox.leadingAnchor.constraint(equalTo: newGameBox.trailingAnchor, constant: 10),
            addTeamBox.bottomAnchor.constraint(equalTo: bottomAnchor),
            addTeamBox.widthAnchor.constraint(equalTo: newGameBox.widthAnchor),

            // Position label below boxes
            displayLabel.topAnchor.constraint(equalTo: bottomAnchor, constant: 10),
            displayLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            displayLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            displayLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc private func newGameButtonTapped() {
        logButtonTap(button: "New Game")
        highlightButtonBox(newGameBox)
        unhighlightButtonBox(addTeamBox)

        displayLabel.text = "New Game Selected"
    }

    @objc private func addTeamButtonTapped() {
        logButtonTap(button: "Add Team")
        highlightButtonBox(addTeamBox)
        unhighlightButtonBox(newGameBox)

        displayLabel.text = "Add Team Selected"
    }

    private func highlightButtonBox(_ box: UIView) {
        box.backgroundColor = UIColor.blue
    }

    private func unhighlightButtonBox(_ box: UIView) {
        box.backgroundColor = UIColor.darkGray
    }

    // Modular function to log button taps
    private func logButtonTap(button: String) {
        print("\(button) was tapped!")
    }
}
