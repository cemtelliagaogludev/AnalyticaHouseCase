//
//  ViewController.swift
//  AnalyticaHouseCase
//
//  Created by admin on 20.03.2023.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: - Properties
    private let cellIdentifier = "pokemonCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HomeViewToPresenter?
    
    var pokemonViewModels: [PokemonViewModel]?{
        didSet{
            tableView.reloadData()
        }
    }
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter?.notifyViewDidLoad()
    }
}
//MARK: - TableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonViewModels?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? PokemonCell else{ return UITableViewCell()}
        guard let viewModel = self.pokemonViewModels?[indexPath.row] else{ return cell }
        cell.pokemonViewModel = viewModel
        return cell
    }
}
//MARK: - PresenterToView
extension HomeViewController: HomePresenterToView{
    
    func setupView() {
        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PokemonCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    func displayViewModels(viewModels: [PokemonViewModel]) {
        self.pokemonViewModels = viewModels
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func displayErrorMessage(_ errorMessage: String) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel))
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}
