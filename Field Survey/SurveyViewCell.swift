//
//  SurveyViewCell.swift
//  Field Survey
//
//  Created by Lee Offir on 4/6/18.
//  Copyright © 2018 Lee Offir. All rights reserved.
//

import UIKit

class SurveyViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var matchupLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
