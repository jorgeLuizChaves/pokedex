//
//  File.swift
//  pokedex
//
//  Created by Jorge Luiz on 5/9/16.
//  Copyright © 2016 Jorge Luiz. All rights reserved.
//

import Foundation
import Alamofire


class Pokemon {
    
    private let FIRST_DESCRIPTION = 0
    
    private var _attack: Int!
    private var _name: String!
    private var _type: String = ""
    private var _defense: Int!
    private var _types: String!
    private var _pokedexId: Int!
    private var _weight: String!
    private var _height: String!
    private var _nextLevelUp: Int?
    private var pokemonUrl: String!
    private var _description: String!
    private var _nextEvoId: String?
    private var _hasEvolution: Bool = false
    
    var nextLevelUp: Int? {
        return _nextLevelUp
    }
    
    var nextEvoId: String? {
        return _nextEvoId
    }
    
    var description: String {
        if(_description == nil){
            return ""
        }
        return _description
    }
    
    var types: String {
        return _type
    }
    
    var height: String! {
        if(_height == nil){
            return ""
        }
        return _height
    }
    
    var pokedexId: Int! {
        return _pokedexId
    }
    
    var defense: Int! {
        return _defense
    }
    
    var weight: String! {
        return _weight
    }
    
    var name: String {
        return _name
    }
    
    var attack: Int! {
        return _attack
    }
    
    init(name: String, pokedexId: Int){
        _name = name
        _pokedexId = pokedexId
        pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(pokedexId)"
        
    }
    
    
    func dowloadPokemonDetail(callback: DownloadComplete){
        Alamofire.request(.GET, self.pokemonUrl).responseJSON { (response: Response<AnyObject, NSError>?) in
           //print(value.debugDescription)
            
            if let res = response {
                if let jsonData = res.data {
                    let json = JSON(data: jsonData)
                    
                    self._weight = json["weight"].stringValue
                    self._attack = json["attack"].intValue
                    self._defense = json["defense"].intValue
                    self._height = json["height"].stringValue
                    self.getPokemonTypes(json)
                    self.getEvolutions(json)
                    self.getPokemonDescription(json, callback: callback)
                }
            }
        }
    }
    
    func hasEvolution() -> Bool {
        return self._hasEvolution
    }
    
    private func getPokemonTypes(json: JSON) {
        if let types = json["types"].array{
            
            if(types.count == 1){
                self._type = "\(types[0]["name"])"
            }
            
            if(types.count > 1){
                let lastTypeIndex = types.count - 1
                for cont in 0 ..< types.count {
                    if(cont == lastTypeIndex){
                        self._type = "\(self._type) \(types[cont]["name"])"
                    }else{
                        self._type = "\(self._type) \(types[cont]["name"]) /"
                    }
                }
            }
            
        }
    }
    
    private func getPokemonDescription(firstJson: JSON, callback: DownloadComplete) {
        let pokeDescriptionURL = self.getDescriptionURL(firstJson)
        Alamofire.request(.GET, pokeDescriptionURL).responseJSON(completionHandler: { (response: Response<AnyObject, NSError>) in
            
            if let jsonData = response.data {
                let json = JSON(data: jsonData)
                
                self._description = json["description"].stringValue
                callback()
            }
        })
    }
    
    private func getDescriptionURL(json: JSON) -> String{
        let descriptons = json["descriptions"].arrayValue
        
        let urlPokeDescription = descriptons[self.FIRST_DESCRIPTION]
        
        let descriptionPath = urlPokeDescription["resource_uri"]
        let pokeDescriptionURL = "\(URL_BASE)\(descriptionPath)"
        return pokeDescriptionURL
    }
    
    private func getEvolutions(json: JSON){
        if let evolutions = json["evolutions"].array where evolutions.count > 0 {
            let evo = evolutions[0]
            
            let evolutionTo = evo["to"].stringValue
            
            if(!evolutionTo.containsString("mega")){
                self._nextLevelUp = evo["level"].intValue
                self._hasEvolution = true
                let resourceNextEvo = evo["resource_uri"].stringValue
                let nextEvoId = resourceNextEvo.stringByReplacingOccurrencesOfString("/api/v1/pokemon/", withString: "")
                .stringByReplacingOccurrencesOfString("/", withString: "")
                print(nextEvoId)
                self._nextEvoId = nextEvoId
            }
        }
    }
    
    
}