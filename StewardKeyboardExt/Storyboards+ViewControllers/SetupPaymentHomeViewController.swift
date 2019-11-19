//
//  SetupPaymentHomeViewController.swift
//  KeyboardStoryboadApp
//
//  Created by mac pro on 8/22/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import UIKit

class SetupPaymentHomeViewController: UIViewController {
    
    
    
    @IBOutlet weak var setUpEcocashTile: UIView!
    @IBOutlet weak var setupStewardTile: UIView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        let ecocashTileGesture = UITapGestureRecognizer(target: self, action: #selector(SetupPaymentHomeViewController.airtimeTilePressed(_:)))
        setUpEcocashTile.isUserInteractionEnabled = true
        setUpEcocashTile.addGestureRecognizer(ecocashTileGesture)
        
        
        
        let squareTileGesture = UITapGestureRecognizer(target: self, action: #selector(SetupPaymentHomeViewController.squareTilePressed(_:)))
        setupStewardTile.isUserInteractionEnabled = true
        setupStewardTile.addGestureRecognizer(squareTileGesture)
        
        if let squareStatus = SharedPreference.getSquareOnBoardStatus() {
            
            if squareStatus == "1" {
                
                print("Ecocash Status: \(squareStatus)")
                setupStewardTile.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
                
            }else {
                
                print("Ecocash Status: \(squareStatus)")
                setupStewardTile.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            }
        
    }

    
    
        if let ecocashStatus = SharedPreference.getSquareOnBoardStatus() {

            if ecocashStatus == "1" {


                print("Ecocash Status: \(ecocashStatus)")
                setUpEcocashTile.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)

            }else {


                print("Ecocash Status: \(ecocashStatus)")
                setUpEcocashTile.backgroundColor = #colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1)
            }


        }
    
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        
        
    }
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BACK BUTTON ACTION
    //----------------------------------------------------------------
    
    @IBAction func backBtnAction(_ sender: Any) {
        
        dismiss(animated: true)
    
    }
    
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ECOCASH TILE CLICK ACTION
    //----------------------------------------------------------------
    
    @objc func airtimeTilePressed(_ sender: AnyObject) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "EcocashOnboardingViewController", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "EcocashOnboardingViewController") as! EcocashOnboardingViewController
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SQUARE TILE CLICK ACTION
    //----------------------------------------------------------------
    
    @objc func squareTilePressed(_ sender: AnyObject) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "SquareOnBoardViewController", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "SquareOnBoardViewController") as! SquareOnBoardViewController
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    
    //----------------------------------------------------------------
    

}
