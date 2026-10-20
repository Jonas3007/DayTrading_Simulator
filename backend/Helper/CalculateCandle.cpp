#include "CalculateCandle.h"


std::string CalculateCandle::buildCandleString(double newCourse){
    std::string candleString;
    CalculateCandle::updateValues(newCourse);
    // Get the current timestamp
    time(&timestamp);
    candleString += "t:" + std::string(ctime(&timestamp)) + ",";
    candleString += "o:" + std::to_string(open) + ",";
    candleString += "c:" + std::to_string(close) + ",";
    candleString += "h:" + std::to_string(high) + ",";
    candleString += "l:" + std::to_string(low) + ",";
    candleString += "b:" + std::string(isBullish ? "true" : "false");
    return candleString;   
}

void CalculateCandle::updateValues(double newCourse){
    if (newCourse > high) {
        high = newCourse;
    }
    if (newCourse < low) {
        low = newCourse;
    }
    if (open == 0) {
        open = newCourse;
    }
    close = newCourse;
    isBullish = close > open;
}