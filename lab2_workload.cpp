#include <cerrno>
#include <cmath>
#include <cstdlib>
#include <iomanip>
#include <iostream>
#include <limits>
#include <string>
#include <vector>


#if defined(__GNUC__) || defined(__clang__)
__attribute__((noinline))
#endif
double run_workload(std::size_t n, int iterations) {
    std::vector<double> values(n);

    for (std::size_t i = 0; i < n; ++i) {
        values[i] = 0.5 + static_cast<double>(i % 1000) / 1000.0;
    }

    for (int pass = 0; pass < iterations; ++pass) {
        for (std::size_t i = 0; i < n; ++i) {
            values[i] = values[i] * 1.0000001 + 0.0000003;
        }
    }

    double checksum = 0.0;
    for (std::size_t i = 0; i < n; ++i) {
        checksum += values[i];
    }
    return checksum;
}

int main(int argc, char* argv[]) {
    std::size_t n = 262144;
    int iterations = 1500;

    if (argc >= 2) {
        char* end = nullptr;
        errno = 0;
        unsigned long long parsed = std::strtoull(argv[1], &end, 10);
        if (errno != 0 || end == argv[1] || *end != '\0' || parsed == 0 ||
            parsed > std::numeric_limits<std::size_t>::max()) {
            std::cerr << "Invalid array size: " << argv[1] << '\n';
            return 1;
        }
        n = static_cast<std::size_t>(parsed);
    }

    if (argc >= 3) {
        char* end = nullptr;
        errno = 0;
        long parsed = std::strtol(argv[2], &end, 10);
        if (errno != 0 || end == argv[2] || *end != '\0' ||
            parsed <= 0 || parsed > std::numeric_limits<int>::max()) {
            std::cerr << "Invalid iteration count: " << argv[2] << '\n';
            return 1;
        }
        iterations = static_cast<int>(parsed);
    }

    std::cout << "Array size: " << n << '\n'
              << "Iterations: " << iterations << '\n';

    const double checksum = run_workload(n, iterations);
    std::cout << std::setprecision(15)
              << "Checksum: " << checksum << '\n';

    return 0;
}


