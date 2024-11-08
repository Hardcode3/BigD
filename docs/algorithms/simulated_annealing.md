# Simulated Annealing

## Links

!!! quote
    [7.5 Simulated Annealing | Advanced Statistical Computing (bookdown.org)](https://bookdown.org/rdpeng/advstatcomp/simulated-annealing.html)

## Theory

Simulated annealing is a techniaue for minimizing functions using [Markov Chain Monte Carlo (MCMC)](obsidian://open?vault=obsidian&file=dev%2Falgorithms%2FMarkov_Chain_Monte_Carlo) samplers.
It is very usefull for wiggly functions that classic Newton-style optimizers can not handle.

Let $h(\theta)$ be the function for which we want to find the minimum.
Let $\theta$ be the vector of parameters in the space $S$.

The idea is to build successive approximations of the target density $\pi(\theta)$ until it is very close to the final one.

Let the uniform distribution over all the global minimizers be such that:

$$
S\star = \{ \theta \in S : h(\theta) = min_{\theta}( h(\theta)) \}
$$

and define

$$
\left\{
	\begin{array}{11}
		\pi(\theta) \propto 1 && \forall \theta \in S \star \\
		\pi(\theta) = 0 &&\forall \theta \notin S \star
	\end{array}
\right.
$$

The uttimate goal is to find a way to sample from ${\pi(\theta)}$.

First begin to build am approximate density called $\pi_{T} (\theta)$ where

$$
\pi_{T}(\theta) \propto exp{\left( \frac{-h(\theta)}{T} \right)}
$$

T is the **temperature**.

1. As $T \rightarrow \infty$, $\pi(T)$ approaches to unifrom density
2. As $T \rightarrow 0$, $\pi(T) \rightarrow \pi(\theta)$

The aim is to draw many samples from $\pi_{T}(\theta)$ initially with a large value of $T$, and to lower $T$ towards $0$ slowly. As we lower $T$, the density $\pi_{T}(\theta)$ will become more and more concentrated around the minima of $h(\theta)$.

The general stategy is to start with a large temperature to explore the whole sample space and then decrease slowly $T$ until the solution converges to a minima.

The sample preocedure is the following:
Choose a symmetric proposal density $q(. \mid \theta)$, then for the iteration $n$ with state $\theta _{n}$:

1. Sample $\quad \theta \star \sim q(\theta \mid \theta_{n})$
2. Sample $\quad U \sim \mathcal{U}(0, 1)$
3. Compute
	$$
	\alpha(\theta \star \mid \theta_{n}) = min \left( \frac{exp(-h(\theta \star)/T)}{exp(-h(\theta_{n})/T)}, 1 \right) = min \left( exp \left( \frac{-(h(\theta \star - h(\theta_{n})}{T} \right), 1 \right)
	$$
4. Accept $\theta \star$ as the next state if $\quad U \leq \alpha (\theta \star \mid \theta_{n})$
5. Decrease the temperature T

If $h(\theta \star) \leq h(\theta_{n})$ then the proposal is always accepted so that the solution converges to the minimum.
If $h(\theta \star) \geq h(\theta_{n})$ then the proposal $\theta \star$ has still a chance to be accepted (even if this solution is greater and we want to find the minima). This allows to avoid getting stuck in a local minima.
As T decreses it becomes less likely that an uphill proposal is accepted (in order to converge to a minima).

A cooling schedule for T has to be choosen, and in general:

$$
T_{n} = \frac{a}{log(n+b)} \quad \forall a, b > 0
$$

This make simulated annealing a very slow algorithm to converge.
