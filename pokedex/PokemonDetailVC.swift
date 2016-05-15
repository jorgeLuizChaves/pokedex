//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Jorge Luiz on 5/11/16.
//  Copyright © 2016 Jorge Luiz. All rights reserved.
//

import Foundation
import UIKit

class PokemonDetailVC: UIViewController {
    
    
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var attack: UILabel!
    @IBOutlet weak var defense: UILabel!
    @IBOutlet weak var pokedexId: UILabel!
    @IBOutlet weak var pokeImage: UIImageView!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = pokemon.name
        pokeImage.image = UIImage(named: "\(pokemon.pokedexId)")
        pokedexId.text = "\(pokemon.pokedexId)";
    }

    @IBAction func onBackButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
