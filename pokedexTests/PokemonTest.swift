//
//  PokemonTest.swift
//  pokedex
//
//  Created by Jorge Luiz on 5/9/16.
//  Copyright © 2016 Jorge Luiz. All rights reserved.
//

import Foundation
import XCTest


class PokemonTest: XCTestCase {
    
    let NAME = "NAME"
    let POKEDEX_ID = 0
    

    func testCreatePokemon(){
        let pokemonTest = Pokemon(name: self.NAME, pokedexId: self.POKEDEX_ID)
        XCTAssertEqual(self.NAME, pokemonTest.name)
        XCTAssertEqual(self.POKEDEX_ID, pokemonTest.pokedexId)
    }
}