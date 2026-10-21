#pragma once
#include <string>
#include <ctime>
#include "TimeDTO.h"
#include "DataPackage.h"

class DeserializeData
{   
    public:
        static DataPkg deserializePkg(std::string &data);
    private:
        static TimeDTO deserializeTime(const std::string& timeString);

};