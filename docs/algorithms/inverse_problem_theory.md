# Inverse Problem Theory

Inverse problems are opposed to direct problems.

Here the theory is denoted by $g$, the model by $\vec{m}$ and the data by $d$.

## The direct problem

In a direct problem:

$$
set of\ parameters \rightarrow theory \rightarrow prediction
$$

i.e. $$g(\vec{m}) = d$$
This means that a direct problem has a single solution.

Example of direct problem: calculate the travel time of a P-wave.

$$
t = t_{0} \ + \ \frac{\sqrt{(x_{s} - x_{r})^{2} + (z_{s} - z_{r})^{2} }}{V}
$$

## The inverse problem

In an inverse problem:

$$
observed\ or\ synthetic\ data\ \rightarrow model
$$

i.e.

$$\vec{m}=g^{-1}(d)$$

This means that in an inverse problem, there can be multiple solutions.
: $g$ is not bijective.

Over the Gaussian hypothesis, the description of a data having a density of probability $\rho$ is:

$$
\rho(d) = \frac{1}{\sigma \sqrt{2\pi}} exp \left( \frac{-(d - E(d))^{2}}{2 \sigma^{2}} \right)
$$

Knowing the model, it becomes:

$$
\rho(d \mid \vec{m}) = \frac{1}{\sigma \sqrt{2\pi}} exp \left( \frac{-(d - g(\vec{m}))^{2}}{2 \sigma^{2}} \right)
$$

For multiple data sets:

$$
\rho(\vec{d} \mid \vec{m}) = \prod_{i=1}^N \rho(d_i \mid \vec{m})= \prod_{i=1}^N \frac{1}{\sigma_i \sqrt{2\pi}} exp \left( \frac{-(d_i - g_i(\vec{m}))^{2}}{2 \sigma_i^{2}} \right)
$$

When $d=d_{obs}$, this equation is also known as the **likelyhood**:

$$
\rho(\vec{d_{obs}} \mid \vec{m}) = \prod_{i=1}^N \rho(d_{i, obs} \mid \vec{m})= \prod_{i=1}^N \frac{1}{\sigma_i \sqrt{2\pi}} exp \left( \frac{-(d_{i, obs} - g_i(\vec{m}))^{2}}{2 \sigma_i^{2}} \right)
$$

### Bayes theorem and development

The more general expression of an inverse problem is:

$$
\rho (\vec{m} \mid \vec{d_{obs}}) = \frac{\rho(\vec{m}) \rho( \vec{d_{obs}} \mid \vec{m})}{\int\ \rho(\vec{m}) \rho( \vec{d_{obs}} \mid \vec{m}) \ d\vec{m}} = \mathcal{K} \ \rho(\vec{m}) \rho( \vec{d_{obs}} \mid \vec{m})
$$

$$
\rho (\vec{m} \mid \vec{d_{obs}}) = \frac{\mathcal{K} \rho(\vec{m})}{2}  \left( \prod_{i=0}^N \frac{1}{\sigma_i \sqrt{2\pi}} \right) \sum_{i=1}^N exp \left( \frac{-(d_{i, obs} - g_{i}(\vec{m}))^2}{\sigma_i^2} \right)
$$

This defines $\mathcal{X}(\vec{m})$:

$$
\mathcal{X}(\vec{m}) = \frac{(d_{i, obs} - g_{i}(\vec{m}))^2}{\sigma_i^2}
$$

Note that $\mathcal{X}(\vec{m})$ can also be written using a matrix form:

$$
\mathcal{X}(\vec{m}) = 
(\vec{d_{obs}} - \vec{g}(\vec{m}))^T
\begin{pmatrix}
1/\sigma_i^2 & 0 & 0 \\
0 & 1/\sigma_i^2 & 0 \\
0 & 0 & 1/\sigma_i^2
\end{pmatrix}
(\vec{d_{obs}} - \vec{g}(\vec{m}))
$$

$$
\mathcal{X}(\vec{m}) =
(\vec{d_{obs}} - \vec{g}(\vec{m}))^T
\ C_{d}^{-1} \ 
(\vec{d_{obs}} - \vec{g}(\vec{m}))
$$

$C_d^{-1}$ is the covariance matrix of the data. If the data are independent, there are only diagonal coefficients, otherwise extradiagonal coefficients appear.

And then:

$$
\rho (\vec{m} \mid \vec{d_{obs}}) = \frac{\mathcal{K} \rho(\vec{m})}{2}  \left( \prod_{i=0}^N \frac{1}{\sigma_i \sqrt{2\pi}} \right) \sum_{i=1}^N exp \left( - \mathcal{X}(\vec{m}) \right)
$$

If only the covariance matrix $C_d^{-1}$ is diagonal:

$$
\rho (\vec{m} \mid \vec{d_{obs}}) = \frac{\mathcal{K} \rho(\vec{m})}{(2\pi)^{\frac{N}{2}} \sqrt{det\ C_d}}
exp \left( - \frac{1}{2} (\vec{d_{obs}} - \vec{g}(\vec{m}))^T
\ C_{d}^{-1} \ 
(\vec{d_{obs}} - \vec{g}(\vec{m})) \right)
$$

There are now two approaches to solve the inverse problem if $\sigma_i$ is known:

1. The determinist approach consisting in minimizing $\mathcal{X}(\vec{m})$. The final result is a single model that is the closest to the input data $d_{i, obs}$.
2. The probabilistic approach consisting in exploring the space of models and to describe the shape of $\mathcal{X}(\vec{m})$.
3. The stochastic approach testing every set of parameters (inneficient)
