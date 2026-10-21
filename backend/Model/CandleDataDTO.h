#pragma once 
#include <ctime>

struct CandleDataDTO {
    double open;
    double close;
    double high;
    double low;
    bool isBullish;
    std::time_t timestamp;
};