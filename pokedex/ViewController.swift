//
//  ViewController.swift
//  pokedex
//
//  Created by Jorge Luiz on 5/9/16.
//  Copyright © 2016 Jorge Luiz. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout{
    
    
    @IBOutlet weak var collection: UICollectionView!
    var pokemons = [Pokemon]()
    
    private let NUMBER_OF_SECTIONS = 1
    private let CELL_WIDTH = 100
    private let CELL_HEIGTH = 100
    
    private let BUTTON_TRANSPARENT = CGFloat(0.2)
    private let BUTTON_OPAQUE = CGFloat(1)
    private let INFINITY = -1
    
    var mediaPlayer:  AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        
        let service = PokedexCSVService()
        pokemons = service.getPokemons()
        
        let musicPath = NSBundle.mainBundle().pathForResource("music", ofType: "mp3")!
        do{
            mediaPlayer = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: musicPath))
            mediaPlayer.prepareToPlay()
            mediaPlayer.numberOfLoops = INFINITY
            mediaPlayer.play()
        }catch let err as NSError{
            print(err.debugDescription)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickMusic(sender: UIButton) {
        if mediaPlayer.playing {
            mediaPlayer.stop()
            sender.alpha = self.BUTTON_TRANSPARENT
        }else{
            mediaPlayer.play()
            sender.alpha = self.BUTTON_OPAQUE
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return NUMBER_OF_SECTIONS
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: CELL_WIDTH, height: CELL_HEIGTH)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let pokemonCell = collectionView.dequeueReusableCellWithReuseIdentifier(PokemonCell.CELL_IDENTIFIER, forIndexPath: indexPath)
        
        if let cell = pokemonCell as? PokemonCell{
            let poke = pokemons[indexPath.row]
            cell.configureCell(poke)
            return cell
        }else{
            return UICollectionViewCell()
        }
    }


}

