#include <iostream>
#include <string>
#include <regex>
#define toDigit(c) (c-'0')
#define toString(n) (std::to_string(n))

using namespace std;

inline std::string trim(std::string& str)
{
    str.erase(0, str.find_first_not_of(' '));
    str.erase(str.find_last_not_of(' ')+1);
    return str;
}

int isValid(std::string str)
{
    str = trim(str);
    if(!regex_match( str , regex( "[0-9]+" )) )
    {
        return -1;
    }
    if( str.length() != 10 )
    {
        return -1;
    }
    const int type = toDigit( str[0] );
    if (type != 2 && type != 1)
    {
        return -1;
    }
    int sum = 0;
    int i = 0;
    for(char& c : str) {
        if (i % 2 == 0)
        {
            const int x = toDigit(c) * 2;
            const string zfOdd = ( (x) < 10 ) ? "0" + toString(x) : toString(x);
            sum += toDigit(zfOdd[0]) + toDigit(zfOdd[1]);
        }
        else
        {
             sum += toDigit(c);
        }
        ++i;
    }
    return (sum % 10 != 0) ? -1 : type;
}
