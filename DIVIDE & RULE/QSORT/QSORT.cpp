#include <iostream>
#include <cmath>
#define maxn 100005
using namespace std;

void qsort(long a[], long n, long l, long r)
{
    long x = a[(l + r) / 2], i = l, j = r;
    do {
        while (a[i] < x) i++;

        while (a[j] > x) j--;

        if (i <= j)
        {
            long tm = a[i];
            a[i] = a[j];
            a[j] = tm;
            i++; j--;
        }
    } while (i <= j);

    if (l < j) qsort (a, n, l, j);
    if (i < r) qsort (a, n, i, r);
}


int main()
{
    long n,a[maxn];
    cin>>n;

    for (long i=1; i<=n; i++)
        cin>>a[i];

    qsort (a, n, 1, n);

    long res=a[2]-a[1];

    for (long i = 3;i <= n;i ++)
        res = min(res, a[i]-a[i-1]);

    cout<<res;

    return 0;
}
