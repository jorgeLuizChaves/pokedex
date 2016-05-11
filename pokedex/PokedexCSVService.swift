//
//  PokedexCSVService.swift
//  pokedex
//
//  Created by Jorge Luiz on 5/10/16.
//  Copyright © 2016 Jorge Luiz. All rights reserved.
//

import Foundation

class PokedexCSVService {
    
    private let FILE_NAME = "pokemon"
    private let FILE_TYPE = "csv"
    
    func getPokemons() -> [Pokemon]{
        let csvFilePath = NSBundle.mainBundle().pathForResource(FILE_NAME, ofType: FILE_TYPE)!
        do{
            let csvFile = try ParserCSV(contentsOfURL: csvFilePath)
            var pokemons = [Pokemon]()
            for row in csvFile.rows {
                let pokemonName = row["identifier"]!
                let pokemonId = Int(row["id"]!)!
                let pokemon = Pokemon(name: pokemonName, pokedexId: pokemonId)
                pokemons.append(pokemon)
            }
            return pokemons
        }catch _ as NSError{
            return [Pokemon]()
        }
    }
}