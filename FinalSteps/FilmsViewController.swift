//
//  FilmsViewController.swift
//  GETFilms
//
//  Created by admin on 22/12/2021.
//

import UIKit

class FilmsViewController: UIViewController {

    var filmsList = [FilmDetails]()
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StarWarsModel.getAllFilms { data, response, error in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] as? NSArray {
                        for person in results {
                            let filmDict = person as! NSDictionary
                            self.filmsList.append(
                                FilmDetails(
                                    filmTitle: filmDict["title"]! as! String,
                                    openingCrawl: filmDict["opening_crawl"]! as! String,
                                    director: filmDict["director"]! as! String,
                                    releaseDate: filmDict["release_date"]! as! String
                                )
                            )
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.mainTableView.reloadData()
                }
            } catch {
                print("Something went wrong")
            }
        }
        mainTableView.dataSource = self
        mainTableView.delegate = self
    }
}

extension FilmsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmsCell", for: indexPath)
        cell.textLabel?.text = filmsList[indexPath.row].filmTitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filmsDetailsViewController = FilmsDetailsViewController()
        filmsDetailsViewController.filmTitle.text = filmsList[indexPath.row].filmTitle
        filmsDetailsViewController.releaseDate.text = "Release Date: \(filmsList[indexPath.row].releaseDate)"
        filmsDetailsViewController.director.text = "Director: \(filmsList[indexPath.row].director)"
        filmsDetailsViewController.openingCrawl.text = "Opening Crawl: \(filmsList[indexPath.row].openingCrawl)"
        self.present(filmsDetailsViewController, animated: true, completion: nil)
    }
}

struct FilmDetails {
    var filmTitle: String
    var openingCrawl: String
    var director: String
    var releaseDate: String
}
