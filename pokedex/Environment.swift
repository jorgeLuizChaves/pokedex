//
//  Environment.swift
//  pokedex
//
//  Created by Jorge Luiz on 6/4/16.
//  Copyright © 2016 Jorge Luiz. All rights reserved.
//

import Foundation

enum Environment : Equatable{
    
    case DEVELOPMENT
    case STAGING
    case PRODUCTION
    
    func isDev() -> Bool {
        if (self == Environment.DEVELOPMENT){
            return true
        }
        return false
        
    }
    
    func isStaging() -> Bool {
        if(self == Environment.STAGING){
            return true
        }
        return false
    }
    
    func isProd() -> Bool {
        if(self == Environment.PRODUCTION){
            return true
        }
        return false
    }
}