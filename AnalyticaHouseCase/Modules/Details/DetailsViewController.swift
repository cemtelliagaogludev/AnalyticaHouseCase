//
//  DetailsViewController.swift
//  AnalyticaHouseCase
//
//  Created by admin on 20.03.2023.
//

import UIKit

class DetailsViewController: UIViewController{
    //MARK: - Properties
    lazy var pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var abilityTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Abilities"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var abilitiesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var pokemonViewModel: PokemonViewModel?
    var presenter: DetailsPresenter?
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.notifyViewDidLoad()
    }
    //MARK: - Handlers
    private func createAbilityLabel(text: String)-> UILabel{
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.minimumScaleFactor = 0.7
        label.text = text
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
//MARK: - PresenterToView
extension DetailsViewController: DetailsPresenterToView{
    func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(pokemonNameLabel)
        view.addSubview(pokemonImageView)
        view.addSubview(abilityTitleLabel)
        view.addSubview(abilitiesStackView)
        let imageWidth = UIScreen.main.bounds.size.width - 100
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            // pokemonNameLabel
            pokemonNameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 100),
            pokemonNameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 50),
            pokemonNameLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -50),
            // pokemonImageView
            pokemonImageView.topAnchor.constraint(equalTo: pokemonNameLabel.bottomAnchor, constant: 50),
            pokemonImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 50),
            pokemonImageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -50),
            pokemonImageView.heightAnchor.constraint(equalToConstant: imageWidth),
            // abilityTitleLabel
            abilityTitleLabel.topAnchor.constraint(equalTo: pokemonImageView.bottomAnchor, constant: 20),
            abilityTitleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 50),
            abilityTitleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -50),
            // abilitiesStackView
            abilitiesStackView.topAnchor.constraint(equalTo: abilityTitleLabel.bottomAnchor, constant: 20),
            abilitiesStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 50),
            abilitiesStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -50)
        ])
        
        guard let viewModel = self.pokemonViewModel else{ return }
        pokemonNameLabel.text = viewModel.name
        pokemonImageView.kf.setImage(with: URL(string: viewModel.imageURL))
        let abilities = viewModel.abilities
        guard abilities.count < 5 else{ return }
        for ability in abilities {
            abilitiesStackView.addArrangedSubview(
                createAbilityLabel(text: ability.ability.name)
            )
        }
    }
}
