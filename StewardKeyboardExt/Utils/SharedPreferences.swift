//
//  SharedPreferences.swift
//  Sample
//
//  Created by test on 13/6/2018.
//  Copyright © 2018 Handsome. All rights reserved.
//

import Foundation

class SharedPreference {
   
    static var defaults = UserDefaults(suiteName: "group.com.stewardkeyboardext.sosholoza")
    
    static func setPin(shosholozaPin: String){
        
        defaults?.set(shosholozaPin, forKey: "pin")
        defaults?.synchronize()
    }
    
    static func getPin() -> String?{
        
        return defaults?.string(forKey: "pin")
    }
    
    static func setEmailaAddress(email: String){
       
         defaults?.set(email, forKey: "email")
        defaults?.synchronize()
    }
    
    static func getEmailaAddress() -> String{
        
        var em = ""
        
        if let email = defaults?.string(forKey: "email") {
            
            em = email
        }
        
        return  em
    }
    
    static func setPhoneNumber(phone: String){
        
        defaults?.set(phone, forKey: "phone")
        defaults?.synchronize()
    }
    
    static func getPhoneNumber() -> String?{
        
        return  defaults?.string(forKey: "phone")
    }
    
    
    static func setAccountNumber(accountNumber: String){
        
        defaults?.set(accountNumber, forKey: "accountNumber")
        defaults?.synchronize()
    }
    
    static func getAccountNumber() -> String?{
        
        return  defaults?.string(forKey: "accountNumber")
    }
    
    
    static func setAccountType(accountType: String){
        
        defaults?.set(accountType, forKey: "accountType")
        defaults?.synchronize()
    }
    
    static func getAccountType() -> String?{
        
        return defaults?.string(forKey: "accountType")
    }
    
    
    static func setAccessToken(accessToken: String){
        
        defaults?.set(accessToken, forKey: "accessToken")
        defaults?.synchronize()
    }
    
    static func getAccessToken() -> String?{
        
        return defaults?.string(forKey: "accessToken")
    }
    
    
    static func setIMEI(IMEI: String){
        
        defaults?.set(IMEI, forKey: "imei")
        defaults?.synchronize()
    }
    
    
    static func getIMEI() -> String?{
        
        return defaults?.string(forKey: "imei")
    }
    
    
    static func setBalance(balanceKey: String, balanceValue: String){
        
        var dict:[String: String] = [String:String]()
        
        dict[balanceKey] = balanceValue
        defaults?.set(dict, forKey: "balance")
        
    }
    
    static func getBalance(balanceKey: String) -> String?{
        
        var dict = defaults?.dictionary(forKey: balanceKey)
        
        return dict![balanceKey] as? String
    }
    
    
    
    static func setCurrency(currency: String){
        
        defaults?.set(currency, forKey: "currency")
        defaults?.synchronize()
    }
    
    
    static func getCurrency() -> String?{
        
        return defaults?.string(forKey: "currency")
    }
    
    
    static func setUsername(IMEI: String){
        
        defaults?.set(IMEI, forKey: "username")
        defaults?.synchronize()
    }
    
    
    static func getUsername() -> String?{
        
        return defaults?.string(forKey: "username")!
    }
    
    static func setPassword(password: String){
        
        defaults?.set(password, forKey: "password")
        defaults?.synchronize()
    }
    
    
    static func getPassword() -> String?{
        
        return defaults?.string(forKey: "password")!
    }
    
    
    static func setTouchAuth(touchParam: String){
        
        defaults?.set(touchParam, forKey: "touch")
        defaults?.synchronize()
    }
    
    
    static func getTouchAuth() -> String?{
        
        return defaults?.value(forKey: "touch") as? String
    }
    
    static func setAccountAccessToken(accessToken: String){
        
        defaults?.set(accessToken, forKey: "accesstoken")
        defaults?.synchronize()
    }
    
    
    static func getAccountAccessToken() -> String?{
        
        return defaults?.string(forKey: "accesstoken")
    }
    
    static func setCDSNumber(cdsNumber: String){
        
        defaults?.set(cdsNumber, forKey: "cdsNumber")
        defaults?.synchronize()
    }
    
    
    static func getCDSNumber() -> String?{
        
        return defaults?.string(forKey: "cdsNumber")
    }
    
