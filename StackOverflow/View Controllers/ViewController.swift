//
//  ViewController.swift
//  StackOverflow
//
//  Created by Adonis Rumbwere on 23/9/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var selectedQuestion:Item!
    
    private let searchVC = UISearchController(searchResultsController: nil)
    private var questionDetails = [Item]()
    private var viewModels = [QuestionsTableViewCellViewModel]()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(QuestionsTableViewCell.self,
                       forCellReuseIdentifier: QuestionsTableViewCell.identifier)
        return table
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        tableView.separatorColor = .clear
        
       
        tableView.delegate = self
        tableView.dataSource = self
        tableView.alpha = 0
        
        createSearchBar()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
   private func createSearchBar(){
    navigationItem.searchController = searchVC
    searchVC.searchBar.delegate = self
    
    
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(
            withIdentifier: QuestionsTableViewCell.identifier,
            for: indexPath
        ) as? QuestionsTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(
            with: viewModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedQuestion = questionDetails[indexPath.row]
        
        
        if let viewController = UIStoryboard(name: "QuestionDetails", bundle: nil).instantiateViewController(identifier: "QuestionDetailsViewController") as? QuestionDetailsViewController {
         viewController.detailsInfo = selectedQuestion
                navigationController?.pushViewController(viewController, animated: true)
            }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //SEARCH
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, !text.isEmpty else {
            return
        }
        APICaller.shared.searchWithTag(with: text) { [weak self ] result in
            switch result {
                case .success(let items):
                    
                    self?.viewModels = items.compactMap({
                        QuestionsTableViewCellViewModel(questionTitle: $0.title!, body: $0.body!,
                                                        displayName: $0.owner.display_name ?? "Author",
                                                        votesCount: $0.view_count!,
                                                        answersCount: $0.answer_count!,
                                                        viewsCount: $0.view_count!,
                                                        reputation: ($0.owner.reputation!),
                                                        is_answered: $0.is_answered!,
                                                        creation_date: $0.creation_date!
                        )
                    })
                    
                    items.forEach { question in
                        self?.questionDetails.append(Item(owner: question.owner, title: question.title, body: question.body, score: question.score, view_count: question.view_count, creation_date: question.creation_date, answer_count: question.answer_count, is_answered: question.is_answered))
                    }
                    
                    DispatchQueue.main.async {
                        self?.tableView.alpha = 1
                        self?.tableView.reloadData()
                        self?.searchVC.dismiss(animated: true, completion: nil)
                    }
                    
                case .failure(let error):
                    print(error)
            }
        }
    }

}


