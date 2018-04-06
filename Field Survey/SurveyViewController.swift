//
//  SurveyViewController.swift
//  Field Survey
//
//  Created by Lee Offir on 4/6/18.
//  Copyright © 2018 Lee Offir. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {
    
    var observation: FieldSurvey?
    
    var dateFormat = DateFormatter()
    
    @IBOutlet weak var SurveyImage: UIImageView!
    @IBOutlet weak var matchupLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormat.dateStyle = .medium
        dateFormat.timeStyle = .medium
        
        SurveyImage.image = observation?.classification.image
        matchupLabel.text = observation?.title
        descriptionView.text = observation?.description
        
        if let date = observation?.date {
            dateLabel.text = dateFormat.string(from: date)
        } else {
            dateLabel.text = ""
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
