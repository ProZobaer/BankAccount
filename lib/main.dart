import 'dart:io';

import 'bank_account.dart';

void main() {
  List<BankAccount> accounts = [];

  void createAccount() {
    print('Enter a New Account Number:');
    int id = int.parse(stdin.readLineSync()!);

    if (accounts.any((account) => account.Id == id)) {
      print('Account with ID $id already exists. Please use a unique ID.');
      return;
    }

    print('Enter Account Holder Name:');
    String name = stdin.readLineSync()!;

    String? mobileNumber;
    print('Enter Mobile Number:');
    mobileNumber = stdin.readLineSync();

    accounts.add(BankAccount(id, name, mobileNumber!));
    print('Account created successfully for: $name.');
  }

  void EditName() {
    print('Input Your Account ID: ');
    int id = int.parse(stdin.readLineSync()!);

    var matchingAccounts =
    accounts.where((account) => account.Id == id).toList();

    if (matchingAccounts.isEmpty) {
      print('Account with ID $id not found.');
    } else {
      var account = matchingAccounts.first;
      print('Current Name: ${account.Name}');
      print('Input New Name: ');
      String newName = stdin.readLineSync()!;
      account.Name = newName;

      print('Success! New name: $newName');
    }
  }

  void DeleteName() {
    print('Input Your Account ID: ');
    int id = int.parse(stdin.readLineSync()!);

    var accountToDelete =
    accounts.where((account) => account.Id == id).toList();

    if (accountToDelete.isEmpty) {
      print('No account found with ID: $id');
    } else {
      accounts.removeWhere((account) => account.Id == id);
      print('Successfully Deleted Account ID: $id');
    }
  }

  void depositMoney() {
    print('Enter Account ID to Deposit Money:');
    int id = int.parse(stdin.readLineSync()!);

    var matchingAccounts =
    accounts.where((account) => account.Id == id).toList();

    if (matchingAccounts.isEmpty) {
      print('Account with ID $id not found.');
    } else {
      print('Enter Amount to Deposit:');
      num amount = num.parse(stdin.readLineSync()!);

      matchingAccounts.first.DepositBalance(amount);
      print('Successfully deposited \$${amount} to Account ID: $id');
    }
  }

  void withdrawMoney() {
    print('Enter Account ID to Withdraw Money:');
    int id = int.parse(stdin.readLineSync()!);

    var matchingAccounts =
    accounts.where((account) => account.Id == id).toList();

    if (matchingAccounts.isEmpty) {
      print('Account with ID $id not found.');
    } else {
      print('Enter Amount to Withdraw:');
      num amount = num.parse(stdin.readLineSync()!);

      matchingAccounts.first.WithrawBalance(amount);
      print('Successfully withdrew \$${amount} from Account ID: $id');
    }
  }

  void searchAccount() {
    print('Enter Account ID to Search:');
    int id = int.parse(stdin.readLineSync()!);

    var matchingAccounts =
    accounts.where((account) => account.Id == id).toList();

    if (matchingAccounts.isEmpty) {
      print('Account with ID $id not found.');
    } else {
      print('\nAccount Details');
      print('------------------------');
      matchingAccounts.first.DisplayInfo();
      print('------------------------');
    }
  }

  void displayAllAccounts() {
    if (accounts.isEmpty) {
      print('No accounts available.');
      return;
    }

    print('\n--- Account Details ---');
    for (var account in accounts) {
      account.DisplayInfo();
      print('-----------------------------');
    }
  }

  void continueOrExit() {
    print('\n1. Continue');
    print('2. Exit');
    print('What Your Next Move: ');
    int choice = int.parse(stdin.readLineSync()!);
    if (choice == 2) {
      print('Exiting the system. Goodbye!');
      exit(0);
    }
  }

  while (true) {
    try {
      print('\n|-----------------------|');
      print('|   ZOBAER BANK\'s Menu  |');
      print('|-----------------------|');
      print('1. Create Account');
      print('2. Deposit Money');
      print('3. Withdraw Money');
      print('4. Search Account by ID');
      print('5. View All Accounts');
      print('6. Edit Name');
      print('7. Delete');
      print('8. Exit');
      print('-----------------------');
      print('           ↓           ');
      print('Input Your Action Number:');

      int choice = int.parse(stdin.readLineSync()!);

      switch (choice) {
        case 1:
          createAccount();
          break;
        case 2:
          depositMoney();
          break;
        case 3:
          withdrawMoney();
          break;
        case 4:
          searchAccount();
          break;
        case 5:
          displayAllAccounts();
          break;
        case 6:
          EditName();
          break;
        case 7:
          DeleteName();
          break;
        case 8:
          print('Exiting the system. Goodbye!');
          return;
        default:
          print('Invalid choice. Please try again.');
      }

      continueOrExit();
    } catch (e) {
      print('Invalid Input. Please enter a valid number.');
    }
  }
}
