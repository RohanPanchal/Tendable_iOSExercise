//
//  InspectionListCell.swift
//  Tendable_iOSExercise
//
//  Created by Rohan Panchal on 06/06/24.
//

import UIKit

class InspectionListCell: UITableViewCell {
    @IBOutlet var lblInspectionType: UILabel?
    @IBOutlet var lblInspectionArea: UILabel?
    @IBOutlet var lblInspectionCategory: UILabel?
    @IBOutlet var lblNoOfQuestions: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setInspectionData(inspectionType: String, inspectionArea: String, inspectionCategory: String, noOfQuestions: Int) {
        lblInspectionType?.text = "Inspection Type : \(inspectionType)"
        lblInspectionArea?.text = "Inspection Area : \(inspectionArea)"
        lblInspectionCategory?.text = "Inspection Category : \(inspectionCategory)"
        lblNoOfQuestions?.text = "No. Of Questions : \(noOfQuestions)"
    }
}
