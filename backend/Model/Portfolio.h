#pragma once 
#include "Account.h"
#include "accountTypes.h"
#include <vector>
#include "Stock.h"

class Portfolio : public Account {
    private: 

    std::vector<Stock> stocks;

    public:

    Portfolio(int id, AccountType type, double balance, std::vector<Stock> stocks, const std::string& currency);
    std::vector<Stock> getStocks() const;
    double getBalance() override;
};