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
    
    
    @IBOutlet weak var name: UILabel!
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = pokemon.name
    }

}
