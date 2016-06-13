//
//  PokeMoveCell.swift
//  pokedex
//
//  Created by Jorge Luiz on 6/13/16.
//  Copyright © 2016 Jorge Luiz. All rights reserved.
//

import Foundation
import UIKit

class PokeMoveCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    
    override func awakeFromNib() {
        
    }
    
    
    func configureCell(move: Move) {
        self.name.text = move.name
        self.type.text = move.type
    }

}
