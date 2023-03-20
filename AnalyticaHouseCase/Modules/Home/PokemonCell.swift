//
//  PokemonCell.swift
//  AnalyticaHouseCase
//
//  Created by admin on 20.03.2023.
//

import UIKit
import Kingfisher

class PokemonCell: UITableViewCell{
    //MARK: - Properties
    var pokemonViewModel: PokemonViewModel?{
        didSet{
            updateView()
        }
    }
    
    lazy var pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Setup
    private func setupView(){
        addSubview(pokemonNameLabel)
        addSubview(pokemonImageView)
        NSLayoutConstraint.activate([
            pokemonImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            pokemonImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            pokemonImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            pokemonImageView.heightAnchor.constraint(equalToConstant: 75),
            pokemonImageView.widthAnchor.constraint(equalToConstant: 75),
            pokemonNameLabel.leadingAnchor.constraint(equalTo: pokemonImageView.trailingAnchor, constant: 8),
            pokemonNameLabel.centerYAnchor.constraint(equalTo: pokemonImageView.centerYAnchor),
            pokemonNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    func updateView(){
        guard let pokemonViewModel = self.pokemonViewModel else{ return }
        pokemonNameLabel.text = pokemonViewModel.name
        pokemonImageView.kf.setImage(with: URL(string: pokemonViewModel.imageURL)!)
    }
}
