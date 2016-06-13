//
//  Move.swift
//  pokedex
//
//  Created by Jorge Luiz on 6/13/16.
//  Copyright © 2016 Jorge Luiz. All rights reserved.
//

import Foundation

class Move {
    
    private var _name: String!
    private var _type: String!
    
    var name: String {
        get {
            return _name
        }
        
        set {
            self._name = newValue
        }
    }
    
    var type: String {
        get {
            return _type
        }
        
        set {
            _type = newValue
        }
    }
}