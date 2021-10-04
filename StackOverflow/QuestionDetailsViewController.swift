//
//  QuestionDetailsViewController.swift
//  StackOverflow
//
//  Created by Adonis Rumbwere on 3/10/2021.
//

import UIKit

class QuestionDetailsViewController: UIViewController {
    
     var detailsInfo:Item!
     var NewDate: String!
    
    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var questionBody: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var displayName: UILabel!
    @IBOutlet weak var reputation: UILabel!
    @IBOutlet weak var creationDate: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Question"
        
//        let formatter = DateFormatter()
//            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
//            formatter.calendar = Calendar(identifier: .iso8601)
//            formatter.timeZone = TimeZone(secondsFromGMT: 0)
//            formatter.locale = Locale(identifier: "en_US_POSIX")
//
//
//
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd"

           if let Ddate = formatter.date(from: ("\(String(describing: detailsInfo.creation_date))")){

               let displayFormatter = DateFormatter()
               displayFormatter.dateFormat = "EEEE dd MMMM yyyy"

             self.NewDate = displayFormatter.string(from: Ddate)

            //creationDate.text = "\(NewDate)"
           }
        
       questionTitle.text = detailsInfo.title
       questionBody.text = detailsInfo.body
//        //profileImage.image = detailsInfo.
//        displayName.text = detailsInfo.owner.display_name
//        reputation.text = ("\(String(describing: detailsInfo.owner.reputation))")
//        creationDate.text = "\(String(describing: self.NewDate))"
        
        
        
        
    }
     


}
