//
//  KeyboardSharedPreferences.swift
//  StewardBankKeyboard
//
//  Created by mac pro on 11/1/18.
//  Copyright © 2018 mac pro. All rights reserved.
//

import Foundation


class KeyboardSharedPreferences{
    
    var defaults = UserDefaults.standard
    
    func setPin(shosholozaPin: String){
        
        defaults.set(shosholozaPin, forKey: "pin")
        defaults.synchronize()
    }
    
    func getPin() -> String?{
        
        return defaults.string(forKey: "pin")
    }
    
    func setEmailaAddress(email: String){
        
        defaults.set(email, forKey: "email")
        defaults.synchronize()
    }
    
    func getEmailaAddress() -> String{
        
        var em = ""
        
        if let email = defaults.string(forKey: "email") {
            
            em = email
        }
        
        return  em
    }
    
    func setPhoneNumber(phone: String){
        
        defaults.set(phone, forKey: "phone")
        defaults.synchronize()
    }
    
    func getPhoneNumber() -> String?{
        
        return  defaults.string(forKey: "phone")
    }
    
    
    func setAccountNumber(accountNumber: String){
        
        defaults.set(accountNumber, forKey: "accountNumber")
        defaults.synchronize()
    }
    
    func getAccountNumber() -> String?{
        
        return  defaults.string(forKey: "accountNumber")
    }
    
    
    func setAccountType(accountType: String){
        
        defaults.set(accountType, forKey: "accountType")
        defaults.synchronize()
    }
    
    func getAccountType() -> String?{
        
        return defaults.string(forKey: "accountType")
    }
    
    
    func setAccessToken(accessToken: String){
        
        defaults.set(accessToken, forKey: "accessToken")
        defaults.synchronize()
    }
    
    func getAccessToken() -> String?{
        
        return defaults.string(forKey: "accessToken")
    }
    
    
    func setIMEI(IMEI: String){
        
        defaults.set(IMEI, forKey: "imei")
        defaults.synchronize()
    }
    
    
    func getIMEI() -> String?{
        
        return defaults.string(forKey: "imei")
    }
    
    
    func setBalance(balanceKey: String, balanceValue: String){
        
        var dict:[String: String] = [String:String]()
        
        dict[balanceKey] = balanceValue
        defaults.set(dict, forKey: "balance")
        
    }
    
    func getBalance(balanceKey: String) -> String?{
        
        var dict = defaults.dictionary(forKey: balanceKey)
        
        return dict![balanceKey] as? String
    }
    
    
    
    func setCurrency(currency: String){
        
        defaults.set(currency, forKey: "currency")
        defaults.synchronize()
    }
    
    
    func getCurrency() -> String?{
        
        return defaults.string(forKey: "currency")
    }
    
    
    func setUsername(IMEI: String){
        
        defaults.set(IMEI, forKey: "username")
        defaults.synchronize()
    }
    
    
    func getUsername() -> String?{
        
        return defaults.string(forKey: "username")!
    }
    
    func setPassword(password: String){
        
        defaults.set(password, forKey: "password")
        defaults.synchronize()
    }
    
    
    func getPassword() -> String?{
        
        return defaults.string(forKey: "password")!
    }
    
    
    func setTouchAuth(touchParam: String){
        
        defaults.set(touchParam, forKey: "touch")
        defaults.synchronize()
    }
    
    
    func getTouchAuth() -> String?{
        
        return defaults.value(forKey: "touch") as? String
    }
    
    func setAccountAccessToken(accessToken: String){
        
        defaults.set(accessToken, forKey: "accesstoken")
        defaults.synchronize()
    }
    
    
    func getAccountAccessToken() -> String?{
        
        return defaults.string(forKey: "accesstoken")
    }
    
    func setCDSNumber(cdsNumber: String){
        
        defaults.set(cdsNumber, forKey: "cdsNumber")
        defaults.synchronize()
    }
    
    
    func getCDSNumber() -> String?{
        
        return defaults.string(forKey: "cdsNumber")
    }
    
    func setQuickCustomerService(customerServiceParam: String){
        
        defaults.set(customerServiceParam, forKey: "customerservice")
        defaults.synchronize()
    }
    
    
    func getQuickCustomerService() -> String?{
        
        return defaults.string(forKey: "customerservice")
    }
    
    
    
