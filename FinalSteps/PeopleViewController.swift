//
//  ViewController.swift
//  FinalSteps
//
//  Created by admin on 22/12/2021.
//

import UIKit

class PeopleViewController: UIViewController {
    
    var pageNumber = 1
    var peopleList = [PeopleData]()
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var pageNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        check()
        gettingPeopleList()
        mainTableView.dataSource = self
        mainTableView.delegate = self
    }
    
    func gettingPeopleList() {
        peopleList.removeAll()
        StarWarsModel.getAllPeople(pageNumber: self.pageNumber, completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
            data, response, error in
            do {
                // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] as? NSArray {
                        for person in results {
                            let personDict = person as! NSDictionary
                            self.peopleList.append(
                                PeopleData(
                                    name:personDict["name"]! as! String,
                                    gender: personDict["gender"]! as! String,
                                    birthYear: personDict["birth_year"]! as! String,
                                    mass: personDict["mass"]! as! String
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
        })
    }

    @IBAction func nextButtonPressed(_ sender: UIButton) {
        pageNumber += 1
        pageNumberLabel.text = "Page: \(pageNumber)/9"
        check()
        gettingPeopleList()
    }
    @IBAction func previousButtonPressed(_ sender: UIButton) {
        pageNumber -= 1
        pageNumberLabel.text = "Page: \(pageNumber)/9"
        check()
        gettingPeopleList()
    }
    func check() {
        if pageNumber == 9 {
            nextButton.isEnabled = false
        }else {
            nextButton.isEnabled = true
        }
        if pageNumber == 1 {
            previousButton.isEnabled = false
        }else {
            previousButton.isEnabled = true
        }
    }
    
}

extension PeopleViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = peopleList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let peopleDetailsViewController = PeopleDetailsViewController()
        peopleDetailsViewController.name.text = "Name: \(peopleList[indexPath.row].name)"
        peopleDetailsViewController.gender.text = "Gender: \(peopleList[indexPath.row].gender)"
        peopleDetailsViewController.birthYear.text = "Birth Year: \(peopleList[indexPath.row].birthYear)"
        peopleDetailsViewController.mass.text = "Mass: \(peopleList[indexPath.row].mass)"
        self.present(peopleDetailsViewController, animated: true, completion: nil)
    }
}

struct PeopleData {
    var name: String
    var gender: String
    var birthYear: String
    var mass: String
}
