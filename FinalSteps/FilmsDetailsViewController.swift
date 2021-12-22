//
//  FilmsDetailsViewController.swift
//  FinalSteps
//
//  Created by admin on 22/12/2021.
//

import UIKit

class FilmsDetailsViewController: UIViewController {
    
    var filmTitle = UILabel()
    var releaseDate = UILabel()
    var director = UILabel()
    var openingCrawl = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        designingLabels(label: filmTitle)
        designingLabels(label: releaseDate)
        designingLabels(label: director)
        designingLabels(label: openingCrawl)
        openingCrawl.font = .systemFont(ofSize: 20)
        
        NSLayoutConstraint.activate([
            filmTitle.topAnchor.constraint(equalTo: view.topAnchor,constant: 30),
            releaseDate.topAnchor.constraint(equalTo: filmTitle.bottomAnchor,constant: 20),
            director.topAnchor.constraint(equalTo: releaseDate.bottomAnchor,constant: 20),
            openingCrawl.topAnchor.constraint(equalTo: director.bottomAnchor,constant: 20),
            openingCrawl.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -50)
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
        label.shadowOffset = CGSize(width: -1, height: -1)
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 3.0
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = CGSize(width: 1, height: 1)
        label.layer.masksToBounds = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20)
        ])
    }
}
