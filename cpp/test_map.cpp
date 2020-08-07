#include <iostream>
#include <string>
#include <map>

using namespace std;

int main()
{
    map<string, int> m{{"a", 1}, {"b", 2}, {"c", 3}};
    m["d"]=10;
    for (auto p : m){
        cout<<p.first<<" : "<<p.second<<endl;
    }
    
    cout<<m["a"]<<endl;
    
    cout<<m.size()<<endl;
}
