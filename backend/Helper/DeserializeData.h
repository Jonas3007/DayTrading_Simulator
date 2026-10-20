#pragma once
#include <string>
#include <ctime>
#include "../Model/TimeDTO.h"

class DeserializeData
{   
    public:

    private:
        static TimeDTO DeserializeTime(const std::string& timeString);
};