class BankAccount{
  late int Id;
  late String Name;
  late String MobileNumber;
  late num _Balance = 0;

  BankAccount(this.Id, this.Name, this.MobileNumber);


  GetBalance(){
    return _Balance;
  }

  DepositBalance(num balance){
    if (balance > 0) {
      _Balance +=balance;
      print('Wow $Name, Deposit Successful');
    }  else
      {
        print('Deposit Balance Must be Greahter then Zero');
      }

  }

  WithrawBalance(num balance){
    if (balance > 0 && balance <= _Balance) {
      _Balance -=balance;
      print('Withdraw Successful');
    }  else
      {
        print('Insufficient Balance');
      }

  }





  void DisplayInfo(){
    print('Account Id       : $Id');
    print('Account Name     : $Name');
    print('Mobile Number    : $MobileNumber');
    print('Current Balance  : $_Balance');

  }


}