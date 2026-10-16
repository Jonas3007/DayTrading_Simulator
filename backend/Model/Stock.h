#pragma once 
#include <string>
class Stock {
    private:
    std::string symbol;
    double price;

    public:
    Stock(const std::string& symbol, double price);
    void setPrice(double newPrice); 
    std::string getSymbol() const;
    double getPrice() const;
};