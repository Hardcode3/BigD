# Markov Chain - Monte Carlo

!!! quote

    - [7.1 Background | Advanced Statistical Computing (bookdown.org)](https://bookdown.org/rdpeng/advstatcomp/background.html)

## Theory

**A Markov chain is a stochastic process that evolves over time by transitioning into different states.**

The **sequence of states** is denoted by the collection $\{X_{i}\}$.
The **Markov property** tells that:

$$
P(X_{t} \mid X_{t-1}, X_{t-2}, ..., X_{0}) = P(X_{t} \mid X_{t-1})
$$

i.e. we can determine the distribution of the next value only knowing the distribution of the current value.

The collection of states that theMarkov chain can visit is the **state space**.

The quantity governing the probability that the chain moves from one state to another is the **transition kernel or transition matrix** $P_{ij}$

$$
P(X_{n+1} = j \mid X_{n} = i) = P_{ij}
$$

It is possible to get the probability distribution for any number of iterations in the process $n\in\mathbb{N^{*}}$
If there are 3 states: {1, 2, 3}, and at the start, the state is at 3, then the stating probability distribution is denoted by $\pi_{0} = (0, 0, 1)$.

At the first iteration, the probability distribution is $\pi_{1} =\pi_{0} P$
At the $n^{th}$ iteration,
$\pi_{n} =\pi_{0} P^{(n)}$

The markov chain is said to be stationary if $\pi_{\star} =\pi_{\star} P$ and $\lim_{n \rightarrow \infty} \pi_{n} = \pi_{\star}$

There are three asumtions for the Markov chain:

1. The stationarity distribution $\pi_{\star}$ exists 
2. The chain is irreductible meaning that any state can be reached with a certain amount of iterations
3. The chain is aperiodic meaning that it should not visit certain types of numbers depending on the iteration (e.g. visit odd numbers when $n$ is odd etc...)

The Markov chain is time reversible meaning that moving in the 'forward' direction is equal in distribution to the same sequence in the 'backward' direction (called the **local balance equation**):

$$
\pi_{i} P(i, j) = \pi_{j} P(j, i)
$$

## Summary of the MCMC

1. We want to sample from a complicated density $\pi$.
2. We know that aperiodic and irreducible Markov chains with a stationary distribution $\pi$ will eventually converge to that stationary distribution.
3. We know that if a Markov chain with transition matrix $P$ is time reversibile with respect to $\pi$ then $\pi$ must be the stationary distribution of the Markov chain.
4. Given a chain governed by transition matrix $P$, we can simulate it for a long time and eventually we will be simulating from $\pi$.
