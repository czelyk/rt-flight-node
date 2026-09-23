#include <stdint.h>

int main(void) {
    volatile uint32_t counter = 0U;

    while (1) {
        counter++;
    }
    
    return 0;
}