    static func setQuickCustomerService(customerServiceParam: String){
        
        defaults?.set(customerServiceParam, forKey: "customerservice")
        defaults?.synchronize()
    }
    
    
    static func getQuickCustomerService() -> String?{
        
        return defaults?.string(forKey: "customerservice")
    }
    
    
    
    static func setLoyaltyPoints(loyaltyPointsParam: String){
        
        defaults?.set(loyaltyPointsParam, forKey: "loyaltypoints")
        defaults?.synchronize()
    }
    
    
    static func getLoyaltyPoints() -> String?{
        
        return defaults?.string(forKey: "loyaltypoints")
    }
    
    static func setInvestorAccountNumber(accountNumber: String){
        
        defaults?.set(accountNumber, forKey: "account")
        defaults?.synchronize()
    }
    
    
    static func getInvestorAccountNumber() -> String?{
        
        return defaults?.string(forKey: "account")!
    }
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET ECOCASH PAYMENT AUTH PARAMETERS
    //----------------------------------------------------------------
    

    static func setEcocashAmount(amount: Double){
        
        defaults?.set(amount, forKey: "ecocashamount")
        defaults?.synchronize()
    }
    
    
    static func getEcocashAmount() -> Double?{
        
        return defaults?.double(forKey: "ecocashamount")
    }
    
    
    
    static func setEcocashAssociatedCode(associatedCode: String){
        
        defaults?.set(associatedCode, forKey: "associatedCode")
        defaults?.synchronize()
    }
    
    
    static func getEcocashAssociatedCode() -> String?{
        
        return defaults?.string(forKey: "associatedCode")
    }
    
    
    static func setEcocashCorrelater(correlater: String){
        
        defaults?.set(correlater, forKey: "correlater")
        defaults?.synchronize()
    }
    
    
    static func getEcocashCorrelater() -> String?{
        
        return defaults?.string(forKey: "correlater")
    }
    
    static func setEcocashReference(reference: String){
        
        defaults?.set(reference, forKey: "reference")
        defaults?.synchronize()
    }
    
    
    static func getEcocashReference() -> String?{
        
        return defaults?.string(forKey: "reference")
    }
    
   
    
    static func setEcocashStatus(status: String){
        
        defaults?.set(status, forKey: "status")
        defaults?.synchronize()
    }
    
    
    static func getEcocashStatus() -> String?{
        
        return defaults?.string(forKey: "status")
    }
    
    
    static func setEcocashEcocashReference(ecocashReference: String){
        
        defaults?.set(ecocashReference, forKey: "ecocashReference")
        defaults?.synchronize()
    }
    
    
    static func getEcocashEcocashReference() -> String?{
        
        return defaults?.string(forKey: "ecocashReference")
    }
    
    
    static func setEcocashEcocashStatus(ecocashStatus: String){
        
        defaults?.set(ecocashStatus, forKey: "ecocashStatus")
        defaults?.synchronize()
    }
    
    
    static func getEcocashEcocashStatus() -> String?{
        
        return defaults?.string(forKey: "ecocashStatus")
    }
    
    
    static func setEcocashPhone(phone: String){
        
        defaults?.set(phone, forKey: "ecocashmobile")
        defaults?.synchronize()
    }
    
    
    static func getEcocashEcocashPhone() -> String?{
        
        return defaults?.string(forKey: "ecocashmobile")
    }
    
    
    
    
    static func setEcocashId(ecocashId: Int){
        
        defaults?.set(ecocashId, forKey: "ecocashId")
        defaults?.synchronize()
    }
    
    
    static func getEcocashId() -> Int?{
        
        return defaults?.integer(forKey: "ecocashId")
    }
    
    
    static func setEcocashBankDestinationInstitution(destinationInstitution: String){
        
        defaults?.set(destinationInstitution, forKey: "destinationInstitution")
        defaults?.synchronize()
    }
    
    
    static func getEcocashBankDestinationInstitution() -> String?{
        
        return defaults?.string(forKey: "destinationInstitution")
    }
    
    static func setEcocashBankDestinationAccount(destinationAccount: String){
        
        defaults?.set(destinationAccount, forKey: "destinationAccount")
        defaults?.synchronize()
    }
    
    
    static func getEcocashBankDestinationAccount() -> String?{
        
        return defaults?.string(forKey: "destinationAccount")
    }
    
    //----------------------------------------------------------------

