#include <iostream>

#define ll long long
using namespace std;

ll pow (ll x, ll n)
{
    ll tm;
    if (n == 0) return 1;
    tm = pow (x, n/2);
    tm = (tm * tm) % 10000;
    if (n % 2 == 1)
        tm = (tm * x) % 10000;
    return tm;
}

int main()
{
    ll x,n;
    cin >> x >> n;
    cout << pow (x, n);
}
