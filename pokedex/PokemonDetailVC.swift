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
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var segmentedPokemon: UISegmentedControl!
    @IBOutlet weak var pokemonDetailView: UIView!
    
    let POKEMON_INFO_VIEW = 0
    let POKEMON_MOVES_VIEW = 1
    
    var pokemon: Pokemon!
    var pokemonScreens: [Int:String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureScreenDictionary()
        self.name.text = pokemon.name
        self.loadViewController(PokemonInfoVC.IDENTIFIER_NAME)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }

    @IBAction func onBackButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onSeguementedClicked(sender: AnyObject) {
        let option = sender.selectedSegmentIndex
        let screenName = pokemonScreens[option]!
        self.loadViewController(screenName)
    }
    
    private func configureScreenDictionary() {
        self.pokemonScreens = [Int:String]()
        pokemonScreens[POKEMON_INFO_VIEW] = PokemonInfoVC.IDENTIFIER_NAME
        pokemonScreens[POKEMON_MOVES_VIEW] = PokemonMovesVC.IDENTIFIER_NAME
    }
    
    private func loadViewController(name: String){
        let currentVC = self.storyboard?.instantiateViewControllerWithIdentifier(name) as? PokemonVC
        if let viewController = currentVC {
            viewController.pokemon = self.pokemon
            viewController.view.frame = pokemonDetailView.bounds
            pokemonDetailView.addSubview(viewController.view)
            addChildViewController(viewController)
            viewController.didMoveToParentViewController(self)
        }
    }
}
