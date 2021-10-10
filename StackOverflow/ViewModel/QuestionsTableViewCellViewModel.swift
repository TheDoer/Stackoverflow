//
//  QuestionsTableViewCellViewModel.swift
//  StackOverflow
//
//  Created by Adonis Rumbwere on 10/10/2021.
//

import UIKit

struct QuestionsTableViewCellViewModel {
    
    let questionTitle: String
    let body: String?
    let displayName: String
    let votesCount: Int
    let answersCount: Int
    let viewsCount: Int
    let reputation: Int
    let is_answered: Bool
    let creation_date: Date
    
    init(
        questionTitle: String,
        body:String,
        displayName: String,
        votesCount: Int,
        answersCount: Int,
        viewsCount: Int,
        reputation: Int,
        is_answered: Bool,
        creation_date:Date
        )
    {
        self.questionTitle = questionTitle
        self.body = body
        self.displayName = displayName
        self.votesCount = votesCount
        self.answersCount = answersCount
        self.viewsCount = viewsCount
        self.reputation = reputation
        self.is_answered = is_answered
        self.creation_date = creation_date
    }
}
