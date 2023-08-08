//
//  ViewController.swift
//  Destini
//
//  Created by Марина on 02.08.2023.
//

import UIKit

class ViewController: UIViewController {
 
    var storiesPlace = StroryBrain()
    
    private let backImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "background")
        return imageView
    }()
    
    private lazy var mainStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let storyLabel: UILabel = {
        let label = UILabel()
        label.text = "Story text"
        label.textColor = .white
        label.font = .systemFont(ofSize: 25)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var choice1Button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Choice 1", for: .normal)
        button.tintColor = .white
        button.titleLabel?.adjustsFontSizeToFitWidth = true
//        button.titleLabel?.backgroundColor = .white
        button.titleLabel?.numberOfLines = 0
        button.setBackgroundImage(UIImage(named: "choice1Background"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 23)
        button.addTarget(self, action: #selector(choiceButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var choice2Button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Choice 2", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 23)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
//        button.titleLabel?.backgroundColor = .white
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .left
        button.setBackgroundImage(UIImage(named: "choice2Background"), for: .normal)
        button.addTarget(self, action: #selector(choiceButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()


        view.backgroundColor = .red
        setupView()
        setConstraints()
        updateUI()
    }

    private func setupView() {
        view.addSubview(backImage)
        
        mainStack.addArrangedSubview(storyLabel)
        mainStack.addArrangedSubview(choice1Button)
        mainStack.addArrangedSubview(choice2Button)
        view.addSubview(mainStack)
    }
    
    @objc func choiceButtonTapped(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        if (storiesPlace.storyNumber + 1 < storiesPlace.stories.count) {
            storiesPlace.nextStory(userAnswer)
        }
     
        updateUI()
    
    }

    private func updateUI(){
        storyLabel.text = storiesPlace.getStoryTitle()
        choice1Button.setTitle(storiesPlace.getChoice1(), for: .normal)
        choice2Button.setTitle(storiesPlace.getChoice2(), for: .normal)
    }

}

extension ViewController{
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backImage.topAnchor.constraint(equalTo: view.topAnchor),
            backImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            choice1Button.heightAnchor.constraint(equalToConstant: 100),
            choice2Button.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
