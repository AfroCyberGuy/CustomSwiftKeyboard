//
//  KeyboardViewController.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 8/27/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import CryptoSwift
import ParticlesLoadingView
//import APESuperHUD

class KeyboardViewController: UIInputViewController, ZIPITCellDelegate, MainTileCellDelegate, BillCellDelegate, ContactCellDelegate{
    
    
    var rowThreeHStackView =  UIStackView()
    
    
   
    
    var heightConstraint: NSLayoutConstraint!
 
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- GLOBAL PAYMENT OPTIONS
    //----------------------------------------------------------------
    
        var GLOBAL_ECOCASH_PAYMENT_OPTION = "0"
        var GLOBAL_SQUARE_PAYMENT_OPTION = "0"
        var GLOBAL_ZIMSWITCH_PAYMENT_OPTION = "0"

    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAIN TILES TAP DELEGATE
    //----------------------------------------------------------------
    
    
    func didTaptile(tileName: String) {
        
        print("DELEGATE TILE PRINT: \(tileName)")
        
        switch tileName {
        
        case "Airtime":
            
            makeAirTimeMainView()
            
            break
            
        case "Bill Payments":
            
            billArray = createArray()
            print("BILL ARRAY COUNT \(billArray.count)")
            makeBillPaymentMainView()
            
            let topView: BillCollectionView = {
                let tv = BillCollectionView()
                tv.translatesAutoresizingMaskIntoConstraints = false
                tv.delegate = self
                return tv
            }()
            
            billpaymentMainViewBillerList.addSubview(topView)
            topView.leadingAnchor.constraint(equalTo: billpaymentMainViewBillerList.leadingAnchor).isActive = true
            topView.trailingAnchor.constraint(equalTo: billpaymentMainViewBillerList.trailingAnchor).isActive = true
            topView.topAnchor.constraint(equalTo: billpaymentMainViewBillerList.topAnchor, constant: 0).isActive = true
            //      topView.widthAnchor.constraint(equalTo: billpaymentMainViewBillerList.widthAnchor).isActive = true
            topView.bottomAnchor.constraint(equalTo: billpaymentMainViewBillerList.bottomAnchor, constant: -3).isActive = true
            
            
            break
            
        case "Zipit":
            
            banksArray = createBankArray()
            print("BILL ARRAY COUNT: \(banksArray.count)")
            
            
            makeZIPITMainView()
            
            let topView: ZIPITCollectionView = {
                
                let tv = ZIPITCollectionView(banksArray: banksArray)
                tv?.translatesAutoresizingMaskIntoConstraints = false
                tv?.delegate = self
                return tv!
                
            }()
            
            ZIPITBanksList.addSubview(topView)
            topView.leadingAnchor.constraint(equalTo: ZIPITBanksList.leadingAnchor).isActive = true
            topView.trailingAnchor.constraint(equalTo: ZIPITBanksList.trailingAnchor).isActive = true
            topView.topAnchor.constraint(equalTo: ZIPITBanksList.topAnchor).isActive = true
            topView.bottomAnchor.constraint(equalTo: ZIPITBanksList.bottomAnchor, constant: -3).isActive = true
            
            break
            
        case "Balance Enquiry" :
            
//          makeBalanceEquiryMainView()
            makebalanceEquirySBPinView()
            
            break
            
        case "Internal Transfer":
            
            makeInternalAccountView()
            
            break
            
        default:
            break
        }
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT DELEGATES AND GLOBAL VARIABLES
    //----------------------------------------------------------------
    
    var ZIPIT_BANK_NAME = ""
    var ZIPIT_DESTINATION_ACCOUNT = ""
    var ZIPIT_AMOUNT = ""
    var ZIPIT_CARD_NUMBER = ""
    var ZIPIT_PAN_NUMBER = ""
    
    var AIRTIME_ZIMSWITCH_OPTION = "0"
    
    var ASSOCIATEDCODE = ""
    var ECOCASHSTATUS = ""
    var ID = 0
    var STATUS = ""
    var AMOUNT = 0.0
    var CORRELATER = ""
    var REFERENCE = ""
    var ECOCASHREFERENCE = ""
    var PHONE = ""
    
    
    
    func didTapBank(bankName: String) {
        
        ZIPITMainBankNameLabel.text = "Destination Bank >> \(bankName)"
        
        SharedPreference.setEcocashBankDestinationInstitution(destinationInstitution: BankValidater().validateZIPITBankCode(bankName: bankName))
        KeyboardSharedPreferences().setZIPITBankInstitution(bankInstitution: BankValidater().validateZIPITBankCode(bankName: bankName))
    
        print("ZIPIT BANK VARIABLE: \(KeyboardSharedPreferences().getZIPITBankInstitution()!)")
    }
    
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS DELEGATES AND GLOBAL VARIABLE
    //----------------------------------------------------------------
    
    
    var BILLBILLACCOUNT = ""
    var BILLBILLAMOUNT = ""
    var BILLBILLERCODE = ""
    var BILLPANNUMBER = ""
    
    func didTapBiller(billerName: String, billerCode: String) {
            
            print("BILLER NAME: \(billerName)")
            
            billpaymentsMainBillerLabel.text = "Biller >> \(billerName)"
        
            print("Biller Code \(billerCode)")
        
       
        KeyboardSharedPreferences().setBillerCode(billerCode: billerCode)
        
        print("SHARED PREFERENCES BILLER CODE: \(KeyboardSharedPreferences().getBillerCode()!)")
        
            
        }
    
    
   
    
    //----------------------------------------------------------------
    
    
    
    
    // MARK:-
    // MARK:- CONTACTS DELEGATE
    //----------------------------------------------------------------
    
    func didTapContact(contactPhonenumber: String) {
        
        if isPhonenumberValid(phonenumber: contactPhonenumber) {
            
            print(contactPhonenumber)
            if PhonenumberFormater().validateContact(phonenumber: contactPhonenumber) != "" {
                
                let validContact = PhonenumberFormater().validateContact(phonenumber: contactPhonenumber)
                
                
                if getMNO(msisdn: validContact) != "INVALID"{
                    
                    print(getMNO(msisdn: validContact))
                    
                    pickedContactNetworkProvider = getMNO(msisdn: validContact)
                    pickedContactPhonenumber = validContact
                    isPickedFromContact = true
                    
                    contactsView.removeFromSuperview()
                    makeAirTimeMainView()
                    
                }else{
                    
                    print("INVALID")
                }
                
            }
            
        }

    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    
    
    
    
    
    //----------------------------------------------------------------
    
   
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIMSWITCH BALANCE GLOBAL VARIABLES
    //----------------------------------------------------------------
    
        var ZIMSWITCH_BALANCE_CARD_NUMBER = ""
        var ZIMSWITCH_BALANCE_PIN = ""

    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL TRANSFER GLOBAL VARIABLES
    //----------------------------------------------------------------
    
        var INTERNAL_TRANSFER_DESTINATION_ACNT = ""
        var INTERNAL_TRANSFER_AMOUNT = ""
    
    
    //----------------------------------------------------------------

    
    
    var billArray = [BillersListModel]()
    var banksArray = [BankListModel]()
    var tilesArray = [KeyboardTileModel]()
    
    let expandedHeight:CGFloat = 320
    
    var keyboardView = Controls().theView()
    
    //GLOBAL PIN STRING
    var pinString = ""
    

    var globalBankName = ""
    
    
    
    let cellId = "zipitCell"
    
 
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE KEYBOARD VIEW
    //----------------------------------------------------------------
    
//    func makeKeyboardView(){
//
//        keyboardView.layer.cornerRadius = 0
//        keyboardView.backgroundColor = UIColor.blue
//        view.addSubview(keyboardView)
//        setKeyboardViewContraints()
//
//        makeMainkeyboardViewRowOne
//
//
//    }
//
//
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- COLLECTION VIEWS ARRAYS
    //----------------------------------------------------------------
    
     var billCell = [BillersListModel]()
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CREATE BILL PAYMENTS LIST ARRAY
    //----------------------------------------------------------------
    
    func createArray() -> [BillersListModel] {
        
        var billCell = [BillersListModel]()
        
        let cell1 = BillersListModel(billImage: "kwesetv", billerName: "KWESE", billerCode: "KWESETV")
        let cell2 = BillersListModel(billImage: "telone", billerName: "TELONE", billerCode: "TELONE")
        let cell3 = BillersListModel(billImage: "zetdc", billerName: "ZESA", billerCode: "ZETDC_PPE")
        let cell4 = BillersListModel(billImage: "l_zol", billerName: "ZOL", billerCode: "ZOL")
        let cell5 = BillersListModel(billImage: "l_edgars", billerName: "EDGARS", billerCode: "EDGARS")
        let cell6 = BillersListModel(billImage: "spca", billerName: "SPCA", billerCode: "SPCA")
        
        
        billCell.append(cell1)
        billCell.append(cell2)
        billCell.append(cell3)
        billCell.append(cell4)
        billCell.append(cell5)
        billCell.append(cell6)
       
        
        return billCell
    }

    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CREATE TILE ARRAY
    //----------------------------------------------------------------
    
    func createTileArray() -> [KeyboardTileModel] {
        
        var billCell = [KeyboardTileModel]()
        
        let cell1 = KeyboardTileModel(tileTitle: "Airtime")
        let cell2 = KeyboardTileModel(tileTitle: "Bill Payments")
        let cell3 = KeyboardTileModel(tileTitle: "Zipit")
        let cell4 = KeyboardTileModel(tileTitle: "Balance Enquiry")
        let cell5 = KeyboardTileModel(tileTitle: "Internal Transfer")

    
        billCell.append(cell1)
        billCell.append(cell2)
        billCell.append(cell3)
        billCell.append(cell4)
        
        if SharedPreference.getSquareOnBoardStatus() == "1" {
            
            billCell.append(cell5)
        }
        
        return billCell
    }
    
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAIN KEYBOARD VIEW
    //----------------------------------------------------------------
    
    
    var mainKeyboardMenu = Controls().theView()
    var mainKeyboardTopView = Controls().theView()
    var mainKeyboardContainerView = Controls().theView()
    var mainKeyboardViewBackBtn = Controls().theImageButton(imageName: "left_image")
    var mainKeyboardViewLabel = Controls().theLabel(title: "Choose a transaction type", fontSize: 20)
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CREATE BANK LIST ARRAY
    //----------------------------------------------------------------
    
    func createBankArray() -> [BankListModel] {
        
        var bankCell = [BankListModel]()
        
        let bankCell1 = BankListModel(bankName: "AFC", bankCode: "AFCNZWHA")
        let bankCell2 = BankListModel(bankName: "AGRIBANK", bankCode: "AGRZZWHA")
        let bankCell3 = BankListModel(bankName: "BANC ABC", bankCode: "FMBZZWHX")
        let bankCell4 = BankListModel(bankName: "BARCLAYS", bankCode: "BARCZWHX")
        let bankCell5 = BankListModel(bankName: "CABS", bankCode: "CABSZWHA")
        let bankCell6 = BankListModel(bankName: "CBZ", bankCode: "COBZZWHA")
        let bankCell7 = BankListModel(bankName: "ECOBANK", bankCode: "ECOCZWHX")
        let bankCell8 = BankListModel(bankName: "FBC", bankCode: "FBCPZWHA")
        let bankCell9 = BankListModel(bankName: "IDBZ", bankCode: "ZDBLZWHA")
        let bankCell10 = BankListModel(bankName: "NEDBANK", bankCode: "MBCAZWHX")
        let bankCell11 = BankListModel(bankName: "NBS", bankCode: "NABYZWHA")
        let bankCell12 = BankListModel(bankName: "NMB", bankCode: "NMBLZWHX")
        let bankCell13 = BankListModel(bankName: "POSB", bankCode: "PWSBZWHX")
        let bankCell14 = BankListModel(bankName: "STANBIC BANK", bankCode: "SBICZWHX")
        let bankCell15 = BankListModel(bankName: "STANDARD CHARTERED", bankCode: "SCBLZWHX")
        let bankCell16 = BankListModel(bankName: "NEDBANK", bankCode: "MBCAZWHX")
        let bankCell17 = BankListModel(bankName: "NBS", bankCode: "NABYZWHA")
        let bankCell18 = BankListModel(bankName: "NMB", bankCode: "NMBLZWHX")
        let bankCell19 = BankListModel(bankName: "POSB", bankCode: "PWSBZWHX")
        let bankCell20 = BankListModel(bankName: "STANBIC BANK", bankCode: "SBICZWHX")
        let bankCell21 = BankListModel(bankName: "ZB", bankCode: "ZBCOZWHX")
        
        
        bankCell.append(bankCell1)
        bankCell.append(bankCell2)
        bankCell.append(bankCell3)
        bankCell.append(bankCell4)
        bankCell.append(bankCell5)
        bankCell.append(bankCell6)
        bankCell.append(bankCell7)
        bankCell.append(bankCell8)
        bankCell.append(bankCell9)
        bankCell.append(bankCell10)
        bankCell.append(bankCell11)
        bankCell.append(bankCell12)
        bankCell.append(bankCell13)
        bankCell.append(bankCell14)
        bankCell.append(bankCell15)
        bankCell.append(bankCell16)
        bankCell.append(bankCell17)
        bankCell.append(bankCell18)
        bankCell.append(bankCell19)
        bankCell.append(bankCell20)
        bankCell.append(bankCell21)

        
        return bankCell
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAIN KEYBOARD OUTLETS
    //----------------------------------------------------------------
    
//    @IBOutlet var mainKeyboardMenu: UIView!
    @IBOutlet weak var airtimeTileOutlet: UIViewX!
    @IBOutlet weak var billPaymentTileOutlet: UIViewX!
    @IBOutlet weak var zipitTileOutlet: UIViewX!
    @IBOutlet weak var payMerchantTileOutlet: UIViewX!
    @IBOutlet weak var rtgsTileOutlet: UIViewX!
    @IBOutlet weak var internalTransferTileOutlet: UIViewX!
    
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME MAIN VIEW
    //----------------------------------------------------------------
    
//  @IBOutlet var airtimeView: UIView!
    
    var airtimeView = Controls().theView()
    var airtimeBackBtn = Controls().theImageButton(imageName: "left_image")
    var airtimeRightBtn = Controls().theImageButton(imageName: "right_image")
    var airtimeNumberTextField = Controls().theLabel(title: "0771222254", fontSize: 14.0)
    var airtimeChangeKeyboardBtn = Controls().theImageButton(imageName: "gray_keyboard")
    var airtimePayeeLabel = Controls().theLabel(title: "Enter Phonenumber", fontSize: 14)
    var airtimeViewOptionsView = Controls().theView()
    var airtimeKeyboardView = Controls().theView()
    var airtimeAccessoryView = Controls().theView()
    var airtimeEconetButton = Controls().theImageView(imageName: "econet_image_btn")
    var airtimeNetoneButton = Controls().theImageView(imageName: "netone_image_btn")
    var airtimeTelecelButton = Controls().theImageView(imageName: "telecel_image_btn")
    var airtimeOneButton = Controls().theButton(title: "1")
    var airtimeTwoButton = Controls().theButton(title: "2")
    var airtimeThreeButton = Controls().theButton(title: "3")
    var airtimeFourButton = Controls().theButton(title: "4")
    var airtimeFiveButton = Controls().theButton(title: "5")
    var airtimeSixButton = Controls().theButton(title: "6")
    var airtimeSevenButton = Controls().theButton(title: "7")
    var airtimeEightButton = Controls().theButton(title: "8")
    var airtimeNineButton = Controls().theButton(title: "9")
    var airtimeZeroButton = Controls().theButton(title: "0")
    var airtimeDecimalButton = Controls().theButton(title: ".")
    var airtimeDeleteButton = Controls().theButtonWithImage(radius: 3, img: "backspace_arrow", backgroundColor: Theme.WhitePrimary!)
    
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME AMOUNT VIEW CONTROLS / OUTLETS
    //----------------------------------------------------------------
    
    var airtimeAmountView = Controls().theView()
    var airtimeAmountViewTopContainer = Controls().theView()
    var airtimeAmountViewKeyboardContainer = Controls().theView()
    var airtimeAmountTopContainerLabel = Controls().theLabel(title: "Enter the amount you wish to send", fontSize: 14)
    var airtimeAmountViewBackBtn = Controls().theImageButton(imageName: "left_image")
    var airtimeAmountViewRightBtn = Controls().theImageButton(imageName: "right_image")
    var airtimeAmountViewAmountTextField = Controls().theLabel(title: "", fontSize: 16)
    var airtimeAmountViewOneButton = Controls().theButton(title: "1")
    var airtimeAmountViewTwoButton = Controls().theButton(title: "2")
    var airtimeAmountViewThreeButton = Controls().theButton(title: "3")
    var airtimeAmountViewFourButton = Controls().theButton(title: "4")
    var airtimeAmountViewFiveButton = Controls().theButton(title: "5")
    var airtimeAmountViewSixButton = Controls().theButton(title: "6")
    var airtimeAmountViewSevenButton = Controls().theButton(title: "7")
    var airtimeAmountViewEightButton = Controls().theButton(title: "8")
    var airtimeAmountViewNineButton = Controls().theButton(title: "9")
    var airtimeAmountViewZeroButton = Controls().theButton(title: "0")
    var airtimeAmountViewDecimalButton = Controls().theButton(title: ".")
    var airtimeAmountViewDeleteButton = Controls().theButton(title: "C")
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME PAYMENT OPTIONS CONTROLS / OUTLETS
    //----------------------------------------------------------------
    
    var airtimePaymentOptionsView = Controls().theView()
    var airtimePaymentOptionsViewTopContainer = Controls().theView()
    var airtimePayementOptionsBackBnt = Controls().theImageButton(imageName: "left_image")
    var airtimePaymentOptionsLabel = Controls().theLabel(title: "Choose Your Payment Channel", fontSize: 14)
    var airtimePaymentOptionsEcocashView = Controls().theView()
    var airtimePaymentOptionsTelecashView = Controls().theView()
    var airtimePaymentOptionsOneMoneyView = Controls().theView()
    var airtimePaymentOptionsZimSwitchView = Controls().theView()
    var airtimePaymentOptionsStewardView = Controls().theView()
    var airtimePaymentOptionsModifyPaymentChannelsView = Controls().theView()
    var airtimePaymentOptionsEcocashImgView = Controls().theImageView(imageName: "econet_image_btn")
    var airtimePaymentOptionsTelecashImgView = Controls().theImageView(imageName: "telecel_image_btn")
    var airtimePaymentsOptionsOneMoneyImgView = Controls().theImageView(imageName: "netone_image_btn")
    var airtimePaymentsOptionsZimSwitchImgView = Controls().theImageView(imageName: "zimswitch")
    var airtimePaymentsOptionsStewardImgView = Controls().theImageView(imageName: "stewardbank")

    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME PIN VIEW CONTROLS / OUTLETS
    //----------------------------------------------------------------
    
    var airtimePinView = Controls().theView()
    var airtimePinViewTopContainer = Controls().theView()
    var airtimePinViewKeyboardContainer = Controls().theView()
    var airtimePinViewBackBtn = Controls().theImageButton(imageName: "left_image")
    var airtimePinViewRightBtn = Controls().theImageButton(imageName: "right_image")
    var airtimePinLabel = Controls().theLabel(title: "Enter your pin", fontSize: 14)
    var airtimePinP1Label = Controls().theLabel(title: "", fontSize: 32)
    var airtimePinP2Label = Controls().theLabel(title: "", fontSize: 32)
    var airtimePinP3Label = Controls().theLabel(title: "", fontSize: 32)
    var airtimePinP4Label = Controls().theLabel(title: "", fontSize: 32)
    var airtimePinViewOneButton = Controls().theButton(title: "1")
    var airtimePinViewTwoButton = Controls().theButton(title: "2")
    var airtimePinViewThreeButton = Controls().theButton(title: "3")
    var airtimePinViewFourButton = Controls().theButton(title: "4")
    var airtimePinViewFiveButton = Controls().theButton(title: "5")
    var airtimePinViewSixButton = Controls().theButton(title: "6")
    var airtimePinViewSevenButton = Controls().theButton(title: "7")
    var airtimePinViewEightButton = Controls().theButton(title: "8")
    var airtimePinViewNineButton = Controls().theButton(title: "9")
    var airtimePinViewZeroButton = Controls().theButton(title: "0")
    var airtimePinViewDecimalButton = Controls().theButton(title: ".")
    var airtimePinViewDeleteButton = Controls().theButton(title: "C")
    
    //----------------------------------------------------------------
    
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS MAIN VIEW CONTROLS / OUTLETS
    //----------------------------------------------------------------
    
    var billpaymentsMainView = Controls().theView()
    var billpaymentsMainViewTopContainer = Controls().theView()
    var billpaymentsMainViewKeyboardContainer = Controls().theView()
    var billpaymentMainViewBillerList = Controls().theView()
    var billpaymentsMainViewTopContainerLabel = Controls().theLabel(title: "Enter the amount you wish to send", fontSize: 14)
    var billpaymentsMainViewBackBtn = Controls().theImageButton(imageName: "left_image")
    var billpaymentsMainViewRightBtn = Controls().theImageButton(imageName: "right_image")
    var billpaymentsMainViewAmountTextField = Controls().theLabel(title: "Type your bill account number", fontSize: 16)
    var billpaymentsMainBillerLabel = Controls().theLabel(title: "Choose a Bill Provider", fontSize: 13)
    var billpaymentsMainViewOneButton = Controls().theButton(title: "1")
    var billpaymentsMainViewTwoButton = Controls().theButton(title: "2")
    var billpaymentsMainViewThreeButton = Controls().theButton(title: "3")
    var billpaymentsMainViewFourButton = Controls().theButton(title: "4")
    var billpaymentsMainViewFiveButton = Controls().theButton(title: "5")
    var billpaymentsMainViewSixButton = Controls().theButton(title: "6")
    var billpaymentsMainViewSevenButton = Controls().theButton(title: "7")
    var billpaymentsMainViewEightButton = Controls().theButton(title: "8")
    var billpaymentsMainViewNineButton = Controls().theButton(title: "9")
    var billpaymentsMainViewZeroButton = Controls().theButton(title: "0")
    var billpaymentsMainViewDecimalButton = Controls().theButton(title: ".")
    var billpaymentsMainViewDeleteButton = Controls().theButtonWithImage(radius: 3, img: "backspace_arrow", backgroundColor: Theme.WhitePrimary!)
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BIIL PAYMENT AMOUNT VIEW CONTROLS / OUTLETS
    //----------------------------------------------------------------
    
    var billPaymentsAmountView = Controls().theView()
    var billPaymentsTopContainer = Controls().theView()
    var billPaymentsKeyboardContainer = Controls().theView()
    var billPaymentsTopContainerLabel = Controls().theLabel(title: "How much do you want to pay?", fontSize: 14)
    var billPaymentsAmountBackBtn = Controls().theImageButton(imageName: "left_image")
    var billPaymentsAmountRightBtn = Controls().theImageButton(imageName: "right_image")
    var billPaymentsAmountTextField = Controls().theLabel(title: "", fontSize: 18)
    var billPaymentsAmountOneButton = Controls().theButton(title: "1")
    var billPaymentsAmountTwoButton = Controls().theButton(title: "2")
    var billPaymentsAmountThreeButton = Controls().theButton(title: "3")
    var billPaymentsAmountFourButton = Controls().theButton(title: "4")
    var billPaymentsAmountFiveButton = Controls().theButton(title: "5")
    var billPaymentsAmountSixButton = Controls().theButton(title: "6")
    var billPaymentsAmountSevenButton = Controls().theButton(title: "7")
    var billPaymentsAmountEightButton = Controls().theButton(title: "8")
    var billPaymentsAmountNineButton = Controls().theButton(title: "9")
    var billPaymentsAmountZeroButton = Controls().theButton(title: "0")
    var billPaymentsAmountDecimalButton = Controls().theButton(title: ".")
    var billPaymentsAmountDeleteButton = Controls().theButtonWithImage(radius: 3, img: "backspace_arrow", backgroundColor: Theme.WhitePrimary!)
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS PAYMENTS OPTIONS CONTROLS / OUTLET
    //----------------------------------------------------------------
    
    var billPaymentOptionsView = Controls().theView()
    var billPaymentsOptionBackBtn = Controls().theImageButton(imageName: "left_image")
    var billPaymentsOptionLabel = Controls().theLabel(title: "Choose a Payment Option", fontSize: 20)
    var billPaymentOptionContainerView = Controls().theView()
    var billPaymentOptionsEcocash = Controls().theImageView(imageName: "econet_image_btn")
    var billPaymentOptionsStewardBank = Controls().theImageView(imageName: "stewardbank")
    var billPaymentOptionsZimSwitch = Controls().theImageView(imageName: "zimswitch")

    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENT ZIMSWITCH PAN VIEW CONTROLS / OUTLETS
    //----------------------------------------------------------------
    
    var billPaymentZimSwitchPanView = Controls().theView()
    var billPaymentZimSwitchPanTopContainer = Controls().theView()
    var billPaymentZimSwitchPanKeyboardContainer = Controls().theView()
    var billPaymentZimSwitchPanTopContainerLabel = Controls().theLabel(title: "Enter your full Zimswitch card number", fontSize: 14)
    var billPaymentZimSwitchPanBackBtn = Controls().theImageButton(imageName: "left_image")
    var billPaymentZimSwitchPanRightBtn = Controls().theImageButton(imageName: "right_image")
    var billPaymentZimSwitchPanTextField = Controls().theLabel(title: "", fontSize: 16)
    var billPaymentZimSwitchPanOneButton = Controls().theButton(title: "1")
    var billPaymentZimSwitchPanTwoButton = Controls().theButton(title: "2")
    var billPaymentZimSwitchPanThreeButton = Controls().theButton(title: "3")
    var billPaymentZimSwitchPanFourButton = Controls().theButton(title: "4")
    var billPaymentZimSwitchPanFiveButton = Controls().theButton(title: "5")
    var billPaymentZimSwitchPanSixButton = Controls().theButton(title: "6")
    var billPaymentZimSwitchPanSevenButton = Controls().theButton(title: "7")
    var billPaymentZimSwitchPanEightButton = Controls().theButton(title: "8")
    var billPaymentZimSwitchPanNineButton = Controls().theButton(title: "9")
    var billPaymentZimSwitchPanZeroButton = Controls().theButton(title: "0")
    var billPaymentZimSwitchPanDecimalButton = Controls().theButton(title: ".")
    var billPaymentZimSwitchPanDeleteButton = Controls().theButtonWithImage(radius: 3, img: "backspace_arrow", backgroundColor: Theme.WhitePrimary!)
    
    //----------------------------------------------------------------
    

    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILLPAYMENTS PIN VIEW CONTROLS / OUTLETS
    //----------------------------------------------------------------
    
    var billPaymentsPinView = Controls().theView()
    var billPaymentsPinTopContainer = Controls().theView()
    var billPaymentsPinKeyboardContainer = Controls().theView()
    var billPaymentsPinBackBtn = Controls().theImageButton(imageName: "left_image")
    var billPaymentsPinRightBtn = Controls().theImageButton(imageName: "right_image")
    var billPaymentsPinLabel = Controls().theLabel(title: "Enter your pin", fontSize: 14)
    var billPaymentsPinP1Label = Controls().theLabel(title: "", fontSize: 32)
    var billPaymentsPinP2Label = Controls().theLabel(title: "", fontSize: 32)
    var billPaymentsPinP3Label = Controls().theLabel(title: "", fontSize: 32)
    var billPaymentsPinP4Label = Controls().theLabel(title: "", fontSize: 32)
    var billPaymentsPinOneButton = Controls().theButton(title: "1")
    var billPaymentsPinTwoButton = Controls().theButton(title: "2")
    var billPaymentsPinThreeButton = Controls().theButton(title: "3")
    var billPaymentsPinFourButton = Controls().theButton(title: "4")
    var billPaymentsPinFiveButton = Controls().theButton(title: "5")
    var billPaymentsPinSixButton = Controls().theButton(title: "6")
    var billPaymentsPinSevenButton = Controls().theButton(title: "7")
    var billPaymentsPinEightButton = Controls().theButton(title: "8")
    var billPaymentsPinNineButton = Controls().theButton(title: "9")
    var billPaymentsPinZeroButton = Controls().theButton(title: "0")
    var billPaymentsPinDecimalButton = Controls().theButton(title: ".")
    var billPaymentsPinDeleteButton = Controls().theButtonWithImage(radius: 3, img: "backspace_arrow", backgroundColor: Theme.WhitePrimary!)
    
    //----------------------------------------------------------------
    
 
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT MAIN VIEW CONTROLS / OUTLETS
    //----------------------------------------------------------------
    
    var ZIPITMainViewView = Controls().theView()
    var ZIPITMainViewTopView = Controls().theView()
    var ZIPITSearchLabel = Controls().theLabel(title: "Search Payee", fontSize: 14)
    var ZIPITMainViewKeyboardContainer = Controls().theView()
    var ZIPITBanksList = Controls().theView()
    var ZIPITMainViewBackBtn = Controls().theImageButton(imageName: "left_image")
    var ZIPITMainViewRightBtn = Controls().theImageButton(imageName: "right_image")
    var ZIPITMainViewAccountTextField = Controls().theLabel(title: "Type the recipient account number", fontSize: 13)
    var ZIPITMainBankNameLabel = Controls().theLabel(title: "Destination Bank", fontSize: 13)
    var ZIPITViewOneButton = Controls().theButton(title: "1")
    var ZIPITViewTwoButton = Controls().theButton(title: "2")
    var ZIPITViewThreeButton = Controls().theButton(title: "3")
    var ZIPITViewFourButton = Controls().theButton(title: "4")
    var ZIPITViewFiveButton = Controls().theButton(title: "5")
    var ZIPITViewSixButton = Controls().theButton(title: "6")
    var ZIPITViewSevenButton = Controls().theButton(title: "7")
    var ZIPITViewEightButton = Controls().theButton(title: "8")
    var ZIPITViewNineButton = Controls().theButton(title: "9")
    var ZIPITViewZeroButton = Controls().theButton(title: "0")
    var ZIPITViewDecimalButton = Controls().theButton(title: ".")
    var ZIPITViewDeleteButton = Controls().theButtonWithImage(radius: 3, img: "backspace_arrow", backgroundColor: Theme.WhitePrimary!)
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT PAYMENTS OPTIONS CONTROLS / OUTLET
    //----------------------------------------------------------------
    
    var ZIPITPaymentOptionsView = Controls().theView()
    var ZIPITPaymentsOptionBackBtn = Controls().theImageButton(imageName: "left_image")
    var ZIPITPaymentsOptionLabel = Controls().theLabel(title: "Choose a Payment Option", fontSize: 20)
    var ZIPITPaymentOptionContainerView = Controls().theView()
    var ZIPITPaymentOptionsEcocash = Controls().theImageView(imageName: "econet_image_btn")
    var ZIPITPaymentOptionsStewardBank = Controls().theImageView(imageName: "stewardbank")
    var ZIPITPaymentOptionsZimSwitch = Controls().theImageView(imageName: "zimswitch")
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ECOCASH PAYMENTS OPTIONS CONTROLS / OUTLET
    //----------------------------------------------------------------
    
    var AirtimePaymentAirtimeOptionsView = Controls().theView()
    var AirtimePaymentsOptionBackBtn = Controls().theImageButton(imageName: "left_image")
    var AirtimePaymentsOptionLabel = Controls().theLabel(title: "Choose a Payment Option", fontSize: 20)
    var AirtimePaymentOptionContainerView = Controls().theView()
    var AirtimePaymentOptionsEcocash = Controls().theImageView(imageName: "econet_image_btn")
    var AirtimePaymentOptionsStewardBank = Controls().theImageView(imageName: "stewardbank")
    var AirtimePaymentOptionsZimSwitch = Controls().theImageView(imageName: "zimswitch")
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT ZIMSWITCH PAN VIEW CONTROLS / OUTLETS
    //----------------------------------------------------------------
    
    var ZIPITPanView = Controls().theView()
    var ZIPITPanTopContainer = Controls().theView()
    var ZIPITPanKeyboardContainer = Controls().theView()
    var ZIPITPanTopContainerLabel = Controls().theLabel(title: "Enter your full Zimswitch card number", fontSize: 14)
    var ZIPITPanBackBtn = Controls().theImageButton(imageName: "left_image")
    var ZIPITPanRightBtn = Controls().theImageButton(imageName: "right_image")
    var ZIPITPanTextField = Controls().theLabel(title: "", fontSize: 16)
    var ZIPITPanOneButton = Controls().theButton(title: "1")
    var ZIPITPanTwoButton = Controls().theButton(title: "2")
    var ZIPITPanThreeButton = Controls().theButton(title: "3")
    var ZIPITPanFourButton = Controls().theButton(title: "4")
    var ZIPITPanFiveButton = Controls().theButton(title: "5")
    var ZIPITPanSixButton = Controls().theButton(title: "6")
    var ZIPITPanSevenButton = Controls().theButton(title: "7")
    var ZIPITPanEightButton = Controls().theButton(title: "8")
    var ZIPITPanNineButton = Controls().theButton(title: "9")
    var ZIPITPanZeroButton = Controls().theButton(title: "0")
    var ZIPITPanDecimalButton = Controls().theButton(title: ".")
    var ZIPITPanDeleteButton = Controls().theButtonWithImage(radius: 3, img: "backspace_arrow", backgroundColor: UIColor.white)
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT PIN VIEW CONTROLS / OUTLETS
    //----------------------------------------------------------------
    
    var ZIPITPinView = Controls().theView()
    var ZIPITPinTopContainer = Controls().theView()
    var ZIPITPinKeyboardContainer = Controls().theView()
    var ZIPITPinBackBtn = Controls().theImageButton(imageName: "left_image")
    var ZIPITPinRightBtn = Controls().theImageButton(imageName: "right_image")
    var ZIPITPinLabel = Controls().theLabel(title: "Enter your pin", fontSize: 14)
    var ZIPITPinP1Label = Controls().theLabel(title: "", fontSize: 32)
    var ZIPITPinP2Label = Controls().theLabel(title: "", fontSize: 32)
    var ZIPITPinP3Label = Controls().theLabel(title: "", fontSize: 32)
    var ZIPITPinP4Label = Controls().theLabel(title: "", fontSize: 32)
    var ZIPITPinOneButton = Controls().theButton(title: "1")
    var ZIPITPinTwoButton = Controls().theButton(title: "2")
    var ZIPITPinThreeButton = Controls().theButton(title: "3")
    var ZIPITPinFourButton = Controls().theButton(title: "4")
    var ZIPITPinFiveButton = Controls().theButton(title: "5")
    var ZIPITPinSixButton = Controls().theButton(title: "6")
    var ZIPITPinSevenButton = Controls().theButton(title: "7")
    var ZIPITPinEightButton = Controls().theButton(title: "8")
    var ZIPITPinNineButton = Controls().theButton(title: "9")
    var ZIPITPinZeroButton = Controls().theButton(title: "0")
    var ZIPITPinDecimalButton = Controls().theButton(title: ".")
    var ZIPITPinDeleteButton = Controls().theButton(title: "C")
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT AMOUNT VIEW CONTROLS / OUTLETS
    //----------------------------------------------------------------
    
    var ZIPITAmountView = Controls().theView()
    var ZIPITAmountTopContainer = Controls().theView()
    var ZIPITAmountKeyboardContainer = Controls().theView()
    var ZIPITAmountTopContainerLabel = Controls().theLabel(title: "How much do you want to pay?", fontSize: 14)
    var ZIPITAmountBackBtn = Controls().theImageButton(imageName: "left_image")
    var ZIPITAmountRightBtn = Controls().theImageButton(imageName: "right_image")
    var ZIPITAmountTextField = Controls().theLabel(title: "", fontSize: 16)
    var ZIPITAmountOneButton = Controls().theButton(title: "1")
    var ZIPITAmountTwoButton = Controls().theButton(title: "2")
    var ZIPITAmountThreeButton = Controls().theButton(title: "3")
    var ZIPITAmountFourButton = Controls().theButton(title: "4")
    var ZIPITAmountFiveButton = Controls().theButton(title: "5")
    var ZIPITAmountSixButton = Controls().theButton(title: "6")
    var ZIPITAmountSevenButton = Controls().theButton(title: "7")
    var ZIPITAmountEightButton = Controls().theButton(title: "8")
    var ZIPITAmountNineButton = Controls().theButton(title: "9")
    var ZIPITAmountZeroButton = Controls().theButton(title: "0")
    var ZIPITAmountDecimalButton = Controls().theButton(title: ".")
    var ZIPITAmountDeleteButton = Controls().theButtonWithImage(radius: 3, img: "backspace_arrow", backgroundColor: UIColor.white)
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS MAIN VIEW CONTROLS / OUTLETS
    //----------------------------------------------------------------
    
    var RTGSMainViewView = Controls().theView()
    var RTGSMainViewTopView = Controls().theView()
    var RTGSMainSearchLabel = Controls().theLabel(title: "Search Payee", fontSize: 14)
    var RTGSMainViewKeyboardContainer = Controls().theView()
    var RTGSMainBanksList = Controls().theView()
    var RTGSMainViewBackBtn = Controls().theImageButton(imageName: "left_image")
    var RTGSMainViewRightBtn = Controls().theImageButton(imageName: "right_image")
    var RTGSMainViewAccountTextField = Controls().theLabel(title: "Type the recipient account number", fontSize: 13)
    var RTGSMainBankNameLabel = Controls().theLabel(title: "Destination Bank", fontSize: 13)
    var RTGSMainViewOneButton = Controls().theButton(title: "1")
    var RTGSMainViewTwoButton = Controls().theButton(title: "2")
    var RTGSMainViewThreeButton = Controls().theButton(title: "3")
    var RTGSMainViewFourButton = Controls().theButton(title: "4")
    var RTGSMainViewFiveButton = Controls().theButton(title: "5")
    var RTGSMainViewSixButton = Controls().theButton(title: "6")
    var RTGSMainViewSevenButton = Controls().theButton(title: "7")
    var RTGSMainViewEightButton = Controls().theButton(title: "8")
    var RTGSMainViewNineButton = Controls().theButton(title: "9")
    var RTGSMainViewZeroButton = Controls().theButton(title: "0")
    var RTGSMainViewDecimalButton = Controls().theButton(title: ".")
    var RTGSMainViewDeleteButton = Controls().theButton(title: "C")
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS AMOUNT VIEW CONTROLS / OUTLETS
    //----------------------------------------------------------------
    
    var RTGSAmountView = Controls().theView()
    var RTGSAmountTopContainer = Controls().theView()
    var RTGSAmountKeyboardContainer = Controls().theView()
    var RTGSAmountTopContainerLabel = Controls().theLabel(title: "How much do you want to pay?", fontSize: 14)
    var RTGSAmountBackBtn = Controls().theImageButton(imageName: "left_image")
    var RTGSAmountRightBtn = Controls().theImageButton(imageName: "right_image")
    var RTGSAmountTextField = Controls().theLabel(title: "", fontSize: 16)
    var RTGSAmountOneButton = Controls().theButton(title: "1")
    var RTGSAmountTwoButton = Controls().theButton(title: "2")
    var RTGSAmountThreeButton = Controls().theButton(title: "3")
    var RTGSAmountFourButton = Controls().theButton(title: "4")
    var RTGSAmountFiveButton = Controls().theButton(title: "5")
    var RTGSAmountSixButton = Controls().theButton(title: "6")
    var RTGSAmountSevenButton = Controls().theButton(title: "7")
    var RTGSAmountEightButton = Controls().theButton(title: "8")
    var RTGSAmountNineButton = Controls().theButton(title: "9")
    var RTGSAmountZeroButton = Controls().theButton(title: "0")
    var RTGSAmountDecimalButton = Controls().theButton(title: ".")
    var RTGSAmountDeleteButton = Controls().theButton(title: "C")
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS PAYMENTS OPTIONS CONTROLS / OUTLET
    //----------------------------------------------------------------
    
    var RTGSPaymentOptionsView = Controls().theView()
    var RTGSPaymentsOptionBackBtn = Controls().theImageButton(imageName: "left_image")
    var RTGSPaymentsOptionLabel = Controls().theLabel(title: "Choose a Payment Option", fontSize: 20)
    var RTGSPaymentOptionContainerView = Controls().theView()
    var RTGSPaymentOptionsEcocash = Controls().theImageView(imageName: "econet_image_btn")
    var RTGSPaymentOptionsStewardBank = Controls().theImageView(imageName: "stewardbank")
    var RTGSPaymentOptionsZimSwitch = Controls().theImageView(imageName: "zimswitch")
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS ZIMSWITCH PAN VIEW CONTROLS / OUTLETS
    //----------------------------------------------------------------
    
    var RTGSPanView = Controls().theView()
    var RTGSPanTopContainer = Controls().theView()
    var RTGSPanKeyboardContainer = Controls().theView()
    var RTGSPanTopContainerLabel = Controls().theLabel(title: "Enter your full Zimswitch card number", fontSize: 14)
    var RTGSPanBackBtn = Controls().theImageButton(imageName: "left_image")
    var RTGSPanRightBtn = Controls().theImageButton(imageName: "right_image")
    var RTGSPanTextField = Controls().theLabel(title: "", fontSize: 16)
    var RTGSPanOneButton = Controls().theButton(title: "1")
    var RTGSPanTwoButton = Controls().theButton(title: "2")
    var RTGSPanThreeButton = Controls().theButton(title: "3")
    var RTGSPanFourButton = Controls().theButton(title: "4")
    var RTGSPanFiveButton = Controls().theButton(title: "5")
    var RTGSPanSixButton = Controls().theButton(title: "6")
    var RTGSPanSevenButton = Controls().theButton(title: "7")
    var RTGSPanEightButton = Controls().theButton(title: "8")
    var RTGSPanNineButton = Controls().theButton(title: "9")
    var RTGSPanZeroButton = Controls().theButton(title: "0")
    var RTGSPanDecimalButton = Controls().theButton(title: ".")
    var RTGSPanDeleteButton = Controls().theButton(title: "C")
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS PIN VIEW CONTROLS / OUTLETS
    //----------------------------------------------------------------
    
    var RTGSPinView = Controls().theView()
    var RTGSPinTopContainer = Controls().theView()
    var RTGSPinKeyboardContainer = Controls().theView()
    var RTGSPinBackBtn = Controls().theImageButton(imageName: "left_image")
    var RTGSPinRightBtn = Controls().theImageButton(imageName: "right_image")
    var RTGSPinLabel = Controls().theLabel(title: "Enter your pin", fontSize: 14)
    var RTGSPinP1Label = Controls().theLabel(title: "", fontSize: 32)
    var RTGSPinP2Label = Controls().theLabel(title: "", fontSize: 32)
    var RTGSPinP3Label = Controls().theLabel(title: "", fontSize: 32)
    var RTGSPinP4Label = Controls().theLabel(title: "", fontSize: 32)
    var RTGSPinOneButton = Controls().theButton(title: "1")
    var RTGSPinTwoButton = Controls().theButton(title: "2")
    var RTGSPinThreeButton = Controls().theButton(title: "3")
    var RTGSPinFourButton = Controls().theButton(title: "4")
    var RTGSPinFiveButton = Controls().theButton(title: "5")
    var RTGSPinSixButton = Controls().theButton(title: "6")
    var RTGSPinSevenButton = Controls().theButton(title: "7")
    var RTGSPinEightButton = Controls().theButton(title: "8")
    var RTGSPinNineButton = Controls().theButton(title: "9")
    var RTGSPinZeroButton = Controls().theButton(title: "0")
    var RTGSPinDecimalButton = Controls().theButton(title: ".")
    var RTGSPinDeleteButton = Controls().theButton(title: "C")
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BALANCE ENQUIRY OPTIONS CONTROLS / OUTLET
    //----------------------------------------------------------------
    
    var balanceEquiryMainViewView = Controls().theView()
    var balanceEquiryMainViewBackBtn = Controls().theImageButton(imageName: "left_image")
    var balanceEquiryMainViewLabel = Controls().theLabel(title: "Choose a Payment Option", fontSize: 20)
    var balanceEquiryMainViewContainerView = Controls().theView()
    var balanceEquiryMainViewEcocash = Controls().theImageView(imageName: "econet_image_btn")
    var balanceEquiryMainViewStewardBank = Controls().theImageView(imageName: "stewardbank")
    var balanceEquiryMainViewZimSwitch = Controls().theImageView(imageName: "zimswitch")
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BALANCE ENQUIRY SB OPTION VIEW CONTROLS / OUTLETS
    //----------------------------------------------------------------
    
    var balanceEnquirySBPinView = Controls().theView()
    var balanceEnquirySBPinTopContainer = Controls().theView()
    var balanceEnquirySBPinKeyboardContainer = Controls().theView()
    var balanceEnquirySBPinBackBtn = Controls().theImageButton(imageName: "left_image")
    var balanceEnquirySBPinRightBtn = Controls().theImageButton(imageName: "right_image")
    var balanceEnquirySBPinLabel = Controls().theLabel(title: "Enter your pin", fontSize: 14)
    var balanceEnquirySBPinP1Label = Controls().theLabel(title: "", fontSize: 32)
    var balanceEnquirySBPinP2Label = Controls().theLabel(title: "", fontSize: 32)
    var balanceEnquirySBPinP3Label = Controls().theLabel(title: "", fontSize: 32)
    var balanceEnquirySBPinP4Label = Controls().theLabel(title: "", fontSize: 32)
    var balanceEnquirySBPinOneButton = Controls().theButton(title: "1")
    var balanceEnquirySBPinTwoButton = Controls().theButton(title: "2")
    var balanceEnquirySBPinThreeButton = Controls().theButton(title: "3")
    var balanceEnquirySBPinFourButton = Controls().theButton(title: "4")
    var balanceEnquirySBPinFiveButton = Controls().theButton(title: "5")
    var balanceEnquirySBPinSixButton = Controls().theButton(title: "6")
    var balanceEnquirySBPinSevenButton = Controls().theButton(title: "7")
    var balanceEnquirySBPinEightButton = Controls().theButton(title: "8")
    var balanceEnquirySBPinNineButton = Controls().theButton(title: "9")
    var balanceEnquirySBPinZeroButton = Controls().theButton(title: "0")
    var balanceEnquirySBPinDecimalButton = Controls().theButton(title: ".")
    var balanceEnquirySBPinDeleteButton = Controls().theButton(title: "C")
    
    
    //BALANCE DIALOG OUTLETS
    var balanceFinalDialog = Controls().theView()
    var balanceFinalDialogIcon = Controls().theImageView(imageName: "sosho_icon")
    var balanceFinalDialogLabel = Controls().theLabel(title: "", fontSize: 20)
    var balanceFinalDialogMsgBtn  = Controls().theButton(title: "Send Message")
    var balanceFinalDialogCloseBtn = Controls().theButton(title: "Close")
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BALANCE ENQUIRY ZIMSWITCH PAN VIEW CONTROLS / OUTLETS
    //----------------------------------------------------------------
    
    var balanceEnquiryZSView = Controls().theView()
    var balanceEnquiryZSTopContainer = Controls().theView()
    var balanceEnquiryZSKeyboardContainer = Controls().theView()
    var balanceEnquiryZSTopContainerLabel = Controls().theLabel(title: "Enter your full card number", fontSize: 14)
    var balanceEnquiryZSBackBtn = Controls().theImageButton(imageName: "left_image")
    var balanceEnquiryZSRightBtn = Controls().theImageButton(imageName: "right_image")
    var balanceEnquiryZSTextField = Controls().theLabel(title: "", fontSize: 16)
    var balanceEnquiryZSOneButton = Controls().theButton(title: "1")
    var balanceEnquiryZSTwoButton = Controls().theButton(title: "2")
    var balanceEnquiryZSThreeButton = Controls().theButton(title: "3")
    var balanceEnquiryZSFourButton = Controls().theButton(title: "4")
    var balanceEnquiryZSFiveButton = Controls().theButton(title: "5")
    var balanceEnquiryZSSixButton = Controls().theButton(title: "6")
    var balanceEnquiryZSSevenButton = Controls().theButton(title: "7")
    var balanceEnquiryZSEightButton = Controls().theButton(title: "8")
    var balanceEnquiryZSNineButton = Controls().theButton(title: "9")
    var balanceEnquiryZSZeroButton = Controls().theButton(title: "0")
    var balanceEnquiryZSDecimalButton = Controls().theButton(title: ".")
    var balanceEnquiryZSDeleteButton = Controls().theButton(title: "C")
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BALANCE ENQUIRY ZIMSWITCH PIN OPTION VIEW CONTROLS / OUTLETS
    //----------------------------------------------------------------
    
    var balanceEnquiryZSPinView = Controls().theView()
    var balanceEnquiryZSPinTopContainer = Controls().theView()
    var balanceEnquiryZSPinKeyboardContainer = Controls().theView()
    var balanceEnquiryZSPinBackBtn = Controls().theImageButton(imageName: "left_image")
    var balanceEnquiryZSPinRightBtn = Controls().theImageButton(imageName: "right_image")
    var balanceEnquiryZSPinLabel = Controls().theLabel(title: "Enter your pin", fontSize: 14)
    var balanceEnquiryZSPinP1Label = Controls().theLabel(title: "", fontSize: 32)
    var balanceEnquiryZSPinP2Label = Controls().theLabel(title: "", fontSize: 32)
    var balanceEnquiryZSPinP3Label = Controls().theLabel(title: "", fontSize: 32)
    var balanceEnquiryZSPinP4Label = Controls().theLabel(title: "", fontSize: 32)
    var balanceEnquiryZSPinOneButton = Controls().theButton(title: "1")
    var balanceEnquiryZSPinTwoButton = Controls().theButton(title: "2")
    var balanceEnquiryZSPinThreeButton = Controls().theButton(title: "3")
    var balanceEnquiryZSPinFourButton = Controls().theButton(title: "4")
    var balanceEnquiryZSPinFiveButton = Controls().theButton(title: "5")
    var balanceEnquiryZSPinSixButton = Controls().theButton(title: "6")
    var balanceEnquiryZSPinSevenButton = Controls().theButton(title: "7")
    var balanceEnquiryZSPinEightButton = Controls().theButton(title: "8")
    var balanceEnquiryZSPinNineButton = Controls().theButton(title: "9")
    var balanceEnquiryZSPinZeroButton = Controls().theButton(title: "0")
    var balanceEnquiryZSPinDecimalButton = Controls().theButton(title: ".")
    var balanceEnquiryZSPinDeleteButton = Controls().theButton(title: "C")
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL TRANSFER AMOUNT VIEW CONTROLS / OUTLETS
    //----------------------------------------------------------------
    
    var InternalTransferAccountView = Controls().theView()
    var InternalTransferAccountTopContainer = Controls().theView()
    var InternalTransferAccountKeyboardContainer = Controls().theView()
    var InternalTransferAccountTopContainerLabel = Controls().theLabel(title: "Enter destination account number", fontSize: 14)
    var InternalTransferAccountBackBtn = Controls().theImageButton(imageName: "left_image")
    var InternalTransferAccountRightBtn = Controls().theImageButton(imageName: "right_image")
    var InternalTransferAccountTextField = Controls().theLabel(title: "", fontSize: 16)
    var InternalTransferAccountOneButton = Controls().theButton(title: "1")
    var InternalTransferAccountTwoButton = Controls().theButton(title: "2")
    var InternalTransferAccountThreeButton = Controls().theButton(title: "3")
    var InternalTransferAccountFourButton = Controls().theButton(title: "4")
    var InternalTransferAccountFiveButton = Controls().theButton(title: "5")
    var InternalTransferAccountSixButton = Controls().theButton(title: "6")
    var InternalTransferAccountSevenButton = Controls().theButton(title: "7")
    var InternalTransferAccountEightButton = Controls().theButton(title: "8")
    var InternalTransferAccountNineButton = Controls().theButton(title: "9")
    var InternalTransferAccountZeroButton = Controls().theButton(title: "0")
    var InternalTransferAccountDecimalButton = Controls().theButton(title: ".")
    var InternalTransferAccountDeleteButton = Controls().theButton(title: "C")
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL TRANSFER PIN VIEW CONTROLS / OUTLETS
    //----------------------------------------------------------------
    
    var internalTransferPinView = Controls().theView()
    var internalTransferPinTopContainer = Controls().theView()
    var internalTransferPinKeyboardContainer = Controls().theView()
    var internalTransferPinBackBtn = Controls().theImageButton(imageName: "left_image")
    var internalTransferPinRightBtn = Controls().theImageButton(imageName: "right_image")
    var internalTransferPinLabel = Controls().theLabel(title: "Enter your pin", fontSize: 14)
    var internalTransferPinP1Label = Controls().theLabel(title: "", fontSize: 32)
    var internalTransferPinP2Label = Controls().theLabel(title: "", fontSize: 32)
    var internalTransferPinP3Label = Controls().theLabel(title: "", fontSize: 32)
    var internalTransferPinP4Label = Controls().theLabel(title: "", fontSize: 32)
    var internalTransferPinOneButton = Controls().theButton(title: "1")
    var internalTransferPinTwoButton = Controls().theButton(title: "2")
    var internalTransferPinThreeButton = Controls().theButton(title: "3")
    var internalTransferPinFourButton = Controls().theButton(title: "4")
    var internalTransferPinFiveButton = Controls().theButton(title: "5")
    var internalTransferPinSixButton = Controls().theButton(title: "6")
    var internalTransferPinSevenButton = Controls().theButton(title: "7")
    var internalTransferPinEightButton = Controls().theButton(title: "8")
    var internalTransferPinNineButton = Controls().theButton(title: "9")
    var internalTransferPinZeroButton = Controls().theButton(title: "0")
    var internalTransferPinDecimalButton = Controls().theButton(title: ".")
    var internalTransferPinDeleteButton = Controls().theButton(title: "C")
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL TRANSFER AMOUNT VIEW CONTROLS / OUTLETS
    //----------------------------------------------------------------
    
    var InternalAmountView = Controls().theView()
    var InternalAmountTopContainer = Controls().theView()
    var InternalAmountKeyboardContainer = Controls().theView()
    var InternalAmountTopContainerLabel = Controls().theLabel(title: "How much do you want to send?", fontSize: 14)
    var InternalAmountBackBtn = Controls().theImageButton(imageName: "left_image")
    var InternalAmountRightBtn = Controls().theImageButton(imageName: "right_image")
    var InternalAmountTextField = Controls().theLabel(title: "", fontSize: 16)
    var InternalAmountOneButton = Controls().theButton(title: "1")
    var InternalAmountTwoButton = Controls().theButton(title: "2")
    var InternalAmountThreeButton = Controls().theButton(title: "3")
    var InternalAmountFourButton = Controls().theButton(title: "4")
    var InternalAmountFiveButton = Controls().theButton(title: "5")
    var InternalAmountSixButton = Controls().theButton(title: "6")
    var InternalAmountSevenButton = Controls().theButton(title: "7")
    var InternalAmountEightButton = Controls().theButton(title: "8")
    var InternalAmountNineButton = Controls().theButton(title: "9")
    var InternalAmountZeroButton = Controls().theButton(title: "0")
    var InternalAmountDecimalButton = Controls().theButton(title: ".")
    var InternalAmountDeleteButton = Controls().theButton(title: "C")
    
    //----------------------------------------------------------------
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- NUMERIC KEYBOARS VIEW CONTROLS / OUTLETS
    //----------------------------------------------------------------
    
    var numericKeyboardView = Controls().theView()
    var numericKeyboardTopContainer = Controls().theView()
    var numericKeyboardKeyboardContainer = Controls().theView()
    var numericKeyboardTopContainerLabel = Controls().theLabel(title: "Please wait for the pin prompt.After you have successfully submitted your ecocash pin, click check transaction.", fontSize: 14)
    var numericKeyboardBackBtn = Controls().theImageButton(imageName: "left_image")
    var numericKeyboardRightBtn = Controls().theImageButton(imageName: "right_image")
    var numericKeyboardTextField = Controls().theLabel(title: "", fontSize: 16)
    var numericKeyboardOneButton = Controls().theButton(title: "1")
    var numericKeyboardTwoButton = Controls().theButton(title: "2")
    var numericKeyboardThreeButton = Controls().theButton(title: "3")
    var numericKeyboardFourButton = Controls().theButton(title: "4")
    var numericKeyboardFiveButton = Controls().theButton(title: "5")
    var numericKeyboardSixButton = Controls().theButton(title: "6")
    var numericKeyboardSevenButton = Controls().theButton(title: "7")
    var numericKeyboardEightButton = Controls().theButton(title: "8")
    var numericKeyboardNineButton = Controls().theButton(title: "9")
    var numericKeyboardCheckTransButton = Controls().theButton(title: "CHECK TRANSACTION")
    var numericKeyboardZeroButton = Controls().theButton(title: "0")
    var numericKeyboardDeleteButton = Controls().theButton(title: "C")
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- EXPIRY VIEW CONTROLS / OUTLETS
    //----------------------------------------------------------------
    
    var expiryView = Controls().theView()
    var expiryViewTopContainer = Controls().theView()
    var expiryViewKeyboardContainer = Controls().theView()
    var expiryViewExpiryDateContainer = Controls().theView()
    var expiryViewBackBtn = Controls().theImageButton(imageName: "left_image")
    var expiryViewRightBtn = Controls().theImageButton(imageName: "right_image")
    var expiryLabel = Controls().theLabel(title: "Enter your card expiry date", fontSize: 14)
    var expiryExpiryMonthLabel = Controls().theLabel(title: "", fontSize: 25)
    var expiryExpiryYearLabel = Controls().theLabel(title: "", fontSize: 25)
    var expiryViewOneButton = Controls().theButton(title: "1")
    var expiryViewTwoButton = Controls().theButton(title: "2")
    var expiryViewThreeButton = Controls().theButton(title: "3")
    var expiryViewFourButton = Controls().theButton(title: "4")
    var expiryViewFiveButton = Controls().theButton(title: "5")
    var expiryViewSixButton = Controls().theButton(title: "6")
    var expiryViewSevenButton = Controls().theButton(title: "7")
    var expiryViewEightButton = Controls().theButton(title: "8")
    var expiryViewNineButton = Controls().theButton(title: "9")
    var expiryViewZeroButton = Controls().theButton(title: "0")
    var expiryViewDecimalButton = Controls().theButton(title: ".")
    var expiryViewDeleteButton = Controls().theButton(title: "C")
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CONTACTS VIEW
    //----------------------------------------------------------------
    
    var contactsView = Controls().theView()
    var contactsTopContainer = Controls().theView()
    var contactsTableViewContainerView = Controls().theView()
    var contactsLeftBtn = Controls().theImageButton(imageName: "left_image")
    var contactsRightBtn = Controls().theImageButton(imageName: "right_image")
    var contactTextField = Controls().theLabel(title: "Search", fontSize: 15)

    var isPickedFromContact = false
    var pickedContactPhonenumber = ""
    var pickedContactNetworkProvider = ""
    
    
    
    //----------------------------------------------------------------
    
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- COLLECTION VIEWS OUTLETS
    //----------------------------------------------------------------
    
//    var billPaymentCollectionview: UICollectionView?
    
//    lazy var billPaymentCollectionview : UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
//        cv.translatesAutoresizingMaskIntoConstraints = false
//        cv.delegate = self
//        cv.dataSource = self
//        cv.backgroundColor = .yellow
//        return cv
//    }()
//
    
    //----------------------------------------------------------------
    
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- KEYBOARD NUMBER AND CHARACTER ONE VIEW OUTLETS
    //----------------------------------------------------------------
    
    var keyboardNumberCharecterViewOne = Controls().theView()
    
    
    
    //----------------------------------------------------------------
    
    
    
   
    
    @IBOutlet weak var row1: UIStackView!
    @IBOutlet weak var row2: UIStackView!
    @IBOutlet weak var row3: UIStackView!
    @IBOutlet weak var row4: UIStackView!
    
    
    @IBOutlet weak var shiftButton: UIButton!
    var shiftStatus: Int! //0 - off, 1 - on, 2 caps lock
    
    public var proxy: UITextDocumentProxy {
        
        return textDocumentProxy
    }
    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
        shiftStatus = 1
//        makeKeyboardView()
        
        
        
        
//
//        let height: CGFloat = 400
//        let heightConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: height)
//        self.view.addConstraint(heightConstraint)
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        
//        addTopView()
        
//        billPaymentCollectionview.register(KeyboardViewController.self, forCellWithReuseIdentifier: "billPaymentsCell")
        
//          KeyboardSharedPreferences().setEcocashPaymentStatus(ecocashpaymentstatus: "0")
//        KeyboardSharedPreferences().setAirtimeEcocashPaymentStatus(ecocashPaymentStatus: "0")
//          KeyboardSharedPreferences().setBillPaymentEcocashStatus(billPaymentEcocashStatus: "0")

//        print("ZIPIT ECOCASH STATUS: \(KeyboardSharedPreferences().getEcocashPaymentStatus()!)")
//        print("AIRTIME ECOCASH STATUS: \(KeyboardSharedPreferences().getAirtimeEcocashPaymentStatus()!)")
//          print("BILL PAYMENT ECOCASH STATUS: \(KeyboardSharedPreferences().getBillPaymentEcocashStatus()!)")

        print("Loading Keyboard")
    
        if KeyboardSharedPreferences().getEcocashPaymentStatus() == "1" || KeyboardSharedPreferences().getAirtimeEcocashPaymentStatus() == "1"
         || KeyboardSharedPreferences().getBillPaymentEcocashStatus() == "1" {
            
             makeNumericKeyboardView()
            
        }else {
            
            makeTheKeyBoard()
        }
        
       
//        if GLOBAL_ECOCASH_PAYMENT_OPTION == "1" {
//
//            makeNumericKeyboardView()
//
//        }else {
//
//            view.addSubview(makeMainkeyboardViewRowOne())
//            view.addSubview(makeMainkeyboardViewRowTwo())
//            view.addSubview(makeMainKeyboardRowThree())
//            makeMainKeyboardRowFour()
//
//        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        heightConstraint = NSLayoutConstraint(item:self.view,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 0.0,
                                                  constant: expandedHeight)
        
        self.view.addConstraint(heightConstraint)
        self.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
       
        
        
        let airtimeTileGesture = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.airtimeTilePressed(_:)))
        airtimeTileOutlet.isUserInteractionEnabled = true
        airtimeTileOutlet.addGestureRecognizer(airtimeTileGesture)
        
        
        let ZIPITTileGesture = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.zipitTilePressed(_:)))
        zipitTileOutlet.isUserInteractionEnabled = true
        zipitTileOutlet.addGestureRecognizer(ZIPITTileGesture)
        
       
        
        let billTileGesture = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.billTilePressed(_:)))
        billPaymentTileOutlet.isUserInteractionEnabled = true
        billPaymentTileOutlet.addGestureRecognizer(billTileGesture)
        
        
        let rtgsTileGesture = UITapGestureRecognizer(target: self, action: #selector(KeyboardViewController.rtgsTilePressed(_:)))
        rtgsTileOutlet.isUserInteractionEnabled = true
        rtgsTileOutlet.addGestureRecognizer(rtgsTileGesture)
        
      
        
//
////        if GLOBAL_ECOCASH_PAYMENT_OPTION == "1" {
////
////            makeNumericKeyboardView()
////
////        }
////        else {
//
//            view.addSubview(makeMainkeyboardViewRowOne())
//            view.addSubview(makeMainkeyboardViewRowTwo())
//            view.addSubview(makeMainKeyboardRowThree())
//            makeMainKeyboardRowFour()
////        }

    
        internalTransferTileOutlet.isHidden = true
        rtgsTileOutlet.isHidden = true
       
      
    }
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE MAIN KEYBOARD ROW ONE
    //----------------------------------------------------------------
    
    //Main Keyboard Row 4
    let view4 = Controls().theView()
    
    
    func makeMainkeyboardViewRowOne() -> UIStackView{
        
        let rowHeight = CGFloat(50)
        
        let buttonTitles = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"]
        
        var buttons = [UIButton]()
        
        
        for buttonTitle in buttonTitles {
            
            let button = Controls().theButton(title: buttonTitle)
            button.layer.cornerRadius = 5
            button.backgroundColor = UIColor.white
            button.setTitleColor(UIColor.black, for: .normal)
            button.layer.shadowOpacity = 0.2
            button.layer.shadowColor = UIColor.gray.cgColor
            button.layer.shadowOffset  = CGSize(width: 0, height: 4)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            buttons.append(button)
            
        }
        
        let hStackView = Controls().theHorizontalStackView(buttons: buttons)
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 7
        
        view.addSubview(hStackView)
        
        hStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        hStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 3).isActive = true
        hStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -3).isActive = true
        hStackView.heightAnchor.constraint(equalToConstant: rowHeight).isActive = true
        
        return hStackView
    }
    
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE MAIN KEYBOARD ROW TWO
    //----------------------------------------------------------------
    
    func makeMainkeyboardViewRowTwo() ->UIStackView{

        let rowHeight = CGFloat(50)

        let buttonTitles = ["A", "S", "D", "F", "G", "H", "J", "K", "L"]

        var buttons = [UIButton]()


        for buttonTitle in buttonTitles {

            let button = Controls().theButton(title: buttonTitle)
            button.layer.cornerRadius = 5
            button.backgroundColor = UIColor.white
            button.setTitleColor(UIColor.black, for: .normal)
            button.layer.shadowOpacity = 0.2
            button.layer.shadowColor = UIColor.gray.cgColor
            button.layer.shadowOffset  = CGSize(width: 0, height: 2)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            buttons.append(button)

        }

        let hStackView = Controls().theHorizontalStackView(buttons: buttons)
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 7

        view.addSubview(hStackView)

        hStackView.topAnchor.constraint(equalTo: makeMainkeyboardViewRowOne().bottomAnchor, constant: 14).isActive = true
        hStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 9).isActive = true
        hStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -9).isActive = true
        hStackView.heightAnchor.constraint(equalToConstant: rowHeight).isActive = true
    
        return hStackView
        
    }
    
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE MAIN KEYBOARD ROW THREE
    //----------------------------------------------------------------
    
    func makeMainKeyboardRowThree() -> UIView{
      
        let rowHeight = CGFloat(50)
        
        let theView = Controls().theView()
        theView.layer.cornerRadius = 0
        theView.backgroundColor = UIColor.clear
        
        view.addSubview(theView)
        
        theView.topAnchor.constraint(equalTo: makeMainkeyboardViewRowTwo().bottomAnchor, constant: 14).isActive = true
        theView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 3).isActive = true
        theView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -3).isActive = true
        theView.heightAnchor.constraint(equalToConstant: rowHeight).isActive = true
        
        let buttonTitles = ["Z", "X", "C", "V", "B", "N", "M", "K"]
        
        var buttons = [UIButton]()
        
        
        for buttonTitle in buttonTitles {
            
            let button = Controls().theButton(title: buttonTitle)
            button.layer.cornerRadius = 5
            button.backgroundColor = UIColor.white
            button.setTitleColor(UIColor.black, for: .normal)
           button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            button.layer.shadowOpacity = 0.2
            button.layer.shadowColor = UIColor.gray.cgColor
            button.layer.shadowOffset  = CGSize(width: 0, height: 2)
            button.layer.shadowRadius = 2
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            buttons.append(button)
            
        }
        
        rowThreeHStackView = Controls().theHorizontalStackView(buttons: buttons)
        rowThreeHStackView.axis = .horizontal
        rowThreeHStackView.distribution = .fillEqually
        rowThreeHStackView.spacing = 7
        
        
        
        let shiftBtn = Controls().theButtonWithImage(radius: 5, img: "up-arrow", backgroundColor: Theme.LighterGray!)
        shiftBtn.addTarget(self, action: #selector(shiftBtnPressed), for: .touchUpInside)
        shiftBtn.backgroundColor = UIColor.white
        shiftBtn.layer.shadowOpacity = 0.2
        shiftBtn.layer.shadowColor = UIColor.gray.cgColor
        shiftBtn.layer.shadowOffset  = CGSize(width: 0, height: 4)
       
        
        let backBtn = Controls().theButtonWithImage(radius: 5, img: "backspace", backgroundColor: Theme.LighterGray!)
        backBtn.addTarget(self, action: #selector(keyboardBackSpacePressed), for: .touchUpInside)
        backBtn.backgroundColor = UIColor.white
        backBtn.layer.shadowOpacity = 0.2
        backBtn.layer.shadowColor = UIColor.gray.cgColor
        backBtn.layer.shadowOffset  = CGSize(width: 0, height: 4)
        
        theView.addSubview(shiftBtn)
        theView.addSubview(backBtn)
        theView.addSubview(rowThreeHStackView)
        
        
        shiftBtn.topAnchor.constraint(equalTo: theView.topAnchor, constant: 0).isActive = true
        shiftBtn.leftAnchor.constraint(equalTo: theView.leftAnchor, constant: 0).isActive = true
        shiftBtn.bottomAnchor.constraint(equalTo: theView.bottomAnchor, constant: 0).isActive = true
        shiftBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        backBtn.topAnchor.constraint(equalTo: theView.topAnchor, constant: 0).isActive = true
        backBtn.rightAnchor.constraint(equalTo: theView.rightAnchor, constant: 0).isActive = true
        backBtn.bottomAnchor.constraint(equalTo: theView.bottomAnchor, constant: 0).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        rowThreeHStackView.topAnchor.constraint(equalTo: theView.topAnchor, constant: 0).isActive = true
        rowThreeHStackView.leftAnchor.constraint(equalTo: shiftBtn.rightAnchor, constant: 5).isActive = true
        rowThreeHStackView.rightAnchor.constraint(equalTo: backBtn.leftAnchor, constant: -5).isActive = true
        rowThreeHStackView.bottomAnchor.constraint(equalTo: theView.bottomAnchor, constant: 0).isActive = true
        
        return theView
    
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- Shift btn pressed
    //----------------------------------------------------------------
    
    @objc func shiftBtnPressed(){
        
        shiftStatus = shiftStatus > 0 ? 0 : 1
        
        shiftChange(containerView: makeMainkeyboardViewRowTwo())
        shiftChange(containerView: rowThreeHStackView)
        shiftChange(containerView: makeMainkeyboardViewRowOne())
//        shiftChange(containerView: row4)
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SHOW THE MAIN KEYBOARD
    //----------------------------------------------------------------
    
    func makeTheKeyBoard(){
        
        view.addSubview(makeMainkeyboardViewRowOne())
        view.addSubview(makeMainkeyboardViewRowTwo())
        view.addSubview(makeMainKeyboardRowThree())
        makeMainKeyboardRowFour()
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- REMOVE THE MAIN KEYBOARD VIEW
    //----------------------------------------------------------------
    
    func removeTheKeyboardView(){
        
        makeMainkeyboardViewRowOne().removeFromSuperview()
        makeMainkeyboardViewRowTwo().removeFromSuperview()
        makeMainKeyboardRowThree().removeFromSuperview()
        view4.removeFromSuperview()
        
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAIN KEYBOARD ROW THREE BTN ACTIONS
    //----------------------------------------------------------------
    
    @objc func keyboardBackSpacePressed(){
        
         proxy.deleteBackward()
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE MAIN KEYBOARD ROW FOUR
    //----------------------------------------------------------------
    
    func makeMainKeyboardRowFour() {
        
        //        let rowHeight = CGFloat(view.frame.height / 4)
        let rowWidth = CGFloat(view.frame.width) * (1/10)
        let spaceBtnWidth = CGFloat(view.frame.width) * (4/10)
        
        
//        let view4 = Controls().theView()
        view4.backgroundColor = UIColor.clear
        view4.layer.cornerRadius = 0
        
        view.addSubview(view4)
        
        view4.topAnchor.constraint(equalTo: makeMainKeyboardRowThree().bottomAnchor, constant: 14).isActive = true
        view4.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 3).isActive = true
        view4.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -3).isActive = true
//        view4.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -3).isActive = true
        view4.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let abcBtn = Controls().theButton(title: "123")
        abcBtn.setTitleColor(UIColor.black, for: .normal)
        abcBtn.backgroundColor = UIColor.white
        abcBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        abcBtn.layer.cornerRadius = 5
        
        let spaceBtn = Controls().theButton(title: "space")
        spaceBtn.setTitleColor(UIColor.black, for: .normal)
        spaceBtn.backgroundColor = UIColor.white
        spaceBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        spaceBtn.layer.cornerRadius = 5
        
        let returnBtn = Controls().theButton(title: "Return")
        returnBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        returnBtn.setTitleColor(UIColor.black, for: .normal)
        returnBtn.backgroundColor = UIColor.white
        returnBtn.layer.cornerRadius = 5
        
        
        let smileyBtn = Controls().theButtonWithImage(radius: 5, img: "happiness", backgroundColor: UIColor.white)
//        let microphoneBtn = Controls().theButtonWithImage(radius: 3, img: "microphone", backgroundColor: UIColor.white)
        let sbBtn = Controls().theButtonWithImage(radius: 5, img: "sbkeylogo", backgroundColor: UIColor.white)
        _ = Controls().theButtonWithImage(radius: 5, img: "grid-world", backgroundColor: UIColor.white)
        
        abcBtn.addTarget(self, action: #selector(symbolBtnPressed), for: .touchUpInside)
        spaceBtn.addTarget(self, action: #selector(spaceBtnPressed), for: .touchUpInside)
        returnBtn.addTarget(self, action: #selector(returnBtnPressed), for: .touchUpInside)
        smileyBtn.addTarget(self, action: #selector(smileyBtnPressed), for: .touchUpInside)
        sbBtn.addTarget(self, action: #selector(microphoneBtnPressed), for: .touchUpInside)
        
        
        view4.addSubview(abcBtn)
        view4.addSubview(smileyBtn)
        view4.addSubview(sbBtn)
        view4.addSubview(spaceBtn)
        view4.addSubview(returnBtn)
        
        
        abcBtn.topAnchor.constraint(equalTo: view4.topAnchor, constant: 0).isActive = true
        abcBtn.leftAnchor.constraint(equalTo: view4.leftAnchor, constant: 0).isActive = true
        abcBtn.bottomAnchor.constraint(equalTo: view4.bottomAnchor, constant: 0).isActive = true
        abcBtn.widthAnchor.constraint(equalToConstant: rowWidth).isActive = true
        
        smileyBtn.topAnchor.constraint(equalTo: view4.topAnchor, constant: 0).isActive = true
        smileyBtn.bottomAnchor.constraint(equalTo: view4.bottomAnchor, constant: 0).isActive = true
        smileyBtn.leftAnchor.constraint(equalTo: abcBtn.rightAnchor, constant: 6).isActive = true
        smileyBtn.widthAnchor.constraint(equalToConstant: rowWidth).isActive = true
        
        sbBtn.topAnchor.constraint(equalTo: view4.topAnchor, constant: 0).isActive = true
        sbBtn.bottomAnchor.constraint(equalTo: view4.bottomAnchor, constant: 0).isActive = true
        sbBtn.leftAnchor.constraint(equalTo: smileyBtn.rightAnchor, constant: 6).isActive = true
        sbBtn.widthAnchor.constraint(equalToConstant: rowWidth).isActive = true
        
        spaceBtn.topAnchor.constraint(equalTo: view4.topAnchor, constant: 0).isActive = true
        spaceBtn.bottomAnchor.constraint(equalTo: view4.bottomAnchor, constant: 0).isActive = true
        spaceBtn.leftAnchor.constraint(equalTo: sbBtn.rightAnchor, constant: 6).isActive = true
        spaceBtn.widthAnchor.constraint(equalToConstant: spaceBtnWidth).isActive = true
        
        returnBtn.topAnchor.constraint(equalTo: view4.topAnchor, constant: 0).isActive = true
        returnBtn.bottomAnchor.constraint(equalTo: view4.bottomAnchor, constant: 0).isActive = true
        returnBtn.leftAnchor.constraint(equalTo: spaceBtn.rightAnchor, constant: 6).isActive = true
        returnBtn.rightAnchor.constraint(equalTo: view4.rightAnchor, constant: 0).isActive = true
        
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAIN KEYBOARD ROW FOUR BTN ACTIONS
    //----------------------------------------------------------------
    
    @objc func symbolBtnPressed(){
    
        makeKeyboardNumberCharecterOneView()
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAIN KEYBOARD MENU TILE MENU
    //----------------------------------------------------------------
    
    
    @objc func airtimeTilePressed(_ sender: AnyObject) {
        
        makeAirTimeMainView()
        
    }
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT TILE CLICKED
    //----------------------------------------------------------------
    
    @objc func zipitTilePressed(_ sender: AnyObject){
        
        banksArray = createBankArray()
        print("BILL ARRAY COUNT: \(banksArray.count)")
       
    
        makeZIPITMainView()
        
        let topView: ZIPITCollectionView = {
            
            let tv = ZIPITCollectionView(banksArray: banksArray)
            tv?.translatesAutoresizingMaskIntoConstraints = false
            tv?.delegate = self
            return tv!
            
        }()
        
        ZIPITBanksList.addSubview(topView)
        topView.leadingAnchor.constraint(equalTo: ZIPITBanksList.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: ZIPITBanksList.trailingAnchor).isActive = true
        topView.topAnchor.constraint(equalTo: ZIPITBanksList.topAnchor).isActive = true
        topView.bottomAnchor.constraint(equalTo: ZIPITBanksList.bottomAnchor, constant: -3).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RTGS TILE CLICKED
    //----------------------------------------------------------------
    

    @objc func billTilePressed(_ sender: AnyObject){
        
        billArray = createArray()
        print("BILL ARRAY COUNT \(billArray.count)")
        makeBillPaymentMainView()
    
        let topView: BillCollectionView = {
            let tv = BillCollectionView()
            tv.translatesAutoresizingMaskIntoConstraints = false
            return tv
        }()
        
        billpaymentMainViewBillerList.addSubview(topView)
        topView.leadingAnchor.constraint(equalTo: billpaymentMainViewBillerList.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: billpaymentMainViewBillerList.trailingAnchor).isActive = true
        topView.topAnchor.constraint(equalTo: billpaymentMainViewBillerList.topAnchor, constant: 0).isActive = true
//      topView.widthAnchor.constraint(equalTo: billpaymentMainViewBillerList.widthAnchor).isActive = true
        topView.bottomAnchor.constraint(equalTo: billpaymentMainViewBillerList.bottomAnchor, constant: -3).isActive = true
      
    }
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT TILE CLICKED
    //----------------------------------------------------------------
    
    
    @objc func rtgsTilePressed(_ sender: AnyObject){
        
        makeRTGSMainView()
        
        let topView: RTGSCollectionView = {
            let tv = RTGSCollectionView()
            tv.translatesAutoresizingMaskIntoConstraints = false
            return tv
        }()
        
        RTGSMainBanksList.addSubview(topView)
        topView.leadingAnchor.constraint(equalTo: RTGSMainBanksList.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: RTGSMainBanksList.trailingAnchor).isActive = true
        topView.topAnchor.constraint(equalTo: RTGSMainBanksList.topAnchor, constant: 0).isActive = true
        //      topView.widthAnchor.constraint(equalTo: billpaymentMainViewBillerList.widthAnchor).isActive = true
        topView.bottomAnchor.constraint(equalTo: RTGSMainBanksList.bottomAnchor, constant: -3).isActive = true
        
    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- NEXT KEYBOAD
    //----------------------------------------------------------------
    
    @IBAction func nextKeyboardPRessed(_ sender: Any) {
    
        advanceToNextInputMode()
        
    
    }
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SHIFT PRESSED
    //----------------------------------------------------------------
    @IBAction func shiftPressed(_ sender: Any) {
    
        
        shiftStatus = shiftStatus > 0 ? 0 : 1
        shiftChange(containerView: row1)
        shiftChange(containerView: row2)
        shiftChange(containerView: row3)
        shiftChange(containerView: row4)
        
    
    }
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SHIFT CHANGED
    //----------------------------------------------------------------
    
    func shiftChange(containerView: UIStackView){
        
        for view in containerView.subviews {
            
            if let button = view as? UIButton {
                
                let buttonTitle = button.titleLabel?.text
                if shiftStatus == 0 {
                    
                    let text = buttonTitle!.lowercased()
                    button.setTitle("\(text)", for: .normal)
                    
                }else {
                    
                    let  text = buttonTitle!.uppercased()
                    button.setTitle("\(text)", for: .normal)
                }
            }
            
        }
        
    }
    
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CLOSE MAIN MENU
    //----------------------------------------------------------------
    
    @IBAction func closeKeyboardMenu(_ sender: Any) {
   
       self.mainKeyboardMenu.removeFromSuperview()
        
        
//        view.addSubview(airtimeView)
//        airtimeView.translatesAutoresizingMaskIntoConstraints = false
//        airtimeView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        airtimeView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        airtimeView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        airtimeView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
//        addSimpleView()
        
//        makeAirTimeMainView()
       
    }

    //----------------------------------------------------------------
    
    

    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BACKSPACE PRESSED
    //----------------------------------------------------------------
    
    @IBAction func backSpacePressed(_ sender: Any) {
        
        proxy.deleteBackward()
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- RETURN PRESSED
    //----------------------------------------------------------------
    
    @IBAction func returnPressed(_ sender: Any) {
   
        proxy.insertText("\n")
    
    }

    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SPACE BUTTON PRESSED
    //----------------------------------------------------------------
    @IBAction func spacePressed(_ sender: Any) {
    
        proxy.insertText(" ")
    
    }

    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- NUMBERS SYMBOLS PRESSED
    //----------------------------------------------------------------
    
    @IBAction func numbersSymbolsPressed(_ sender: Any) {

        makeKeyboardNumberCharecterOneView()
    }

    //----------------------------------------------------------------
    
    
    @IBAction func keyPressed(sender: UIButton){
        
        let string = sender.titleLabel!.text!
        proxy.insertText("\(string)")
        
        if shiftStatus == 1 {
            
            shiftPressed(self.shiftButton)
        }
       
      
        sender.transform = CGAffineTransform.identity
        UIView.animate(withDuration: 0.2, animations: {
            sender.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        }, completion: {(_) -> Void in
            sender.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })

        
    }
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SHIFT DOUBLE TAPPED
    //----------------------------------------------------------------
    
    @IBAction func shiftDoubleTapped(_ sender: UITapGestureRecognizer) {
        
        shiftStatus = 2
        shiftChange(containerView: row1)
        shiftChange(containerView: row2)
        shiftChange(containerView: row3)
        shiftChange(containerView: row4)
    
    
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SHIFT TRIPPLE TAPPED
    //----------------------------------------------------------------
    
    
    @IBAction func shiftTrippleTapped(_ sender: UITapGestureRecognizer) {
    
    
        shiftStatus = 0
        shiftPressed(self.shiftButton)
        
    }
    
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- Keyboard View Constraints
    //----------------------------------------------------------------
    
    func setKeyboardViewContraints(){
        
       
        
        if #available(iOSApplicationExtension 11.0, *) {
            keyboardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        } else {
            // Fallback on earlier versions
        }
        keyboardView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        keyboardView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        keyboardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- GO TO MENU
    //----------------------------------------------------------------
    
    
//    @IBAction func goToMenu(_ sender: Any) {
//
//        mainKeyboardMenu.layer.cornerRadius = 0
//        mainKeyboardMenu.backgroundColor = UIColor.brown
//
//
//        tilesArray = createTileArray()
//        print("BILL ARRAY COUNT \(tilesArray.count)")
//
//        view.addSubview(mainKeyboardMenu)
//
//        mainKeyboardMenu.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        mainKeyboardMenu.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        mainKeyboardMenu.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        mainKeyboardMenu.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//
////        let topView: MainTilesCollectionView = {
////
////            let tv = MainTilesCollectionView(tilesArray: tilesArray)
////            tv?.translatesAutoresizingMaskIntoConstraints = false
//////            tv?.delegate = self
////            return tv!
////
////        }()
////
////        mainKeyboardMenu.addSubview(topView)
////        topView.topAnchor.constraint(equalTo: mainKeyboardMenu.topAnchor, constant: 3).isActive = true
////        topView.leftAnchor.constraint(equalTo: mainKeyboardMenu.leftAnchor, constant: 3).isActive = true
////        topView.rightAnchor.constraint(equalTo: mainKeyboardMenu.rightAnchor, constant: -3).isActive = true
////        topView.bottomAnchor.constraint(equalTo: mainKeyboardMenu.bottomAnchor, constant: -3).isActive = true
//
//
//    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
       
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.

        
    }
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- NUMPAD BUTTONS ACTION METHOD
    //----------------------------------------------------------------
    
    func numpadBtnPressed(button: UIButton, label: UILabel) {
        
        if label.text?.isEmpty ?? true {
            
            button.transform = CGAffineTransform.identity
            UIView.animate(withDuration: 0.2, animations: {
                button.transform = CGAffineTransform(scaleX: 1.0, y: 1.3)
            }, completion: {(_) -> Void in
                button.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })

            label.text = button.title(for: .normal)
            
        }else {
            
            button.transform = CGAffineTransform.identity
            UIView.animate(withDuration: 0.2, animations: {
                button.transform = CGAffineTransform(scaleX: 1.0, y: 1.3)
            }, completion: {(_) -> Void in
                button.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })

            label.text = label.text! + button.title(for: .normal)!
        }
    }
    
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- NUMPAD CLEAR ACTION METHOD
    //----------------------------------------------------------------
    
    func numpadClearBtnPressed(button: UIButton, label: UILabel) {
        
        if label.text != "" {
            
            label.text?.removeLast()
        }
        
    }

    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ENTER PIN HANDLER METHOD
    //----------------------------------------------------------------
    
    func handlePin(txt1: UILabel, txt2: UILabel, txt3: UILabel, txt4: UILabel, button: UIButton){
        
        if txt1.text?.isEmpty ?? true {
            
            txt1.text = "*"
            
            pinString = button.title(for: .normal)!
           
            
            
        }
        else if txt2.text?.isEmpty ?? true {
            
            txt2.text = "*"
            pinString = pinString + button.title(for: .normal)!
           
            
        }else if txt3.text?.isEmpty ?? true {
            
            txt3.text = "*"
            pinString = pinString + button.title(for: .normal)!
            
            
        }else if txt4.text?.isEmpty ?? true {
            
            txt4.text = "*"
            pinString = pinString + button.title(for: .normal)!
            
            print(pinString)
            print("PIN STRING PIN \(pinString)")
        }
        
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- HANDLE EXPIRY DATE METHOD
    //----------------------------------------------------------------
    
    func handleExpiryDate(monthLabel: UILabel, yearLabel: UILabel, button: UIButton) {
        
        if monthLabel.text!.count < 2 {
    
            monthLabel.text = monthLabel.text! + button.title(for: .normal)!
            
        }else {
            
            if yearLabel.text!.count < 4 {
                
                yearLabel.text = yearLabel.text! + button.title(for: .normal)!
            }
        }
    
    }
    
    
    
    
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CLEAR EXPIRY TEXTVIEWS
    //----------------------------------------------------------------
    
    func clearExpiryDetails(monthLabel: UILabel, yearLabel: UILabel) {
        
        yearLabel.text = ""
        monthLabel.text = ""
    }
    
    
    //----------------------------------------------------------------
    
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CLEAR PIN HANDLER METHOD
    //----------------------------------------------------------------
    
    func clearPin(txt1: UILabel, txt2: UILabel, txt3: UILabel, txt4: UILabel){
        
        txt1.text = ""
        txt2.text = ""
        txt3.text = ""
        txt4.text = ""

    }
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- GENERAL TEXT DOCUMENT CLLICK METHOD
    //----------------------------------------------------------------
    
    @objc func didTapButton(_ sender: AnyObject) {
        
        let button = sender as! UIButton
        let proxy = textDocumentProxy
        let title = button.title(for: .normal)
        proxy.insertText(title!)
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- PARTICLE LOADING VIEW
    //----------------------------------------------------------------
    
    lazy var loadingView: ParticlesLoadingView = {
        
        let view = ParticlesLoadingView(frame: CGRect(x: 50, y: 50 , width: 140, height: 140))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.particleEffect = .spark
        view.duration = 1.5
        view.particlesSize = 15.0
        view.clockwiseRotation = true
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 70.0
        
        return view
    }()
    
    
    let progressView = Controls().theView()
    let progressLabel = Controls().theLabel(title: "Please Wait", fontSize: 17)
    let progressConfirmLabel = Controls().theLabel(title: "", fontSize: 18)
    let progressOkbtn = Controls().theButton(title: "OK")
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT PARTICLE LOADING VIEW
    //----------------------------------------------------------------
    
    lazy var zipitLoadingView: ParticlesLoadingView = {
        
        let view = ParticlesLoadingView(frame: CGRect(x: 50, y: 50 , width: 140, height: 140))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.particleEffect = .spark
        view.duration = 1.5
        view.particlesSize = 15.0
        view.clockwiseRotation = true
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 70.0
        
        return view
    }()
    
    
    let zipitProgressView = Controls().theView()
    let zipitProgressLabel = Controls().theLabel(title: "Please Wait", fontSize: 17)
    let zipitProgressConfirmLabel = Controls().theLabel(title: "", fontSize: 18)
    let zipitProgressOkbtn = Controls().theButton(title: "OK")
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- INTERNAL TRANSFER PARTICLE LOADING VIEW
    //----------------------------------------------------------------
    
    lazy var internalLoadingView: ParticlesLoadingView = {
        
        let view = ParticlesLoadingView(frame: CGRect(x: 50, y: 50 , width: 140, height: 140))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.particleEffect = .spark
        view.duration = 1.5
        view.particlesSize = 15.0
        view.clockwiseRotation = true
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 70.0
        
        return view
    }()
    
    
    let internalProgressView = Controls().theView()
    let internalProgressLabel = Controls().theLabel(title: "Please Wait", fontSize: 17)
    let internalProgressConfirmLabel = Controls().theLabel(title: "", fontSize: 18)
    let internalProgressOkbtn = Controls().theButton(title: "OK")
    
    //----------------------------------------------------------------
    
 
    
    
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- MAKE PARTICLE PROGRESS DIALOG METHOD
    //----------------------------------------------------------------
    
    
    lazy var generalLoadingView: ParticlesLoadingView = {
        
        let view = ParticlesLoadingView(frame: CGRect(x: 50, y: 50 , width: 140, height: 140))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.particleEffect = .spark
        view.duration = 1.5
        view.particlesSize = 15.0
        view.clockwiseRotation = true
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 70.0
        
        return view
    }()
    
    
    let generalProgressView = Controls().theView()
    let generalProgressLabel = Controls().theLabel(title: "Please Wait", fontSize: 17)
    let generalProgressConfirmLabel = Controls().theLabel(title: "", fontSize: 18)
    let generalProgressOkbtn = Controls().theButton(title: "OK")
    
    func makeProgressParticleProgressBar(containingView: UIView){
        
        generalProgressView.backgroundColor = #colorLiteral(red: 0.1981083439, green: 0.04320339475, blue: 0.1978468009, alpha: 0.8520173373)
        containingView.addSubview(generalProgressView)
        
        
        generalProgressView.topAnchor.constraint(equalTo: containingView.topAnchor, constant: 0).isActive = true
        generalProgressView.leftAnchor.constraint(equalTo: containingView.leftAnchor, constant: 0).isActive = true
        generalProgressView.rightAnchor.constraint(equalTo: containingView.rightAnchor, constant: 0).isActive = true
        generalProgressView.bottomAnchor.constraint(equalTo: containingView.bottomAnchor, constant: 0).isActive = true
        
        
        generalProgressView.addSubview(generalLoadingView)
        
        generalLoadingView.centerYAnchor.constraint(equalTo: generalProgressView.centerYAnchor).isActive = true
        generalLoadingView.centerXAnchor.constraint(equalTo: generalProgressView.centerXAnchor).isActive = true
        generalLoadingView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        generalLoadingView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        generalLoadingView.addSubview(generalProgressLabel)
        generalProgressLabel.text = "Please Wait"
        generalProgressLabel.textColor = Theme.WhitePrimary
        generalProgressLabel.numberOfLines = 0
        generalProgressLabel.textAlignment = .center
        generalProgressLabel.centerYAnchor.constraint(equalTo: generalLoadingView.centerYAnchor).isActive = true
        generalProgressLabel.centerXAnchor.constraint(equalTo: generalLoadingView.centerXAnchor).isActive = true
        generalProgressLabel.leftAnchor.constraint(equalTo: generalLoadingView.leftAnchor, constant: 3).isActive = true
        generalProgressLabel.rightAnchor.constraint(equalTo: generalLoadingView.rightAnchor, constant: -3).isActive = true
        
        
        generalProgressView.addSubview(generalProgressConfirmLabel)
        generalProgressConfirmLabel.text = ""
        generalProgressConfirmLabel.textColor = Theme.WhitePrimary
        generalProgressConfirmLabel.textAlignment = .center
        generalProgressConfirmLabel.topAnchor.constraint(equalTo: generalLoadingView.bottomAnchor, constant: 16).isActive = true
        generalProgressConfirmLabel.leftAnchor.constraint(equalTo: generalProgressView.leftAnchor, constant: 3).isActive = true
        generalProgressConfirmLabel.rightAnchor.constraint(equalTo: generalProgressView.rightAnchor, constant: -3).isActive = true
        
        
        generalProgressView.addSubview(generalProgressOkbtn)
        generalProgressOkbtn.backgroundColor = UIColor.white
        generalProgressOkbtn.layer.cornerRadius = 5
        generalProgressOkbtn.setTitleColor(Theme.PrimaryPurple, for: .normal)
        generalProgressOkbtn.addTarget(self, action: #selector(generalProgressOkbtnPressed), for: .touchUpInside)
        
        generalProgressOkbtn.topAnchor.constraint(equalTo: generalProgressView.topAnchor, constant: 10).isActive = true
        generalProgressOkbtn.rightAnchor.constraint(equalTo: generalProgressView.rightAnchor, constant: -8).isActive = true
        generalProgressOkbtn.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        generalProgressOkbtn.isHidden = true
        
        
        generalLoadingView.startAnimating()
        
        
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- STOP ANIMATING PARTICLE PROGRESS METHOD
    //----------------------------------------------------------------
    
    func stopParticleProgressDialog(generalProgressLabel: String, generalProgressConfirmLabel: String, generalBtnVisibility: Bool){
        
        generalLoadingView.stopAnimating()
        self.generalProgressLabel.text = generalProgressLabel
        self.generalProgressConfirmLabel.text = generalProgressConfirmLabel
        self.generalProgressOkbtn.isHidden = generalBtnVisibility
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- REMOVE PARTICLE PROGRESS VIEW
    //----------------------------------------------------------------
    
    func dismissParticleProgresssDialog(){
        
        generalProgressView.removeFromSuperview()
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- GENERAL PROGRESS OKAY BTN ACTION
    //----------------------------------------------------------------
    
    @objc func generalProgressOkbtnPressed(){
        
        
        generalProgressView.removeFromSuperview()
        generalLoadingView.removeFromSuperview()
//        ZIPITPinView.removeFromSuperview()
    }
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- GET CHAR POSITION
    //----------------------------------------------------------------
    
    func charAt(position: Int, msisdn: String) -> String{
        
        let charIndex = msisdn.index(msisdn.startIndex, offsetBy: position)
        let char = msisdn.substring(to: charIndex)
        
        return char
    }
    
    
    //----------------------------------------------------------------
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CHECK IF PHONENUMBER IS VALID
    //----------------------------------------------------------------
    
    func isPhonenumberValid(phonenumber: String) -> Bool {
        
        var valid = false
        
        if charAt(position: 1, msisdn: phonenumber) == "0"  || charAt(position: 4, msisdn: phonenumber) == "+263"{
            
            valid = true
        }
        
        return valid
    }
    
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CHECK FOR MNO
    //----------------------------------------------------------------
    
    func getMNO(msisdn: String) -> String{
        
        var MNOString = "INVALID"
        
        let msisdnArray = Array(msisdn.characters)
        
        
        print("FIRST CHAR: \(msisdnArray[0])")
        print("SECOND CHAR: \(msisdnArray[1])")
        print("THIRD CHAR: \(msisdnArray[2])")
      
        if msisdnArray[0] == "0" && msisdnArray[1] == "7" {
            
            if msisdnArray[2] == "7" || msisdnArray[2] == "8" {
                
                MNOString = MNO.ECONET.rawValue
                
            }else if msisdnArray[2] == "3" {
                
                MNOString = MNO.TELECEL.rawValue
                
            }else if msisdnArray[2] == "1" {
                
                MNOString = MNO.NETONE.rawValue
            }
        }
        
        
        return MNOString
        
        
    }
    
    
    
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- CHECK IF EXPIRY IS NEEDED
    //----------------------------------------------------------------
    
    func isExpiryNeeded(cardNumber: String) -> Bool {
        
        var status = false
        
        let firstSix = cardNumber.index(cardNumber.startIndex, offsetBy: 6)
        let sixChar = cardNumber.substring(to: firstSix)
        
        if sixChar == "543948" {
            
            status = true
        }
        
        return status
    }
    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- VALIDATION ERROR VIEW
    //----------------------------------------------------------------
    
    let parentView = Controls().theView()
    let errorMessage = Controls().theLabel(title: "", fontSize: 18)
    func showValidationView(message: String){
        
        let errorTitle = Controls().theLabel(title: "Input Error", fontSize: 21)
        errorTitle.textAlignment = .center
        
        
        errorMessage.textAlignment = .center
        errorMessage.numberOfLines = 0
        errorMessage.text = message
        
        
        let errorOkBtn = Controls().theButton(title: "OK")
        errorOkBtn.backgroundColor = Theme.PrimaryPurple
        errorOkBtn.layer.cornerRadius = 5
        errorOkBtn.addTarget(self, action: #selector(closeValidationView), for: .touchUpInside)
        
        
        let errorIcon = Controls().theImageView(imageName: "oops")
        
        let errorTitleDivider = Controls().theView()
        errorTitleDivider.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        
        parentView.layer.cornerRadius = 0
        parentView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 0.95)
        
        view.addSubview(parentView)
        parentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        parentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        parentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        parentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        parentView.addSubview(errorTitle)
        errorTitle.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 16).isActive = true
        errorTitle.leftAnchor.constraint(equalTo: parentView.leftAnchor, constant: 8).isActive = true
        errorTitle.rightAnchor.constraint(equalTo: parentView.rightAnchor, constant: -8).isActive = true
        
        
        parentView.addSubview(errorTitleDivider)
        errorTitleDivider.topAnchor.constraint(equalTo: errorTitle.bottomAnchor, constant: 16).isActive = true
        errorTitleDivider.leftAnchor.constraint(equalTo: parentView.leftAnchor, constant: 8).isActive = true
        errorTitleDivider.rightAnchor.constraint(equalTo: parentView.rightAnchor, constant: -8).isActive = true
        errorTitleDivider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        parentView.addSubview(errorIcon)
        errorIcon.topAnchor.constraint(equalTo: errorTitleDivider.bottomAnchor, constant: 16).isActive = true
        errorIcon.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        errorIcon.heightAnchor.constraint(equalToConstant: 90).isActive = true
        errorIcon.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        parentView.addSubview(errorMessage)
        errorMessage.topAnchor.constraint(equalTo: errorIcon.bottomAnchor, constant: 16).isActive = true
        errorMessage.leftAnchor.constraint(equalTo: parentView.leftAnchor, constant: 8).isActive = true
        errorMessage.rightAnchor.constraint(equalTo: parentView.rightAnchor, constant: -8).isActive = true
        
        parentView.addSubview(errorOkBtn)
        errorOkBtn.topAnchor.constraint(equalTo: errorMessage.bottomAnchor, constant: 32).isActive = true
        errorOkBtn.leftAnchor.constraint(equalTo: parentView.leftAnchor, constant: 80).isActive = true
        errorOkBtn.rightAnchor.constraint(equalTo: parentView.rightAnchor, constant: -80).isActive = true
        errorOkBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
    }
    
    
    @objc func closeValidationView(){
    
      errorMessage.text = ""
      parentView.removeFromSuperview()
    
    }
    
    //----------------------------------------------------------------
    
}

extension UIInputViewController {
    
    
}



extension UILabel {
    
    func addImageWith(name: String, behindText: Bool) {
        
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: name)
        let attachmentString = NSAttributedString(attachment: attachment)
        
        guard let txt = self.text else {
            return
        }
        
        if behindText {
            let strLabelText = NSMutableAttributedString(string: txt)
            strLabelText.append(attachmentString)
            self.attributedText = strLabelText
        } else {
            let strLabelText = NSAttributedString(string: txt)
            let mutableAttachmentString = NSMutableAttributedString(attributedString: attachmentString)
            mutableAttachmentString.append(strLabelText)
            self.attributedText = mutableAttachmentString
        }
    }
    
    func removeImage() {
        let text = self.text
        self.attributedText = nil
        self.text = text
    }
}

extension String {

func aesEncrypt(AES_KEY: String, INIT_VECTOR: String) -> String{
    
    var results = ""
    
    do{
        
        let key: [UInt8] = Array(AES_KEY.utf8) as [UInt8]
        let iv: [UInt8] = Array(INIT_VECTOR.utf8) as [UInt8]
        
        let aes = try! AES(key: key, blockMode: CBC(iv: iv), padding: .pkcs5)
        
        let encrypted = try aes.encrypt(Array(self.utf8))
        
        results = encrypted.toBase64()!
        
        print("AES Encryption Result: \(results)")
        
        
        
    }catch {
        
        print("ERROR: \(error)")
        
        
    }
    
    return results
    
}
    
    
    func aesDecrypt(AES_KEY: String, INIT_VECTOR: String) ->String{
        
        var result = ""
        
        do{
            let encrypted = self
            
            let key: [UInt8] = Array(AES_KEY.utf8) as [UInt8]
            let iv: [UInt8] = Array(INIT_VECTOR.utf8) as [UInt8]
            
            let aes = try! AES(key: key, blockMode: CBC(iv: iv), padding: .pkcs5)
            
            let decrypted = try aes.decrypt(Array(base64: encrypted))
            
            result = String(data: Data(decrypted), encoding: .utf8) ?? ""
            
            print("AES DECRYPTION RESULTS: \(result)")
            
        }catch {
            
            print("ERROR: \(error)")
        }
        
        return result
    }
    
   

}
