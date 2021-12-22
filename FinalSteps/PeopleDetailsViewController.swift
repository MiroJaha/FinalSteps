//
//  PeopleDetailsViewController.swift
//  FinalSteps
//
//  Created by admin on 22/12/2021.
//

import UIKit

class PeopleDetailsViewController: UIViewController {
    
    var name = UILabel(frame: .zero)
    var gender = UILabel(frame: .zero)
    var birthYear = UILabel(frame: .zero)
    var mass = UILabel(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        designingLabels(label: name)
        designingLabels(label: gender)
        designingLabels(label: birthYear)
        designingLabels(label: mass)
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: view.topAnchor,constant: 200),
            gender.topAnchor.constraint(equalTo: name.bottomAnchor,constant: 50),
            birthYear.topAnchor.constraint(equalTo: gender.bottomAnchor,constant: 50),
            mass.topAnchor.constraint(equalTo: birthYear.bottomAnchor,constant: 50)
        ])
    }
    
    func designingLabels(label: UILabel){
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.shadowColor = .white
        label.shadowOffset = CGSize(width: -2, height: -2)
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 3.0
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = CGSize(width: 2, height: 2)
        label.layer.masksToBounds = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20)
        ])
    }

}
