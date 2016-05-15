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
UICollectionViewDelegateFlowLayout, UISearchBarDelegate{
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collection: UICollectionView!
    
    var onSearchMode = false
    var pokemons = [Pokemon]()
    var pokemonsFilter = [Pokemon]()
    var mediaPlayer:  AVAudioPlayer!
    
    
    private let INFINITY = -1
    private let CELL_WIDTH = 100
    private let CELL_HEIGTH = 100
    private let FILE_TYPE = "mp3"
    private let FILE_NAME = "music"
    private let NUMBER_OF_SECTIONS = 1
    private let BUTTON_OPAQUE = CGFloat(1)
    private let BUTTON_TRANSPARENT = CGFloat(0.2)
    private let SEGUE_DETAIL_POKEMON = "showPokemonDetail"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDelegates()
        configureCollectionDataSource()
        
        
        let service = PokedexCSVService()
        pokemons = service.getPokemons()
        
        searchBar.returnKeyType = UIReturnKeyType.Done
        
        let musicPath = NSBundle.mainBundle().pathForResource(FILE_NAME, ofType: FILE_TYPE)!
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
            sender.alpha = BUTTON_TRANSPARENT
        }else{
            mediaPlayer.play()
            sender.alpha = BUTTON_OPAQUE
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.countPokemons()
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return NUMBER_OF_SECTIONS
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let pokemonsList = getPokemonsList()
        let pokemon = pokemonsList[indexPath.row]

        performSegueWithIdentifier(SEGUE_DETAIL_POKEMON, sender: pokemon)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: CELL_WIDTH, height: CELL_HEIGTH)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let pokemonCell = collectionView.dequeueReusableCellWithReuseIdentifier(PokemonCell.CELL_IDENTIFIER, forIndexPath: indexPath)
        
        if let cell = pokemonCell as? PokemonCell{
            let pokemonList = self.getPokemonsList()
            let poke = pokemonList[indexPath.row]
            cell.configureCell(poke)
            return cell
        }else{
            return UICollectionViewCell()
        }
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchBar.text != nil && searchBar.text != ""){
            let pokeNameLowerCase = searchBar.text!.lowercaseString
            onSearchMode = true
            pokemonsFilter = pokemons.filter({$0.name.rangeOfString(pokeNameLowerCase) != nil})
            collection.reloadData()
        }else{
             hideKeyboard()
            onSearchMode = false
            collection.reloadData()
           

        }
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        hideKeyboard()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == SEGUE_DETAIL_POKEMON){
            if let pokemonDetailVC = segue.destinationViewController as? PokemonDetailVC {
                if let poke = sender as? Pokemon{
                    pokemonDetailVC.pokemon = poke
                }
            }
        }
    }
    
    private func countPokemons() -> Int {
        if(isOnSearchMode()){
            return pokemonsFilter.count
        }
        return pokemons.count
    }
    
    private func getPokemonsList() -> [Pokemon] {
        if(isOnSearchMode()){
            return pokemonsFilter
        }
        return pokemons
    }
    
    private func isOnSearchMode() -> Bool {
        return onSearchMode
    }
    
    private func configureDelegates(){
        collection.delegate = self
        searchBar.delegate = self
    }
    
    private func configureCollectionDataSource(){
        collection.dataSource = self
    }
    
    private func hideKeyboard(){
        view.endEditing(true)
    }
}