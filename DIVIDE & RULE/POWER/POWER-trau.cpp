#include <iostream>
#include <cmath>

#define ll long long
using namespace std;

ll power (ll x, ll n)
{
    ll tm = 1;
    for (long i = 1; i <= n; i++)
        tm = tm * x;
    return tm;
}

int main()
{
    ll x,n;
    cin >> x >> n;
    ll res = power (x,n);
    cout << res;
}
