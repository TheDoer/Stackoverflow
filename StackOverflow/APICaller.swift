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
        
        static let searchURLString =  "https://api.stackexchange.com/2.2/questions?pagesize=20&order=desc&sort=activity&site=stackoverflow&filter=withbody&tagged="
    }
   
    private init() {}
    
    public func getQuestions(completion: @escaping (Result<[Item], Error>) -> Void) {
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
                    completion(.success(result.items))
                }
                catch {
                    completion(.failure(error))
            }
        }
    }
        
    task.resume()
        
   }
    
    
    public func searchWithTag(with query: String, completion: @escaping (Result<[Item], Error>) -> Void) {
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        let urltring = Constants.searchURLString + query
        guard let url = URL(string: urltring) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            
            else if let data = data {
                do {
                    
                    let epochTime = TimeInterval(1429162809359) / 1000
                    let date = Date(timeIntervalSince1970: epochTime)   // "Apr 16, 2015, 2:40 AM"

                    print("Converted Time: \(date)")         // "Converted Time 2015-04-16 05:40:09 +0000\n"
                    
//                    let dateFormatter = DateFormatter()
//                    dateFormatter.calendar = Calendar(identifier: .gregorian)
//                    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
//                    dateFormatter.dateStyle = .medium
//                    dateFormatter.dateFormat = "d, MMM , yyyy, HH:mm"
                    
                    let formatter = DateFormatter()
                        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
                        formatter.calendar = Calendar(identifier: .iso8601)
                        formatter.timeZone = TimeZone(secondsFromGMT: 0)
                        formatter.locale = Locale(identifier: "en_US_POSIX")
                    
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    
                    
                    let results = try decoder.decode(APIResponse.self, from: data)
                    print("Questions: \(results.items.count)")
                    completion(.success(results.items))
                    
                
                }
                catch {
                    completion(.failure(error))
            }
        }
    }
        
    task.resume()
        
   }
}


//Models

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

//struct Tags: Codable {
//    let tags: String?
//}
    



