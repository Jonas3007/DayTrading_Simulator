cmake_minimum_required(VERSION 3.16)

project(DayTraderBackend VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_executable(dayTraderBackend
    main.cpp
    Helper/CalculateCandle.cpp
    Helper/DeserializeData.cpp
)

target_include_directories(dayTraderBackend
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_CURRENT_SOURCE_DIR}/Helper
        ${CMAKE_CURRENT_SOURCE_DIR}/Model
)
