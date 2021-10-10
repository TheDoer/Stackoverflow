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
        

        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd"

           if let Ddate = formatter.date(from: ("\(String(describing: detailsInfo.creation_date))")){

               let displayFormatter = DateFormatter()
               displayFormatter.dateFormat = "EEEE dd MMMM yyyy"

             self.NewDate = displayFormatter.string(from: Ddate)

           }
        

       questionTitle.text = detailsInfo.title
        let str = detailsInfo.body
        let NewQuestionBody = str!.trimHTMLTags()
       questionBody.text = NewQuestionBody
        
        
//        //profileImage.image = detailsInfo.
//        displayName.text = detailsInfo.owner.display_name
//        reputation.text = ("\(String(describing: detailsInfo.owner.reputation))")
//        creationDate.text = "\(String(describing: self.NewDate))"
        
        
        
        
    }
    
}

extension String {
    public func trimHTMLTags() -> String? {
        guard let htmlStringData = self.data(using: String.Encoding.utf8) else {
            return nil
        }
    
        let options: [NSAttributedString.DocumentReadingOptionKey : Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
    
        let attributedString = try? NSAttributedString(data: htmlStringData, options: options, documentAttributes: nil)
        return attributedString?.string
    }
}
