//
//  PokemonMovesVC.swift
//  pokedex
//
//  Created by Jorge Luiz on 6/12/16.
//  Copyright © 2016 Jorge Luiz. All rights reserved.
//

import Foundation
import UIKit

class PokemonMovesVC: PokemonVC, UITableViewDelegate, UITableViewDataSource {

    static let IDENTIFIER_NAME = "pokemonMoves"
    let NUMBER_OF_SECTIONS = 1
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemon.moves.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("moveCell") as? PokeMoveCell
        let move = self.pokemon.moves[indexPath.row]
        if let pokecell = cell {
            pokecell.configureCell(move)
            return pokecell
        }else {
            let pokecell = PokeMoveCell()
            pokecell.configureCell(move)
            return pokecell
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return NUMBER_OF_SECTIONS
    }

}
