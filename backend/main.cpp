#include <cassert>
#include <iostream>
#include <string>

#include "Helper/DeserializeData.h"

int main(int argc, char *argv[])
{
    std::string testData =
        R"({"type":"trade","data":[{"t":1792489153683,"p":81407.76,"v":0.0001,"s":"BINANCE:BTCUSDT"}]})";

    const DataPkg result = DeserializeData::deserializePkg(testData);


    std::cout << "Deserialized DataPkg:\n"
              << "  type: " << result.type << '\n'
              << "  price: " << result.price << '\n'
              << "  volume: " << result.volume << '\n'
              << "  symbol: " << result.symbol << '\n'
              << "  time.day: " << result.time.day << '\n'
              << "  time.month: " << result.time.month << '\n'
              << "  time.year: " << result.time.year << '\n'
              << "  time.hour: " << result.time.hour << '\n'
              << "  time.minute: " << result.time.minute << '\n'
              << "  time.second: " << result.time.second << '\n'
              << "  time.millisecond: " << result.time.millisecond << '\n';

    std::cout << "deserializeData test passed\n";
    return 0;
}