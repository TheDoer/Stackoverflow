//
//  APICaller.swift
//  StackOverflow
//
//  Created by Adonis Rumbwere on 27/9/2021.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    struct Constants {
        static let stackOverflowURL = URL(string: "https://api.stackexchange.com/2.2/questions?pagesize=20&order=desc&sort=activity&tagged=swift%203&site=stackoverflow&filter=withbody")
    }
   
    private init() {}
    
    public func getQuestions(completion:@escaping (Result<[String], Error>) ->Void) {
        guard let url = Constants.stackOverflowURL else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Questions: \(result.items.count)")
                }
                catch {
                    completion(.failure(error))
            }
        }
    }
    task.resume()
   }
}

struct APIResponse: Codable {
    let items: [Items]
    
    struct Items: Codable {
        let owner: Owner
        let title: String?
        let score: Int?
        let view_count: Int?
        let answer_count: Int?
        let is_answered: Bool?
    }
    
    struct Owner: Codable {
        let display_name: String?
    }
    

}
    


