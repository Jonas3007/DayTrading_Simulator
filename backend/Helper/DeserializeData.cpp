#include "DeserializeData.h"
#include "nlohmann/json.hpp"
#include <chrono>
using json = nlohmann::json;

// {"type":"trade","data":[{"t":1792489153683,"p":81407.76,"v":0.0001,"s":"BINANCE:BTCUSDT"}]}
DataPkg DeserializeData::deserializePkg(std::string &data){
    json unserializedData = json::parse(data);
    DataPkg pkg;
    if (unserializedData["type"] != "trade") {
        return pkg;
    }
    
    for (auto& item : unserializedData["data"]) {
        pkg.type = unserializedData["type"];
        pkg.time = deserializeTime(std::to_string(item["t"].get<long long>()));
        pkg.price = item["p"];
        pkg.volume = item["v"];
        pkg.symbol = item["s"];
        return pkg;
    }
    return pkg;
}

TimeDTO DeserializeData::deserializeTime(const std::string& time){
    int64_t timestamp = std::stoll(time);
    TimeDTO timeDto;

    std::chrono::milliseconds ms(timestamp);
    std::chrono::time_point<std::chrono::system_clock> tp(ms);
    std::time_t tt = std::chrono::system_clock::to_time_t(tp);
    std::tm tm = *std::gmtime(&tt);

    timeDto.year = tm.tm_year + 1900;
    timeDto.month = tm.tm_mon + 1;
    timeDto.day = tm.tm_mday;
    timeDto.hour = tm.tm_hour;
    timeDto.minute = tm.tm_min;
    timeDto.second = tm.tm_sec;
    timeDto.millisecond = timestamp % 1000;
    
    return timeDto;
}
