#include <cstdio>
#include <random>
using namespace std;

int main()
{
    default_random_engine eng(20211025);

    for (;;)
    {
        char a[256];
        char b[256];
        char c[256];
        if (scanf("%s%s%s", a, b, c) != 3)
        {
            break;
        }

        if (uniform_real_distribution<double>(0, 1)(eng) < 20.7 * M_PI / 1000.0)
        {
            printf("%s %s %s\n", a, b, c);
        }
    }

    return 0;
}