    static func setEcocashPaymentParams(amount: Double, associatedCode: String, correlater: String, reference: String,
                                        status: String, ecocashReference: String, ecocashStatus: String, phone: String,
                                        id: Int ){
        
        
        setEcocashAmount(amount: amount)
        setEcocashAssociatedCode(associatedCode: associatedCode)
        setEcocashCorrelater(correlater: correlater)
        setEcocashReference(reference: reference)
        setEcocashStatus(status: status)
        setEcocashEcocashReference(ecocashReference: ecocashReference)
        setEcocashEcocashStatus(ecocashStatus: ecocashStatus)
        setEcocashPhone(phone: phone)
        setEcocashId(ecocashId: id)

    }
    
    
    
    
    static func clearEcocashPreferences() {
        
        defaults?.set(nil, forKey: "ecocashamount")
        defaults?.set(nil, forKey: "associatedCode")
        defaults?.set(nil, forKey: "correlater")
        defaults?.set(nil, forKey: "reference")
        defaults?.set(nil, forKey: "status")
        defaults?.set(nil, forKey: "ecocashReference")
        defaults?.set(nil, forKey: "ecocashStatus")
        defaults?.set(nil, forKey: "ecocashphone")
        defaults?.set(nil, forKey: "ecocashId")
        
    }
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET ECOCASH PAYMENT STATUS PREFERENCES
    //----------------------------------------------------------------
    
    static func setEcocashPaymentStatus(ecocashpaymentstatus: String){
        
        defaults?.set(ecocashpaymentstatus, forKey: "ecocashpaymentstatus")
        defaults?.synchronize()
    }
    
    
    static func getEcocashPaymentStatus() -> String?{
        
        return defaults?.string(forKey: "ecocashpaymentstatus")
    }
    
    //----------------------------------------------------------------
    
    
    static func setEcocashBillPaymentStatus(ecocashbillpaymentstatus: String){
        
        defaults?.set(ecocashbillpaymentstatus, forKey: "ecocashbillpaymentstatus")
        defaults?.synchronize()
    }
    
    
    static func getEcocashBillPaymentStatus() -> String?{
        
        return defaults?.string(forKey: "ecocashbillpaymentstatus")
    }
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS PREFERENCE VARIABLES
    //----------------------------------------------------------------
    
    static func setBillAccountNumber(billaccountNumber: String){
        
        defaults?.set(billaccountNumber, forKey: "billaccountNumber")
        defaults?.synchronize()
    }
    
    
    static func getBillAccountNumber() -> String?{
        
        return defaults?.string(forKey: "billaccountNumber")
    }
    
    static func setBillerName(billerName: String){
        
        defaults?.set(billerName, forKey: "billerName")
        defaults?.synchronize()
    }
    
    
    static func getBillerName() -> String?{
        
        return defaults?.string(forKey: "billerName")
    }
    
    static func setBillerCode(billerCode: String){
        
        defaults?.set(billerCode, forKey: "billerCode")
        defaults?.synchronize()
    }
    
    
    static func getBillerCode() -> String?{
        
        return defaults?.string(forKey: "billerCode")
      
    }
    
    static func setBillAmount(billAmount: String){
        
        defaults?.set(billAmount, forKey: "billAmount")
        defaults?.synchronize()
    }
    
    
    static func getBillAmount() -> String?{
        
        return defaults?.string(forKey: "billAmount")
    }
    
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ONBOARDING PARAMETERS
    //----------------------------------------------------------------
    
    static func setEcocashOnBoardStatus(status: String){
        
        defaults?.set(status, forKey: "ecocashStatus")
        defaults?.synchronize()
    }
    
    
    static func getEcocashOnBoardStatus() -> String?{
        
        return defaults?.string(forKey: "ecocashStatus")
    }
    
    
    static func setSquareOnBoardStatus(status: String){
        
        defaults?.set(status, forKey: "squareStatus")
        defaults?.synchronize()
    }
    
    
    static func getSquareOnBoardStatus() -> String?{
        
        return defaults?.string(forKey: "squareStatus")
    }
    
    
    //----------------------------------------------------------------
    
    
    
    static func setSquareMobileNumber(number: String){
        
        defaults?.set(number, forKey: "squarePhone")
        defaults?.synchronize()
    }
    
    
    static func getSquareMobileNumber() -> String?{
        
        return defaults?.string(forKey: "squarePhone")
    }
    
   
    
}
