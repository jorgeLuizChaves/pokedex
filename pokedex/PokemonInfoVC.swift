//
//  PokemonInfoVC.swift
//  pokedex
//
//  Created by Jorge Luiz on 6/5/16.
//  Copyright © 2016 Jorge Luiz. All rights reserved.
//

import UIKit

class PokemonInfoVC: UIViewController {
    
//    var pokemon: Pokemon!
//    
//    @IBOutlet weak var type: UILabel!
//    @IBOutlet weak var desc: UILabel!
//    @IBOutlet weak var height: UILabel!
//    @IBOutlet weak var weight: UILabel!
//    @IBOutlet weak var attack: UILabel!
//    @IBOutlet weak var defense: UILabel!
//    
//    @IBOutlet weak var pokedexId: UILabel!
//    @IBOutlet weak var nextEvo: UIImageView!
//    @IBOutlet weak var actualEvo: UIImageView!
//    @IBOutlet weak var pokeImage: UIImageView!
//    @IBOutlet weak var nextEvolutionLabel: UILabel!
    
    static let IDENTIFIER_NAME = "pokemonInfo"
    

    override func viewDidLoad() {
        super.viewDidLoad()

//        pokemon.dowloadPokemonDetail{ ()  in
//            //this will be called after download is done
//            let pokemon = self.pokemon
//            self.pokeImage.image =  UIImage(named: "\(pokemon.pokedexId)")
//            self.pokedexId.text = "\(pokemon.pokedexId)"
//            self.weight.text = pokemon.weight
//            self.attack.text = "\(pokemon.attack)"
//            self.defense.text = "\(pokemon.defense)"
//            self.height.text = pokemon.height
//            self.desc.text = pokemon.description
//            self.type.text = pokemon.types
//            
//            self.actualEvo.image =  UIImage(named: "\(pokemon.pokedexId)")
//            if(pokemon.hasEvolution()){
//                if let nextLevelUp = pokemon.nextLevelUp, nextLevelId = pokemon.nextEvoId {
//                    self.nextEvolutionLabel.text = "\(nextLevelUp) levels to evolution"
//                    self.nextEvo.hidden = false
//                    self.nextEvo.image = UIImage(named: nextLevelId)
//                }
//            }else{
//                self.nextEvo.hidden = true
//                self.nextEvolutionLabel.text = "No evolution"
//            }
//        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
