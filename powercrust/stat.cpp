#include <sys/time.h>
#include <sys/resource.h>

long getMemoryUsage()
{
    struct rusage usage;
    if (0 == getrusage(RUSAGE_SELF, &usage))
        return usage.ru_maxrss; // bytes
    else
        return 0;
}
