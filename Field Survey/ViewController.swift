//
//  ViewController.swift
//  Field Survey
//
//  Created by Lee Offir on 4/5/18.
//  Copyright © 2018 Lee Offir. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var TableView: UITableView!
    let observations = JSONLoader.load(fileName: "field_observations")

    let dateFormat = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormat.dateStyle = .medium
        dateFormat.timeStyle = .medium
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return observations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SurveyCell", for: indexPath)
        
        if let cell = cell as? SurveyViewCell{
            let observation = observations[indexPath.row]
            cell.iconImageView.image = observation.classification.image
            cell.matchupLabel.text = observation.title
            cell.dateLabel.text = dateFormat.string(from: observation.date)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SurveyViewController,
            let row = TableView.indexPathForSelectedRow?.row {
            
            destination.observation = observations[row]
        }
}
}
