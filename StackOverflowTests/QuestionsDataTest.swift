//
//  QuestionsDataTest.swift
//  StackOverflowTests
//
//  Created by Adonis Rumbwere on 4/10/2021.
//

import XCTest
@testable import StackOverflow

class QuestionsDataTest: XCTestCase {

    func testCanParseQuestions() throws {
        
        let json = """
        
        {
            "items": [
                {
                    "tags": [
                        "arrays",
                        "swift",
                        "animation",
                        "swift3",
                        "uiimage"
                    ],
                    "owner": {
                        "reputation": 1,
                        "user_id": 15208629,
                        "user_type": "registered",
                        "profile_image": "https://lh4.googleusercontent.com/-6XzqKabk3L4/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucnaoGlIFqEhPgS4StA5W_y8bXZmGw/s96-c/photo.jpg?sz=128",
                        "display_name": "shabay88",
                        "link": "https://stackoverflow.com/users/15208629/shabay88"
                    },
                    "is_answered": false,
                    "view_count": 51,
                    "answer_count": 1
                }
            ]
           
        }
        
        """
        
        
        let jsonData = json.data(using: .utf8)!
        let result = try! JSONDecoder().decode(APIResponse.self, from: jsonData)
        
        //XCTAssertEqual(11, APIResponse.result.owner.reputation)
    }

}
