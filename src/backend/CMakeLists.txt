set(DAYTRADER_BACKEND_HEADERS
	data/TransactionHistory.h
	models/Stock.h
	models/User.h
	models/Wallet.h
	services/MarketDataService.h
)

add_library(DayTraderBackend INTERFACE)
target_sources(DayTraderBackend INTERFACE
	${DAYTRADER_BACKEND_HEADERS}
	services/MarketDataService.cpp
)

find_package(Qt6 REQUIRED COMPONENTS Network)

target_include_directories(DayTraderBackend
	INTERFACE
		${CMAKE_CURRENT_SOURCE_DIR}
)

target_link_libraries(DayTraderBackend
	INTERFACE
		Qt6::Network
)



