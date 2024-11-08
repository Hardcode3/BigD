# Metropolis Hastings

!!! quote

    - [7.2 Metropolis-Hastings | Advanced Statistical Computing (bookdown.org)](https://bookdown.org/rdpeng/advstatcomp/metropolis-hastings.html)

## Theory

The Mettropolis-Hastings alogorithm is am iterratve algorithm where at each stage, there are three steps:

Let $q(Y \mid X )$ be a transition density for p-dimensional $X$ and $Y$ from which we can easily simulate.
Let $\pi (X)$ be the target density (the stationnary distribution that our Markov chain will eventually converge to).

1. Suppose we are currently in stage $x$ and we want to know how to move to the next state in the state space. Simulate a candidate value $y \sim q(Y \mid x)$. The candidate value depends on our current state $x$.
2. Let the acceptance ratio be:

    $$
    \alpha (y \mid x)=min \left\{ \frac {\pi(y)q(x \mid y)}{\pi(x)q(y \mid x)}, 1 \right\}
    $$
    
3. Simulate $u \sim \mathcal{U}(0, 1)$. If $u \leq \alpha(y \mid x)$ then the next state is equal to $y$, otherwise we stay on $x$.

These three steps reprensent the transition kernel of the [Markov chain]([Markof_Chain_Monte_Carlo](obsidian://open?vault=obsidian&file=dev%2Falgorithms%2FMarkov_Chain_Monte_Carlo)) from which we are simulating.

## Properties

From the MCMC properties:

- The transition kernel $\mathcal{K}$ is time reversible i.e. $\pi (y) \mathcal{K}(x \mid y) = \pi(x) \mathcal{K}(y \mid x)$  

## Variants of the M-H algorithm

### Random walk Metropolis-Hastings

Example: the random walk Metropolis-Hastings can be used to sample from a normal distribution.
Let $g$ be a uniform distribution over the interval $(-\delta, \delta)$ $\forall \delta > 0$.

1. Simulate $\epsilon \sim \mathcal{U}(-\delta, \delta)$ and let $y = x + \epsilon$ 
2. Compute
    $$
    \alpha (y \mid x) = min \left( \frac{\phi(y)}{\phi(x), 1} \right)
    $$ where $\phi$ is the stantard normal density.
3. Simulate $u \sim \mathcal{U}(0, 1)$, If $u \leq \alpha(y \mid x)$ then accept $y$ as the next state, otherwise stay on $x$

### Independance Metropolis-Hastings

In this variant, the candidate proposal do not depend on the current state $x$, so $q(y \mid x) = q(y)$.

The bahaviour is the same as the standard algorithm appart from the acceptance ratio that is modified into:

$$
\alpha (y \mid x) = min \left\{ \frac{\pi(y)q(x)}{\pi(x)q(y)}, 1 \right\}
$$

### Slice sampler

### Hit and run sampler

### Single component Metropolis-Hastings
