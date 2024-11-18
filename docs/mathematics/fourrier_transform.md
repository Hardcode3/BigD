# Fourrier Transform

!!! info "The **Fourier Transform** is a mathematical tool that transforms a signal from its original domain (often time or space) into the frequency domain. It breaks down signals into their constituent sinusoidal components (sines and cosines) to analyze their frequency content."

!!! quote "Resources"

    - [Youtube 3BlueOneBrown](https://youtu.be/spUNpyF58BY?si=43lJ-UPiy6w0a0AV){target=_blank}
    - [Wolfram MathWorld](https://mathworld.wolfram.com/FourierTransform.html){target=_blank}

---

## Continuous Fourier Transform (CFT)

### Definition

The **Continuous Fourier Transform** (CFT) is defined for continuous signals \( x(t) \) as:

\[
X(f) = \int_{-\infty}^\infty x(t) e^{-j 2 \pi f t} \, dt
\]

- **\( X(f) \):** Frequency domain representation of \( x(t) \)
- **\( f \):** Frequency (in Hz)
- **\( t \):** Time
- **\( e^{-j 2 \pi f t} \):** Complex exponential (sinusoidal basis function)

### Inverse Transform

\[
x(t) = \int_{-\infty}^\infty X(f) e^{j 2 \pi f t} \, df
\]

---

## Discrete Fourier Transform (DFT)

### Definition

The **Discrete Fourier Transform** (DFT) applies to discrete signals (sequences) \( x[n] \) of finite length \( N \). It is defined as:

\[
X[k] = \sum_{n=0}^{N-1} x[n] e^{-j \frac{2 \pi}{N} k n}
\]

- **\( X[k] \):** Frequency domain representation of \( x[n] \)
- **\( k \):** Frequency index
- **\( N \):** Number of samples in the sequence

### Inverse Transform

\[
x[n] = \frac{1}{N} \sum_{k=0}^{N-1} X[k] e^{j \frac{2 \pi}{N} k n}
\]

---

## Key Differences Between CFT and DFT

| **Aspect**            | **Continuous Fourier Transform (CFT)**                | **Discrete Fourier Transform (DFT)**              |
|------------------------|-------------------------------------------------------|---------------------------------------------------|
| Signal type            | Continuous signals \( x(t) \)                        | Discrete signals \( x[n] \)                      |
| Domain                 | Continuous in time and frequency                     | Discrete in time and frequency                   |
| Mathematical tool      | Integral                                              | Summation                                         |
| Applications           | Idealized, theoretical analysis                      | Practical, real-world computations (via FFT)     |

---

## Usual Fourrier Transforms

![Usual Fourrier transforms table](https://media.cheggcdn.com/media/fff/fff4050d-7215-4cdd-b056-0af757fd3058/php6hYhHm)
