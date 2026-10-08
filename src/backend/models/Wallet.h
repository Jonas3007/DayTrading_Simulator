#pragma once 
#include <string>

class Wallet {
    public:
        Wallet();

        double getBalance() const;
        void deposit(double amount);
        void withdraw(double amount);

    private:
        double balance;
};