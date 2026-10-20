#pragma once 
#include <ctime>
#include <string>

class CalculateCandle {
public:
    private: 

    double open;
    double close;
    double high;
    double low;
    bool isBullish;

    std::time_t timestamp;

    void updateValues(double newCourse);

    public:
    CalculateCandle() : open(0), close(0), high(0), low(0), isBullish(false), timestamp(0) {}

    std::string buildCandleString(double newCourse);

};