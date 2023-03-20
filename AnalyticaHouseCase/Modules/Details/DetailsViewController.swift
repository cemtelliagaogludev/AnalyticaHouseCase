//
//  DetailsViewController.swift
//  AnalyticaHouseCase
//
//  Created by admin on 20.03.2023.
//

import UIKit

class DetailsViewController: UIViewController{
    //MARK: - Properties
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var abilityLabel1: UILabel!
    @IBOutlet weak var abilityLabel2: UILabel!
    @IBOutlet weak var abilityLabel3: UILabel!
    @IBOutlet weak var abilityLabel4: UILabel!
    var pokemonViewModel: PokemonViewModel?
    var presenter: DetailsPresenter?
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.notifyViewDidLoad()
    }
}
//MARK: - PresenterToView
extension DetailsViewController: DetailsPresenterToView{
    func setupView() {
        guard let viewModel = self.pokemonViewModel else{ return }
        pokemonNameLabel.text = viewModel.name
        pokemonImageView.kf.setImage(with: URL(string: viewModel.imageURL))
        let abilities = viewModel.abilities
        let views = [abilityLabel1, abilityLabel2, abilityLabel3, abilityLabel4]
        guard abilities.count < 5 else{ return }
        for i in 0..<abilities.count{
            let ability = abilities[i]
            if let label = views[i]{
                label.isHidden = false
                label.text = ability.ability.name
            }
        }
    }
}
