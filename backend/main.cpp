#include <ctime>
#include <iostream>
int main(int argc, char *argv[])
{
    time_t timestamp;
    time(&timestamp);

   
    std::cout << ctime(&timestamp);
    return 0;


}