# Digit representations

## Overview

!!! info
    Binary code is a system of representing information using only two digits, 0 and 1. Each digit in a binary code is called a "bit," and a sequence of bits represents a piece of information. Binary is the fundamental language of computers, and it forms the basis for all digital systems. Here's how binary code works:

    Computers use binary code internally because electronic circuits can easily represent two states (on/off, high/low voltage), corresponding to the binary digits 0 and 1. These binary states are the foundation of digital computing.

    - **Text:** Characters are often represented in binary using character encoding schemes like ASCII or Unicode. Each character is assigned a unique binary code.
    - **Numbers:** Binary code is used to represent integer and floating-point numbers. Binary-coded decimals (BCD) and two's complement are common binary representations for numbers.
    - **Images, Audio, and Video:** These types of data are represented in binary as well. For example, pixels in an image may be represented using binary values to represent colors.

    Binary code is closely tied to Boolean logic, where the values 0 and 1 represent the logical states of false and true, respectively. In computer programming and digital circuit design, Boolean logic is used for decision-making and control flow.

## Representations

### **Binary (base 2)**

In the binary system, numbers are represented using powers of 2. Each digit in a binary number represents a power of 2:

- **Example: Binary representation of 101101:**

$1 \times 2^5 + 0 \times 2^4 + 1 \times 2^3 + 1 \times 2^2 + 0 \times 2^1 + 1 \times 2^0 = 53$

| Power | Base 2 |
| - | - |
| 0 | 1 |
| 1 | 2 |
| 2 | 4 |
| 3 | 8 |
| 4 | 16 |
| 5 | 32 |
| 6 | 64 |
| 7 | 128 |
| 8 | 256 |
| 9 | 512 |
| 10 | 1 024 |
| 11 | 2 048 |
| 12 | 4 096 |
| 13 | 8 192 |
| 14 | 16 384 |
| 15 | 32 768 |
| 16 | 65 536 |
| 17 | 131 072 |
| 18 | 262 144 |
| 19 | 524 288 |
| 20 | 1 048 576 |
| 21 | 2 097 151 |
| 22 | 4 194 304 |
| 23 | 8 388 608 |
| 24 | 16 777 216 |
| 25 | 33 554 432 |
| 26 | 67 108 864 |
| 27 | 134 217 728 |
| 28 | 268 435 456 |
| 29 | 5 36870 912 |
| 30 | 1 073 741 824 |
| 31 | 2 147 483 648 |
| 32 | 4 294 967 296 |
| 64 | 18 446 744 073 709 551 616 |

### **Binary Digits (Bits / octet)**

- **Bit:** The smallest unit of data in binary code is a bit, which can be either 0 or 1. The term "bit" is a contraction of "binary digit."
- **Byte:** A group of 8 bits is called a byte. Bytes are commonly used to represent characters in computer systems.
- 4 bits (nibble) can be represented using Hexadecimal notation

### **Hexadecimal**

In addition to binary, hexadecimal is often used to represent binary values more compactly.
 Each hexadecimal digit represents four bits (a nibble).
 The code representation starts with `0x` followed by the hexadecimal value (ex: `0xFF` is the decimal number `0xF.0 + 0xF.16 = 15 + 15.16 = 255`)

Hexadecimal (or hex) is a base-16 numeral system. It is commonly used as a more human-friendly representation of binary-coded values, especially in computing and programming. Here's how hexadecimal representation works:

#### 1. **Hexadecimal Digits:**

Hexadecimal uses 16 symbols to represent values, comprising the regular decimal digits (0-9) and six additional symbols represented by letters A to F. The hexadecimal digits are:

```text
0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F
```

Each hexadecimal digit corresponds to a 4-bit binary nibble (half-byte), making it convenient for representing binary values.

#### 2. **Conversion from Binary to Hexadecimal:**

To convert a binary number to hexadecimal, replace each group of four binary digits with the corresponding hexadecimal digit:

**Example: Binary to Hexadecimal**

