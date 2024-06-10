//
//  InspectionsModel.swift
//  Tendable_iOSExercise
//
//  Created by Rohan Panchal on 06/06/24.
//

import Foundation

struct InspectionsModel: Codable {
    let inspection: Inspection?
}

struct Inspection: Codable {
    let id: Int?
    let inspectionType: InspectionType?
    let area: Area?
    let survey: Survey?
}

struct InspectionType: Codable {
    let id: Int?
    let name: String?
    let access: String?
}

struct Area: Codable {
    let id: Int?
    let name: String?
}

struct Survey: Codable {
    let id: Int?
    let categories: [Categories]?
}

struct Categories: Codable {
    let id: Int?
    let name: String?
    let questions: [Questions]?
}

struct Questions: Codable {
    let id: Int?
    let name: String?
    let answerChoices: [AnswerChoices]?
    let selectedAnswerChoiceId: Int?
}

struct AnswerChoices: Codable {
    let id: Int?
    let name: String?
    let score: Float?
}
