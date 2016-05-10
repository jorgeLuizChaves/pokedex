//
//  PokemonCell.swift
//  pokedex
//
//  Created by Jorge Luiz on 5/9/16.
//  Copyright © 2016 Jorge Luiz. All rights reserved.
//

import Foundation
import UIKit

class PokemonCell: UICollectionViewCell {

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    
    var pokemon: Pokemon!
    
    func configureCell(pokemon: Pokemon){
        self.pokemon = pokemon
        
        pokemonName.text = pokemon.name.capitalizedString
        pokemonImage.image = UIImage(named: "\(pokemon.pokedexId)")
    }
}
