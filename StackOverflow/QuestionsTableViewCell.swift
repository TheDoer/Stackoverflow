//
//  QuestionsTableViewCell.swift
//  StackOverflow
//
//  Created by Adonis Rumbwere on 28/9/2021.
//

import UIKit

class QuestionsTableViewCell: UITableViewCell {
    static let identifier = "QuestionsTableViewCell"
    
    private let questionTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private let checkImage: UIImageView = {
        let checkImage = UIImageView()
        //checkImage.image = UIImage(named: "black_back_icon")
        return checkImage
    }()
    
    private let displayNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 10, weight: .regular)
        return label
    }()
    
    private let votesCountLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 10, weight: .regular)
        return label
    }()
    
    private let answersCountLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 10, weight: .regular)
        return label
    }()
    
    private let viewsCountLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 10, weight: .regular)
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(questionTitleLabel)
        //contentView.addSubview(checkImage)
        contentView.addSubview(displayNameLabel)
        contentView.addSubview(votesCountLabel)
        contentView.addSubview(answersCountLabel)
        contentView.addSubview(viewsCountLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        questionTitleLabel.frame = CGRect(x: 10,
                                          y: 0,
                                          width: contentView.frame.size.width - 120,
                                          height: 70)
        
        checkImage.frame = CGRect(x: 10,
                                        y: 20,
                                        width: 140,
                                        height: contentView.frame.size.height)
        
        displayNameLabel.frame = CGRect(x: 10,
                                        y: 35,
                                        width: 140,
                                        height: contentView.frame.size.height)
        
        votesCountLabel.frame = CGRect(x: contentView.frame.size.width-90,
                                       y: 0,
                                       width: 140,
                                       height: contentView.frame.size.height-5)
        
        answersCountLabel.frame = CGRect(x: contentView.frame.size.width-90,
                                        y: 15,
                                        width: 140,
                                        height: contentView.frame.size.height-5)
        
        viewsCountLabel.frame = CGRect(x: contentView.frame.size.width-90,
                                        y: 25,
                                        width: 140,
                                        height: contentView.frame.size.height-5)
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with ViewModel: QuestionsTableViewCellViewModel ) {
        
        questionTitleLabel.text = ViewModel.questionTitle
        displayNameLabel.text = ("asked by \(ViewModel.displayName)")
        votesCountLabel.text = ("\(ViewModel.votesCount) votes")
        answersCountLabel.text = ("\(ViewModel.answersCount) answers")
        viewsCountLabel.text = ("\(ViewModel.viewsCount) views")
    }

}