```
Binary: 110101101010
Grouped: 1101 0110 1010
Hexadecimal: D6A
Computer representation: 0xD6A
```

#### 3. **Conversion from Hexadecimal to Binary:**

To convert a hexadecimal number to binary: replace each hexadecimal digit with its 4-bit binary representation.

**Example: Hexadecimal to Binary**

```
Hexadecimal: B3A
Binary: 1011 0011 1010
```

#### 4. **Conversion from Decimal to Hexadecimal:**

To convert a decimal number to hexadecimal:

- Divide the decimal number by 16.
- Write down the remainder as the least significant digit (rightmost).
- Divide the quotient by 16 and repeat the process until the quotient is zero.
- The hexadecimal representation is the sequence of remainders read from bottom to top.

**Example: Decimal to Hexadecimal**

```text
Decimal: 482
482 ÷ 16 = 30 remainder 2
30 ÷ 16 = 1 remainder 14 (E in hexadecimal)
1 ÷ 16 = 0 remainder 1
Hexadecimal: 1EE
```

Example: Hexadecimal to Decimal:

```text
  0x12345678

  8 * 16^0  (least significant digit)
+ 7 * 16^1
+ 6 * 16^2
+ 5 * 16^3
+ 4 * 16^4
+ 3 * 16^5
+ 2 * 16^6
+ 1 * 16^7  (most significant digit)
-----------------
  Decimal Result
```

#### 5. **Usage in Programming:**

!!! info

    Hexadecimal is widely used in programming for several reasons:
    - It provides a concise representation of binary data.
    - Memory addresses and byte values are often represented in hexadecimal.
    - Hexadecimal is used in color representations (RGB values in web development, for example).
    Understanding hexadecimal is crucial for working with low-level programming, memory addresses, and binary data representation in computing. It provides a more concise and human-readable way to represent binary values, especially when dealing with large or complex bit patterns.

### Endianness

!!! info "Endianness refers to the **order** in which bytes are stored in computer memory."

    It determines how a multi-byte data type, such as a 16-bit or 32-bit integer, is represented in memory. There are two common types of endianness: big-endian and little-endian.

!!! warning "The choice of endianness is important when data is transferred between systems with different endianness or when data is stored persistently and needs to be read on a different platform."

    Different computer architectures and processors may use different endianness, so it's crucial to be aware of and account for it in situations where binary data is exchanged between systems.

!!! tip "Fun fact"

    The terms "big-endian" and "little-endian" originate from Jonathan Swift's "Gulliver's Travels," where two factions of beings disagreed on whether to start eating boiled eggs from the big end or the little end. The analogy is used in computer science to describe byte-ordering conventions.