    func setLoyaltyPoints(loyaltyPointsParam: String){
        
        defaults.set(loyaltyPointsParam, forKey: "loyaltypoints")
        defaults.synchronize()
    }
    
    
    func getLoyaltyPoints() -> String?{
        
        return defaults.string(forKey: "loyaltypoints")
    }
    
    func setInvestorAccountNumber(accountNumber: String){
        
        defaults.set(accountNumber, forKey: "account")
        defaults.synchronize()
    }
    
    
    func getInvestorAccountNumber() -> String?{
        
        return defaults.string(forKey: "account")!
    }
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET ECOCASH PAYMENT AUTH PARAMETERS
    //----------------------------------------------------------------
    
    
    func setEcocashAmount(amount: Double){
        
        defaults.set(amount, forKey: "ecocashamount")
        defaults.synchronize()
    }
    
    
    func getEcocashAmount() -> Double?{
        
        return defaults.double(forKey: "ecocashamount")
    }
    
    
    
    func setEcocashAssociatedCode(associatedCode: String){
        
        defaults.set(associatedCode, forKey: "associatedCode")
        defaults.synchronize()
    }
    
    
    func getEcocashAssociatedCode() -> String?{
        
        return defaults.string(forKey: "associatedCode")
    }
    
    
    func setEcocashCorrelater(correlater: String){
        
        defaults.set(correlater, forKey: "correlater")
        defaults.synchronize()
    }
    
    
    func getEcocashCorrelater() -> String?{
        
        return defaults.string(forKey: "correlater")
    }
    
    func setEcocashReference(reference: String){
        
        defaults.set(reference, forKey: "reference")
        defaults.synchronize()
    }
    
    
    func getEcocashReference() -> String?{
        
        return defaults.string(forKey: "reference")
    }
    
    
    
    func setEcocashStatus(status: String){
        
        defaults.set(status, forKey: "status")
        defaults.synchronize()
    }
    
    
    func getEcocashStatus() -> String?{
        
        return defaults.string(forKey: "status")
    }
    
    
    func setEcocashEcocashReference(ecocashReference: String){
        
        defaults.set(ecocashReference, forKey: "ecocashReference")
        defaults.synchronize()
    }
    
    
    func getEcocashEcocashReference() -> String?{
        
        return defaults.string(forKey: "ecocashReference")
    }
    
    
    func setEcocashEcocashStatus(ecocashStatus: String){
        
        defaults.set(ecocashStatus, forKey: "ecocashStatus")
        defaults.synchronize()
    }
    
    
    func getEcocashEcocashStatus() -> String?{
        
        return defaults.string(forKey: "ecocashStatus")
    }
    
    
    func setEcocashPhone(phone: String){
        
        defaults.set(phone, forKey: "ecocashphone")
        defaults.synchronize()
    }
    
    
    func getEcocashEcocashPhone() -> String?{
        
        return defaults.string(forKey: "ecocashphone")
    }
    
    func setEcocashId(ecocashId: Int){
        
        defaults.set(ecocashId, forKey: "ecocashId")
        defaults.synchronize()
    }
    
    
    func getEcocashId() -> Int?{
        
        return defaults.integer(forKey: "ecocashId")
    }
    
    
    func setEcocashBankDestinationInstitution(destinationInstitution: String){
        
        defaults.set(destinationInstitution, forKey: "destinationInstitution")
        defaults.synchronize()
    }
    
    
    func getEcocashBankDestinationInstitution() -> String?{
        
        return defaults.string(forKey: "destinationInstitution")
    }
    
    func setEcocashBankDestinationAccount(destinationAccount: String){
        
        defaults.set(destinationAccount, forKey: "destinationAccount")
        defaults.synchronize()
    }
    
    
    func getEcocashBankDestinationAccount() -> String?{
        
        return defaults.string(forKey: "destinationAccount")
    }
    
    //----------------------------------------------------------------
    
