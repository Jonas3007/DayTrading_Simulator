#pragma once

#include <string>
#include "Wallet.h"

class User {
    public : 

    User();

    private: 

    int id; 
    std::string user_name;
    std::string password;

    Wallet wallet;


};