#pragma once
#include "TimeDTO.h"
#include <string>

struct DataPkg {
    std::string type;
    TimeDTO time;
    double price;
    double volume;
    std::string symbol;
};