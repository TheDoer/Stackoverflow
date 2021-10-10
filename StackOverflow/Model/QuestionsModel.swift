//
//  QuestionsModel.swift
//  StackOverflow
//
//  Created by Adonis Rumbwere on 10/10/2021.
//

import Foundation

struct APIResponse: Codable {
    let items: [Item]
}
    struct Item: Codable {
        let owner: Owner
        //let tags: Tags
        let title: String?
        let body: String?
        let score: Int?
        let view_count: Int?
        let creation_date: Date?
        let answer_count: Int?
        let is_answered: Bool?
    }
    
    struct Owner: Codable {
        let display_name: String?
        let reputation: Int?
        let profile_image: String?
        
    }
