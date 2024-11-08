# Rejection Sampling

!!! quote

    - [6.3 Rejection Sampling | Advanced Statistical Computing (bookdown.org)](https://bookdown.org/rdpeng/advstatcomp/rejection-sampling.html)

Rejection sampling can be used to generate samples of a random variable with density f and there is not a built in function for it.

## Principle

If one can not sample from the density **$f$ (target density)**, one can find a density $g$ (candidate density)**, like a normal or t-distribution from which it's easy to sample because $g$ is known. Then it's possible to sample g and reject samples in a strategic way to make the non-rejected samples look like they came from f density:

$$
P \left( X \leq t \mid X_{accepted} \right) = \frac{P \left( X \leq t, X_{accepted}\right)}{P{X_{accepted}}} = F(t)
$$

This shows that the distribution function of the candidate values, given that they are accepted is equal to the distribution function corresponding to the target density.

To allow for $f$ sampling while $g$ is sampled, the support of $f$ has to be included in the support of $g$. In fact, if there is a region of the support of $f$ that $g$ can not touch, then this area will not get sampled.
In practice, $g$ should be chosen in order to match as closely as possible to $f$.

## Algorithm

Let c be the maximum of $f / g$ on the support of $f$:

$$
c = \sup_{x\sim f} \left( \frac{f(x)}{g(x)} \right)  
$$

Define a number of samples to achieve and while it is not reached, do:

1. Simulate $U \sim \mathcal{U}(0, 1)$
2. Simulate a candidate $X \sim \mathcal{g}$ (candidate density)
3. If
    $$
    U\leq{\frac{f(X)}{cg(X)}}
    $$

accept the candidate, otherwise reject it and go back to the beginning.

This implies that f can be evaluated (to determine the acceptance ratio)

## Properties of rejection sampling

The number of draws we need to take from the candidate density $g$ before we accept a candidate is a geometric random variable with success probability

$$
P(X_{accepted})= P \left( U \leq \frac{f(X)}{cg(X)} \right)=\frac{1}{c}
$$

This explains why the fact that $g$ is close to $f$ make the candidate be accepted with higher chances. The higher c, the lower the acceptance probability.
