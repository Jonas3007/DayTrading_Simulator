#pragma once 
#include <string>
#include "accountTypes.h"


class Account {
    private:
    int id;
    AccountType type;
    double balance;
    std::string currency;

    public: 
    virtual double getBalance();
    virtual std::string getCurrency() const = 0;
    virtual AccountType getType() const = 0;
    
};