#include <stdint.h>

int initialized_value = 42;
int zero_initialized_value;
const int read_only_value = 1234;

int main(void) {
    volatile uint32_t counter = 0U;

    while (1) {
        counter++;
    }
    
    return 0;
    
}