    func setEcocashPaymentParams(amount: Double, associatedCode: String, correlater: String, reference: String,
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
    
    
    
    
    func clearEcocashPreferences() {
        
        defaults.set(nil, forKey: "ecocashamount")
        defaults.set(nil, forKey: "associatedCode")
        defaults.set(nil, forKey: "correlater")
        defaults.set(nil, forKey: "reference")
        defaults.set(nil, forKey: "status")
        defaults.set(nil, forKey: "ecocashReference")
        defaults.set(nil, forKey: "ecocashStatus")
        defaults.set(nil, forKey: "ecocashphone")
        defaults.set(nil, forKey: "ecocashId")
        
    }
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- SET ECOCASH PAYMENT STATUS PREFERENCES
    //----------------------------------------------------------------
    
    func setEcocashPaymentStatus(ecocashpaymentstatus: String){
        
        defaults.set(ecocashpaymentstatus, forKey: "ecocashpaymentstatus")
        defaults.synchronize()
    }
    
    
    func getEcocashPaymentStatus() -> String?{
        
        return defaults.string(forKey: "ecocashpaymentstatus")
    }
    
    //----------------------------------------------------------------
    
    
    func setEcocashBillPaymentStatus(ecocashbillpaymentstatus: String){
        
        defaults.set(ecocashbillpaymentstatus, forKey: "ecocashbillpaymentstatus")
        defaults.synchronize()
    }
    
    
    func getEcocashBillPaymentStatus() -> String?{
        
        return defaults.string(forKey: "ecocashbillpaymentstatus")
    }
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- BILL PAYMENTS PREFERENCE VARIABLES
    //----------------------------------------------------------------
    
    func setBillAccountNumber(billaccountNumber: String){
        
        defaults.set(billaccountNumber, forKey: "billaccountNumber")
        defaults.synchronize()
    }
    
    
    func getBillAccountNumber() -> String?{
        
        return defaults.string(forKey: "billaccountNumber")
    }
    
    func setBillerName(billerName: String){
        
        defaults.set(billerName, forKey: "billerName")
        defaults.synchronize()
    }
    
    
    func getBillerName() -> String?{
        
        return defaults.string(forKey: "billerName")
    }
    
    func setBillerCode(billerCode: String){
        
        defaults.set(billerCode, forKey: "billerCode")
        defaults.synchronize()
    }
    
    
    func getBillerCode() -> String?{
        
        return defaults.string(forKey: "billerCode")
        
    }
    
     func setBillAmount(billAmount: String){
        
        defaults.set(billAmount, forKey: "billAmount")
        defaults.synchronize()
    }
    
    
     func getBillAmount() -> String?{
        
        return defaults.string(forKey: "billAmount")
    }
    

    
    //----------------------------------------------------------------
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- ZIPIT VALUES
    //----------------------------------------------------------------
    
    func setZIPITDestinationAccount(destinationAccount: String){
        
        defaults.set(destinationAccount, forKey: "zipitdestinationaccount")
        defaults.synchronize()
    }
    
    
    func getZIPITDestinationAccount() -> String?{
        
        return defaults.string(forKey: "zipitdestinationaccount")
        
    }
    
    
    func setZIPITBankInstitution(bankInstitution: String){
        
        defaults.set(bankInstitution, forKey: "zipitinstitution")
        defaults.synchronize()
    }
    
    
    func getZIPITBankInstitution() -> String?{
        
        return defaults.string(forKey: "zipitinstitution")
        
    }
    
    func setZIPITAmount(amount: String){
        
        defaults.set(amount, forKey: "zipitamount")
        defaults.synchronize()
    }
    
    
    func getZIPITAmount() -> String?{
        
        return defaults.string(forKey: "zipitamount")
        
    }
    
    
    
    //----------------------------------------------------------------
    
    
    
    //----------------------------------------------------------------
    // MARK:-
    // MARK:- AIRTIME SHARED PREFERENCES
    //----------------------------------------------------------------
    
    func setAirtimeAmount(amount: String){
        
        defaults.set(amount, forKey: "airtimeamount")
        defaults.synchronize()
    }
    
    
    func getAirtimeAmount() -> String?{
        
        return defaults.string(forKey: "airtimeamount")
        
    }
    
    func setAirtimeNetworkProvider(network: String){
        
        defaults.set(network, forKey: "airtimenetwork")
        defaults.synchronize()
    }
    
    
    func getAirtimeNetworkProvider() -> String?{
        
        return defaults.string(forKey: "airtimenetwork")
        
    }
    
    func setAirtimeRecipient(recipient: String){
        
        defaults.set(recipient, forKey: "recipient")
        defaults.synchronize()
    }
    
    
    func getAirtimeRecipient() -> String?{
        
        return defaults.string(forKey: "recipient")
        
    }
    
    
    func setAirtimeEcocashPaymentStatus(ecocashPaymentStatus: String){
        
        defaults.set(ecocashPaymentStatus, forKey: "ecocashpaymentstatus")
        defaults.synchronize()
    }
    
    
    func getAirtimeEcocashPaymentStatus() -> String?{
        
        return defaults.string(forKey: "ecocashpaymentstatus")
        
    }
    
    
    func setAirtimeAuthToken(token: String){
        
        defaults.set(token, forKey: "airtimetoken")
        defaults.synchronize()
    }
    
    
    func getAirtimeAuthToken() -> String?{
        
        return defaults.string(forKey: "airtimetoken")
        
    }
    
    
    func setAirtimeZimswitchPurchase(airtimezimswitch: String){
        
        defaults.set(airtimezimswitch, forKey: "airtimezimswitch")
        defaults.synchronize()
    }
    
    
    func getAirtimeZimswitchPurchase() -> String?{
        
        return defaults.string(forKey: "airtimezimswitch")
        
    }
    
    
    func setInternalTransferStatus(internalStatus: String){
        
        defaults.set(internalStatus, forKey: "internalStatus")
        defaults.synchronize()
    }
    
    
    func getInternalTransferStatus() -> String?{
        
        return defaults.string(forKey: "internalStatus")
        
    }
    
    //----------------------------------------------------------------
    
    
    
    func setSquareAirtimePaymentOption(squareAirtimePayment: String){
        
        defaults.set(squareAirtimePayment, forKey: "squareAirtimePayment")
        defaults.synchronize()
    }
    
    
    func getSquareAirtimePaymentOption() -> String?{
        
        return defaults.string(forKey: "squareAirtimePayment")
    }
    
    
    func setSquareZIPITTransferOption(squareZIPITTransfer: String){
        
        defaults.set(squareZIPITTransfer, forKey: "squareZIPITTransfer")
        defaults.synchronize()
    }
    
    
    func getSquareZIPITTransferOption() -> String?{
        
        return defaults.string(forKey: "squareZIPITTransfer")
    }
    
    
    
    func setBillAuthToken(billToken: String){
        
        defaults.set(billToken, forKey: "billToken")
        defaults.synchronize()
    }
    
    func getBillAuthToken() -> String?{
        
        return defaults.string(forKey: "billToken")
    }
    
    
    func setSquareBillPaymentStatus(squareBillPaymentStatus: String){
        
        defaults.set(squareBillPaymentStatus, forKey: "squareBillPaymentStatus")
        defaults.synchronize()
    }
    
    func getSquareBillPaymentStatus() -> String?{
        
        return defaults.string(forKey: "squareBillPaymentStatus")
    }
    
    
    
    
    func setBillPaymentAmount(billPaymentAmount: String){
        
        defaults.set(billPaymentAmount, forKey: "billPaymentAmount")
        defaults.synchronize()
    }
    
    func getBillPaymentAmount() -> String?{
        
        return defaults.string(forKey: "billPaymentAmount")
    }
    
    func setBillPaymentEcocashStatus(billPaymentEcocashStatus: String){
        
        defaults.set(billPaymentEcocashStatus, forKey: "billPaymentEcocashStatus")
        defaults.synchronize()
    }
    
    func getBillPaymentEcocashStatus() -> String?{
        
        return defaults.string(forKey: "billPaymentEcocashStatus")
    }
    
    
    func setExpiryDate(expiryDate: String){
        
        defaults.set(expiryDate, forKey: "expiryDate")
        defaults.synchronize()
    }
    
    func getExpiryDate() -> String?{
        
        return defaults.string(forKey: "expiryDate")
    }
    
    
    func setBillPaymentZimswitchStatus(billZimStatus: String){
        
        defaults.set(billZimStatus, forKey: "billZimStatus")
        defaults.synchronize()
    }
    
    func getBillPaymentZimswitchStatus() -> String?{
        
        return defaults.string(forKey: "billZimStatus")
    }
    
    func setIsExpiry(isExpiry: String){
        
        defaults.set(isExpiry, forKey: "isExpiry")
        defaults.synchronize()
    }
    
    func getIsExpiry() -> String?{
        
        return defaults.string(forKey: "isExpiry")
    }
    
}
