#pragma once

#include <QNetworkAccessManager>

class MarketDataService {
    public:
        MarketDataService();

        void getAPIData() const;

    private:
        QNetworkAccessManager networkManager;
};