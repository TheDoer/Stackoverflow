//
//  QuestionViewController.swift
//  StackOverflow
//
//  Created by Adonis Rumbwere on 29/9/2021.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var detailsInfo:Item!
    
    @IBOutlet weak var questionTitleLabel: UILabel!
    @IBOutlet weak var questionBodyTextArear: UITextView!
    @IBOutlet weak var ownerProfileImage: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var ownerReputation: UILabel!
    @IBOutlet weak var dateQuestionWasPosted: UILabel!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //detailsInfo.owner.reputation
    }
    


}
