#include <stdarg.h> // For variadic functions
#include <stdio.h>  // For putchar (to print characters)

// Our simplified printf function
void my_printf(const char *format, ...) {
    va_list args;          // Declare a va_list to handle the variadic arguments
    va_start(args, format); // Initialize the va_list with the first argument after format

    for (const char *ptr = format; *ptr != '\0'; ++ptr) { // Iterate over the format string
        if (*ptr == '%') { // Check if the current character is a format specifier
            ++ptr;         // Move to the specifier
            switch (*ptr) {
                case 'c': { // Character
                    char c = (char) va_arg(args, int); // Fetch the char argument (promoted to int)
                    putchar(c); // Print the character
                    break;
                }
                case 'd': { // Integer
                    int num = va_arg(args, int); // Fetch the integer argument
                    if (num < 0) { // Handle negative numbers
                        putchar('-');
                        num = -num;
                    }
                    // Handle 0 explicitly
                    if (num == 0) {
                        putchar('0');
                    } else {
                        char buffer[11];  // Sufficient to hold an int, including negative sign
                        int i = 0;
                        while (num > 0) { // Convert number to string in reverse order
                            buffer[i++] = (num % 10) + '0';
                            num /= 10;
                        }
                        while (i > 0) // Print the number in correct order
                            putchar(buffer[--i]);
                    }
                    break;
                }
                case 's': { // String
                    const char *str = va_arg(args, const char *); // Fetch the string argument
                    while (*str) // Print the string
                        putchar(*str++);
                    break;
                }
                default: // If unknown specifier
                    putchar('%');
                    putchar(*ptr);
            }
        } else { // If not a format specifier, print the character directly
            putchar(*ptr);
        }
    }

    va_end(args); // Clean up the va_list
}

int main(){
    my_printf("hello, Shikkaa! My name is %s, I am %d years old\n", "Omar", 24);
    return 0;
}
