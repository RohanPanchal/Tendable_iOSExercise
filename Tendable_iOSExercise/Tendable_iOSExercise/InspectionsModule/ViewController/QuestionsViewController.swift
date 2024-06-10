//
//  QuestionsViewController.swift
//  Tendable_iOSExercise
//
//  Created by Rohan Panchal on 06/06/24.
//

import UIKit

class QuestionsViewController: UIViewController {
    @IBOutlet var tblQuestions: UITableView?

    var inspection: Inspection?
    var selectedCategoryQuestions: [Questions]?
    
    let viewModel = InspectionsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        view.backgroundColor = .white
        title = "Questions"
        
        tblQuestions?.register(UINib(nibName: "QuestionCell", bundle: .main), forCellReuseIdentifier: "QuestionCell")
        tblQuestions?.delegate = self
        tblQuestions?.dataSource = self
        
        self.tblQuestions?.reloadData()
    }
}

// MARK: - Action
extension QuestionsViewController {
    @IBAction func buttonSubmitClicked(sender: UIButton) {
        self.view.alpha = 0.5
        submitInspection()
    }
}

// MARK: - API call
extension QuestionsViewController {
    func submitInspection() {
        if let selectedInspection = self.inspection {
            viewModel.submitInspection(inspection: selectedInspection) {isSuccess in
                self.view.alpha = 1

                if !isSuccess {
                    print("error in API calling")
                }
            }
        }
    }
}

// MARK: - UITableView
extension QuestionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedCategoryQuestions?.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as? QuestionCell else {
            return UITableViewCell()
        }
        
        cell.setQuestionData(question: self.selectedCategoryQuestions?[indexPath.row].name ?? "", option1: self.selectedCategoryQuestions?[indexPath.row].answerChoices?[0].name ?? "", option2: self.selectedCategoryQuestions?[indexPath.row].answerChoices?[1].name ?? "", option3: self.selectedCategoryQuestions?[indexPath.row].answerChoices?[2].name ?? "")
        
        return cell
    }
}
