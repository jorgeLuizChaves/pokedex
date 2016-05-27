//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Jorge Luiz on 5/11/16.
//  Copyright © 2016 Jorge Luiz. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class PokemonDetailVC: UIViewController {
    
    
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var attack: UILabel!
    @IBOutlet weak var defense: UILabel!
    
    @IBOutlet weak var pokedexId: UILabel!
    @IBOutlet weak var nextEvo: UIImageView!
    @IBOutlet weak var actualEvo: UIImageView!
    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet weak var nextEvolutionLabel: UILabel!
    @IBOutlet weak var loadingView: UIView!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        pokemon.dowloadPokemonDetail{ ()  in
            //this will be called after download is done
            let pokemon = self.pokemon
            self.name.text = pokemon.name
            self.pokeImage.image =  UIImage(named: "\(pokemon.pokedexId)")
            self.pokedexId.text = "\(pokemon.pokedexId)"
            self.weight.text = pokemon.weight
            self.attack.text = "\(pokemon.attack)"
            self.defense.text = "\(pokemon.defense)"
            self.height.text = pokemon.height
            self.desc.text = pokemon.description
            self.type.text = pokemon.types
            
            self.actualEvo.image =  UIImage(named: "\(pokemon.pokedexId)")
            if(pokemon.hasEvolution()){
                if let nextLevelUp = pokemon.nextLevelUp, nextLevelId = pokemon.nextEvoId {
                    self.nextEvolutionLabel.text = "\(nextLevelUp) levels to evolution"
                    self.nextEvo.hidden = false
                    self.nextEvo.image = UIImage(named: nextLevelId)
                }
            }else{
                self.nextEvo.hidden = true
                self.nextEvolutionLabel.text = "No evolution"
            }
            self.loadingView.hidden = true
            
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }

    @IBAction func onBackButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
