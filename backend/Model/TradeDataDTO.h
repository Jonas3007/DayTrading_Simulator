#pragma once 
#include <ctime>

struct TradeDataDTO {
    double open;
    double close;
    double high;
    double low;
    bool isBullish;
    std::time_t timestamp;
};