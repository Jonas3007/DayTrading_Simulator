#pragma once 
#include <string>

class Stock {
    public:
        Stock();

        std::string getSymbol() const;
        double getPrice() const;

    private:
        std::string symbol;
        double price;
};