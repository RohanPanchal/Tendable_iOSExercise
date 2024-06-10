//
//  QuestionCollectionViewCell.swift
//  Tendable_iOSExercise
//
//  Created by Rohan Panchal on 06/06/24.
//

import UIKit

class QuestionCell: UITableViewCell {
    @IBOutlet var lblQuestion: UILabel?

    @IBOutlet var lblOption1: UILabel?
    @IBOutlet var lblOption2: UILabel?
    @IBOutlet var lblOption3: UILabel?

    @IBOutlet var imgvOption1: UIImageView?
    @IBOutlet var imgvOption2: UIImageView?
    @IBOutlet var imgvOption3: UIImageView?
    
    @IBOutlet var optionView3: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        setUI()
    }
    
    func setUI() {
        imgvOption1?.layer.masksToBounds = false
        imgvOption1?.layer.cornerRadius = (imgvOption1?.frame.size.width ?? 0.0) / 2
        imgvOption1?.clipsToBounds = true
        imgvOption1?.backgroundColor = .black
        imgvOption1?.layer.borderWidth = 1.0
        imgvOption1?.layer.borderColor = UIColor.black.cgColor

        
        imgvOption2?.layer.masksToBounds = false
        imgvOption2?.layer.cornerRadius = (imgvOption2?.frame.size.width ?? 0.0) / 2
        imgvOption2?.clipsToBounds = true
        imgvOption2?.backgroundColor = .white
        imgvOption2?.layer.borderWidth = 1.0
        imgvOption2?.layer.borderColor = UIColor.black.cgColor
        
        imgvOption3?.layer.masksToBounds = false
        imgvOption3?.layer.cornerRadius = (imgvOption3?.frame.size.width ?? 0.0) / 2
        imgvOption3?.clipsToBounds = true
        imgvOption3?.backgroundColor = .white
        imgvOption3?.layer.borderWidth = 1.0
        imgvOption3?.layer.borderColor = UIColor.black.cgColor
    }
    
    func setQuestionData(question: String, option1: String, option2: String, option3: String) {
        lblQuestion?.text = "Q. \(question)"
        lblOption1?.text = option1
        lblOption2?.text = option2
        lblOption3?.text = option3
    }
    
    @IBAction func optionClicked(sender: UIButton) {
        if sender.tag == 0 {
            imgvOption1?.backgroundColor = .black
            imgvOption2?.backgroundColor = .white
            imgvOption3?.backgroundColor = .white
        } else if sender.tag == 1 {
            imgvOption2?.backgroundColor = .black
            imgvOption1?.backgroundColor = .white
            imgvOption3?.backgroundColor = .white
        } else {
            imgvOption3?.backgroundColor = .black
            imgvOption2?.backgroundColor = .white
            imgvOption1?.backgroundColor = .white
        }
    }
}
