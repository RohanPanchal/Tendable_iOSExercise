//
//  InspectionsViewController.swift
//  Tendable_iOSExcerise
//
//  Created by Rohan Panchal on 05/06/24.
//

import UIKit

class InspectionsViewController: UIViewController {
    @IBOutlet var tblInspections: UITableView?
    
    let viewModel = InspectionsViewModel()
    var inspection:  Inspection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        view.backgroundColor = .white
        title = "Inspections"

        tblInspections?.register(UINib(nibName: "InspectionListCell", bundle: .main), forCellReuseIdentifier: "InspectionListCell")
        tblInspections?.delegate = self
        tblInspections?.dataSource = self

        getInspections()
    }
}

// MARK: - API call
extension InspectionsViewController {
    func getInspections() {
        viewModel.getInspections {isSuccess in
            self.view.alpha = 1

            if let inspectionsList = self.viewModel.inspections {
                self.inspection = inspectionsList
                self.tblInspections?.reloadData()
            } else {
                print("error in data loading")
            }
        }
    }
}

// MARK: - UITableView
extension InspectionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inspection?.survey?.categories?.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InspectionListCell", for: indexPath) as? InspectionListCell else {
            return UITableViewCell()
        }
        
        cell.setInspectionData(inspectionType: self.inspection?.inspectionType?.name ?? "", inspectionArea: self.inspection?.area?.name ?? "", inspectionCategory: self.inspection?.survey?.categories?[indexPath.row].name ?? "", noOfQuestions: self.inspection?.survey?.categories?[indexPath.row].questions?.count ?? 0)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let questionsViewController = storyBoard.instantiateViewController(withIdentifier: "QuestionsViewController") as! QuestionsViewController
        questionsViewController.inspection = self.inspection
        questionsViewController.selectedCategoryQuestions = self.inspection?.survey?.categories?[indexPath.row].questions
        navigationController?.pushViewController(questionsViewController, animated: true)
    }
}

