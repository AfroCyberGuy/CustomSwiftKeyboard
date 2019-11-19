//
//  HomeScreenViewController.swift
//  KeyboardStoryboadApp
//
//  Created by mac pro on 8/22/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import UIKit
import Device_swift

class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var homeTopLogo: UIImageView!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    var homeCell = [HomeGridModel]()
    

    override func viewWillAppear(_ animated: Bool) {
        
        DispatchQueue.main.async {
            
//            self.performSegue(withIdentifier: "OnBoardPrimaryNumberViewController", sender: self)
            
            guard let pin = SharedPreference.getPhoneNumber() else {
                
                print("No Pin")
                let storyBoard: UIStoryboard = UIStoryboard(name: "OnBoardPrimaryNumberViewController", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "OnBoardPrimaryNumberViewController") as! OnBoardPrimaryNumberViewController
                self.present(newViewController, animated: true, completion: nil)
                return
            }
            
            print(pin)
        }
        
        
//        let storyBoard: UIStoryboard = UIStoryboard(name: "OnBoardPrimaryNumberViewController", bundle: nil)
//        let newViewController = storyBoard.instantiateViewController(withIdentifier: "OnBoardPrimaryNumberViewController") as! OnBoardPrimaryNumberViewController
//        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let deviceid = UIDevice.current.identifierForVendor?.uuidString
        SharedPreference.setIMEI(IMEI: deviceid!)
       
//        print("Ecocash Number Shared Preference: \(SharedPreference.getEcocashEcocashPhone()!)")
        
        
//        let deviceid = UIDevice.current.identifierForVendor?.uuidString
//        SharedPreference.setIMEI(IMEI: deviceid!)
        //        prefs.set(deviceid!, forKey: "imei")
        
        
        


        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        
        homeCell = createArray()
        
        let itemSize = homeCollectionView.frame.width/2 - 2
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(1, 0, 1, 0)
        layout.itemSize = CGSize(width: itemSize, height: 160)
        
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        
        homeCollectionView.collectionViewLayout = layout
    }
    
    
    
    func createArray() -> [HomeGridModel] {
        
        var tempHomeCell = [HomeGridModel]()
        
        let cell1 = HomeGridModel(cellImage: #imageLiteral(resourceName: "payment_channels_icon"), title: "Payment Methods")
        let cell2 = HomeGridModel(cellImage: #imageLiteral(resourceName: "myprofile_icon"), title: "My Profile")
        let cell3 = HomeGridModel(cellImage: #imageLiteral(resourceName: "keyboard_settings_icon"), title: "Keyboard Settings")
        let cell4 = HomeGridModel(cellImage: #imageLiteral(resourceName: "security_icon"), title: "Security")
       
        
        tempHomeCell.append(cell1)
        tempHomeCell.append(cell2)
        tempHomeCell.append(cell3)
        tempHomeCell.append(cell4)

        
        return tempHomeCell
    }
    
    
    
  
//    
//    func createTileArray() -> [KeyboardTileModel] {
//        
//        var tempHomeCell = [KeyboardTileModel]()
//        
//        let cell1 = Key
//        let cell2 = HomeGridModel(cellImage: #imageLiteral(resourceName: "myprofile_icon"), title: "My Profile")
//        let cell3 = HomeGridModel(cellImage: #imageLiteral(resourceName: "keyboard_settings_icon"), title: "Keyboard Settings")
//        let cell4 = HomeGridModel(cellImage: #imageLiteral(resourceName: "logout_icon"), title: "Logout")
//        let cell5 = HomeGridModel(cellImage: #imageLiteral(resourceName: "security_icon"), title: "Security")
//        let cell6 = HomeGridModel(cellImage: #imageLiteral(resourceName: "notifications_icon"), title: "Notifications")
//
//        tempHomeCell.append(cell1)
//        tempHomeCell.append(cell2)
//        tempHomeCell.append(cell3)
//        tempHomeCell.append(cell4)
//        tempHomeCell.append(cell5)
//        tempHomeCell.append(cell6)
//        
//        return tempHomeCell
//    }

}

extension HomeScreenViewController:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return homeCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        
        let rowData = homeCell[indexPath.row]
        
        cell.setUpHomeCell(homeCell: rowData)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "SetupPaymentHomeViewController", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SetupPaymentHomeViewController") as! SetupPaymentHomeViewController
            self.present(newViewController, animated: true, completion: nil)
        }else if indexPath.row == 1 {
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "MyProfileViewController", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "MyProfileViewController") as! MyProfileViewController
            self.present(newViewController, animated: true, completion: nil)
            
            
        }else if indexPath.row == 2 {
            
            print("Keyboard Settings")
//            let settingsURL = URL(string: "prefs:root=General&path=Keyboard")
            let settingsUrl = URL(string: UIApplicationOpenSettingsURLString)!
            UIApplication.shared.open(settingsUrl)
        }
        
      
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//
//        return CGSize(width: 100, height: 40)
//    }

    
}