- [Endianness swap](https://jdelezenne.github.io/Codex/Software/Endianness.html)
- [Robust endianness conversion](https://mklimenko.github.io/english/2018/08/22/robust-endian-swap/)

#### Big Endian

- In a big-endian system, the most significant byte (the one with the highest address) is stored at the lowest memory address.
- The least significant byte is stored at the highest memory address.

   Example with a 32-bit integer `0x12345678`:
   ```
   Address:  0x1000  0x1001  0x1002  0x1003
   Data:     0x12    0x34    0x56    0x78
   ```

#### Little Endian

- In a little-endian system, the least significant byte is stored at the lowest memory address.
   - The most significant byte is stored at the highest memory address.

   Example with the same 32-bit integer `0x12345678`:
   ```
   Address:  0x1000  0x1001  0x1002  0x1003
   Data:     0x78    0x56    0x34    0x12
   ```

#### Code example

Swap endianness of an [integer type](https://mklimenko.github.io/english/2018/08/22/robust-endian-swap/):

```C++
#include <cstdint>
#include <cstdio>

// optimized by the compiler in one bswap instruction
template <typename T>
void SwapEndian(T &val) {
    union U {
        T val;
        std::array<std::uint8_t, sizeof(T)raw;
    } src, dst;

    src.val = val;
    std::reverse_copy(src.raw.begin(), src.raw.end(), dst.raw.begin());
    val = dst.val;
}

void SwapEndian(std::uint16_t &value) {
    value = (value >8) | (value << 8);
}

template<>
void SwapEndian<std::uint32_t>(std::uint32_t &value) {
    std::uint32_t tmp = ((value << 8) & 0xFF00FF00) | ((value >8) & 0xFF00FF);
    value = (tmp << 16) | (tmp >16);
}

void SwapEndian(std::uint64_t &value) {
    value = ((value & 0x00000000FFFFFFFFull) << 32) | ((value & 0xFFFFFFFF00000000ull) >32);
    value = ((value & 0x0000FFFF0000FFFFull) << 16) | ((value & 0xFFFF0000FFFF0000ull) >16);
    value = ((value & 0x00FF00FF00FF00FFull) << 8)  | ((value & 0xFF00FF00FF00FF00ull) >8);
}


int main() {
    uint32_t originalValue = 0x12345678;
    uint32_t swappedValue = SwapEndian(originalValue);

    // Output the results
    printf("Original value: 0x%08X\n", originalValue);
    printf("Swapped value : 0x%08X\n", swappedValue);

    return 0;
}
```

### Twos complement

1. **Identify the Sign Bit:**
   - In a two's complement representation, the leftmost bit (most significant bit) is the sign bit.
   - If the sign bit is 0, the number is positive. If it's 1, the number is negative.

2. **Positive Numbers:**
   - If the sign bit is 0, read the remaining bits as a standard binary representation of a positive number.

     Example: For the 8-bit binary number `01011010`, the sign bit is 0, so the number is positive. Reading the remaining bits (`1011010`) as standard binary gives the decimal value.

3. **Negative Numbers:**
   - If the sign bit is 1, interpret the remaining bits as the two's complement of the positive value.
   - Invert all the bits (change 0s to 1s and vice versa) and then add 1 to the result to get the positive value.

     Example: For the 8-bit binary number `11001101`, the sign bit is 1, indicating a negative number. Inverting the bits (`00110010`) and adding 1 gives the positive value.

In an n-bit two's complement representation, the range is from -2^(n-1) to 2^(n-1) - 1.
For example, in an 8-bit system, the range is from -128 to 127.

### Integer

### Floating-Point

#### IEEE 754

!!! quote
    - [IEEE precision](https://www.google.com/url?sa=i&url=https%3A%2F%2Fstackoverflow.com%2Fquestions%2F64715018%2Faccuracy-of-data-type-float-ieee-754-single-precision&psig=AOvVaw25DDqvA0V4ZSXPUa1vL9nh&ust=1731110191795000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCPi1u5a2y4kDFQAAAAAdAAAAABAJ)

!!! quote

    - [Wikipedia article](https://fr.wikipedia.org/wiki/IEEE_754)

    | Precision | Signe (bits) | Biased exponent (bits) | Mantisse (bits) | Total (bits) |
    | ---- | ---- | ---- | ---- | ---- |
    | simple | 1 | 8 (range from -126 to 127) | 23 | 32 |
    | double | 1 | 11 (range from -1024 to 1023) | 52 | 64 |

#### IBM

!!! quote

    - [Wikipedia article](https://en.wikipedia.org/wiki/IBM_hexadecimal_floating-point)

    | Precision | Signe (bits) | Biased exponent (bits) | Mantisse (bits) | Total (bits) |
    | ---- | ---- | ---- | ---- | ---- |
    | simple | 1 | 7 (range from -126 to 127) | 24 | 32 |
    | double | 1 | 8 (range from ) | 55 | 64 |

### BCD (Binary Code Decimal)

TODO

### ASCII and extended ASCII (American Standard Code for Information Interchange)

TODO

### Unicode

TODO

#### UTF-8 (Unicode Transformation Format 8-bits)

TODO

#### UTF-16 (Unicode Transformation Format 8-bits)

TODO

#### UTF-32 (Unicode Transformation Format 8-bits)

TODO

### EBCDIC (Extended Binary Coded Decimal Interchange Code)

TODO
