# Numerical Optimization

Optimization techniques are classified into 2 parts:

1. [Local - gradient based optimization algorithms](#local---gradient-based-optimization-algorithms)
2. [Global - non gradient based optimization algorithms](#global---non-gradient-based-optimization-algorithms)

Their purpose is to minimize the objective function for the given variables.

## General scheme

Minimize $f(x)$ where $x \in \mathcal{R}^n$ represents the $n$ design variables modified to obtain the optimum.

Optimum $x$ can be found in an iterative way:

$$
x^q = x^{q-1}+\alpha^* S^q
$$

where q is the iteration index, $S^q$ the search direction at the iteration $q$ and $\alpha^*$ the optimum step size.

!!! note "For most problems, the gradient is not known and is retrieved using finite differences."

    Estimating gradient through FDM has a step-dependent accuracy.
    Automatic differentiation can be used to get accurate precision. Griewank and Walther (2008)

### Karush - Kuhn - Tucker (KKT) condition

This condition is used to determine if a constrained local optimum has been found.
It can be summarized as:

- The optimum design point $x^*$ must be feasible
- At the optimum point, the gradient of the Lagrangian must vanish

    $$
    \nabla f(x^*) + \sum_{j=1}^{m} \lambda_j \nabla g_j (x^*) + \sum_{k=1}^p \lambda_{m+k} \nabla h_k (x^*) = 0
    $$

- For each inequality constraint $\lambda_j g_j (X)=0$ with $j=1, m$

## Local - gradient based optimization algorithms

!!! success "Advantages"

    - Uses the gradient to find optimums
    - Are very popular for their efficiency
    - Can solve problems with large number of variables
    - Require little parameter tuning

!!! error "Drawbacks"

    - Only locate a local optimum
    - Difficulties solving discrete optimization problems
    - Complex algorithms difficult to implement efficiently
    - Susceptible to numerical noise

!!! note The different gradient based algorithms mostly differs in the logic used to determine the search direction.

### Newton's method

The Newton's method is:

- an unconstrained algorithm
- derived from the $2^{nd}$ order Taylor series expansion of the objective function at an initial design point $x^0$
- quadratic convergence rate (quick)

Take the second order Taylor series:

$$
f(x) \approx f(x^0) + \nabla (f(x^0))^T (x-x_0) + \frac{1}{2}(x-x_0)^T H(x^0)(x-x_0)
$$

where $H(x^0)$ is the Hessian matrix containing the second order gradient information of the objective function.

Apply the Karush-Kuhn-Tucker conditions and it simplifies in the classic Newton's method form:

$$
x = x^0 - (H(x^0))^{-1} \nabla f(x^0)
$$

The corresponding search direction is provided by the second member: $- (H(x^0))^{-1} \nabla f(x^0)$.
It has a unit step in this form.

### Unconstrained optimization

Two popular methods:

- Fletcher-Reeves
  - Conjugate gradient method
  - Conjugate search directions are created using information gained from the previous design iteration
- Broyden-Fletcher-Goldfarb-Shanno (BFGS) (quasi-Newton / )
  - Part of the family variable metric method
  - Creates an approximation of the Hessian matrix $(H(x^0))^{-1}$ (therefore a quasi-Newton method)
  - superior mathematically to Fletcher-Reeves but computationally more intensive

### Constrained optimization

- Sequential Unconstrained Minimization Techniques (SUMT), Fiacco and McCormick (1968)
  - The SUMT approach solves the general constrained optimization problem by first converting it to an equivalent unconstrained problem.
  - This equivalent unconstrained problem is then solved using any one of the unconstrained algorithms (Newton, quasi-Newton, etc...)
  - Obtains an equivalent unconstrained problem by penalizing the original objective function for any constraint violations.
  - Have become less popular as the direct (or constrained) methods became more mature and efficient.
- Sequential Constrained - Direct Minimization Techniques
  - Sequential Linear Programming (SLP) algorithm
  - Modified Method of Feasible Directions (MMFD) algorithm
  - Sequential Quadratic Programming (SQP) algorithm

## Global - non gradient based optimization algorithms

Popular examples:

- Nelder-Mead simplex algorithm
  - based on the concept of conjugate directions
- Powell’s method
  - makes use of a simplex and a set of simple rules that reflects the worst vertex through the center of the simplex

Global optimization algorithms may be classified as either evolutionary algorithms or deterministic algorithms.

## Evolutionary algorithms

!!! quote "Venter, 2010"

    Unlike the local techniques, where a single design point is updated (typically using gradient information) from one iteration to the next, these algorithms do not require any gradient information and typically make use of a set of design points (generally referred to as a population) to find the optimum design.

## Deterministic algorithms

There are also many deterministic algorithms developed specifically to solve global optimization problems. 
Many of the global optimization algorithms are specialized to solve only a narrow class of problems. 

!!! quote "One popular general purpose deterministic global optimization algorithm is the DIRECT algorithm by Jones, Perttunen and Stuckman (1993)"

!!! quote "An excellent survey of global optimization algorithms is provided by Neumaier (2004)."

## Newton-Raphson method

1. **Objective**: Minimize the distance function $f(x, y)$.
2. **Define the Function**: Clearly define your distance function $f(x, y)$ in terms of the input parameters $x$ and $y$.
3. **Compute the Gradient and Hessian**:

   - Compute the gradient vector $\nabla f(x, y)$, where each component is the partial derivative of $f$ with respect to $x$ and $y$.
   - Compute the Hessian matrix $H(x, y)$, where each element is the second partial derivative of $f$ with respect to the corresponding variables.

4. **Newton-Raphson Update**:
   - At each iteration $k$, compute the next approximation $(x_{k+1}, y_{k+1})$ using the formula:

     $$
     \begin{bmatrix}
     x_{k+1} \\
     y_{k+1}
     \end{bmatrix}
     =
     \begin{bmatrix}
     x_k \\
     y_k
     \end{bmatrix}
     -
     H(x_k, y_k)^{-1}
     \cdot
     \nabla f(x_k, y_k)
     $$

5. **Termination Criteria**: Continue the iteration until a satisfactory solution is obtained or until a termination criterion is met. This could be based on the magnitude of the gradient, the change in the function value, or a maximum number of iterations.

6. **Optimal Solution**: The solution $(x, y)$ obtained from the Newton-Raphson method represents the point where the distance function is minimized, indicating the point closest to the target.

Keep in mind that the success of the Newton-Raphson method depends on the properties of your function, the choice of initial guess, and potential numerical stability issues. If the function has multiple local minima or other peculiarities, different optimization methods may be considered. Additionally, it's essential to check for convergence and handle cases where the Hessian matrix is singular or nearly singular.

## Newton method

It is indeed possible to use a simplified version of the Newton-Raphson method that only involves the first derivatives (gradients) and the function values. This approach is known as the Newton's method with line search or Newton's method without the Hessian matrix.

Here's how it works:

1. **Objective**: Minimize the distance function $f(x, y)$.

2. **Define the Function**: Clearly define your distance function $f(x, y)$ in terms of the input parameters $x$ and $y$.

3. **Compute the Gradient**:
   - Compute the gradient vector $\nabla f(x, y)$, where each component is the partial derivative of $f$ with respect to $x$ and $y$.

4. **Newton's Method Update**:
   - At each iteration $k$, compute the next approximation $(x_{k+1}, y_{k+1})$ using the formula:

     $$
     \begin{bmatrix}
     x_{k+1} \\
     y_{k+1}
     \end{bmatrix}
     =
     \begin{bmatrix}
     x_k \\
     y_k
     \end{bmatrix}
     -
     \alpha_k \nabla f(x_k, y_k)
     $$

     where $\alpha_k$ is a step size determined by a line search method. Common line search methods include the Armijo rule or the Wolfe conditions.

5. **Termination Criteria**: Continue the iteration until a satisfactory solution is obtained or until a termination criterion is met.

6. **Optimal Solution**: The solution $(x, y)$ obtained from this simplified Newton's method represents the point where the distance function is minimized.

Using only first derivatives simplifies the update rule, but it also means that the method might require more iterations to converge compared to the full Newton-Raphson method with the Hessian matrix. Additionally, choosing an appropriate step size through line search becomes crucial for convergence. Depending on the properties of your specific problem, this simplified approach can still be effective and computationally efficient.

## Conjugate gradient method

Certainly! The conjugate gradient method is an iterative algorithm used to solve systems of linear equations, particularly those arising from the discretization of partial differential equations. It's particularly useful when dealing with large sparse symmetric positive definite matrices, which are common in various scientific and engineering applications.

Here's a simplified explanation of how the conjugate gradient method works:

1. **Initialization**: Choose an initial guess for the solution $x_0$, and set the residual $r_0 = b - Ax_0$, where $A$ is the coefficient matrix of the linear system, and $b$ is the right-hand side vector.

2. **Iteration**:

   - Calculate the direction vectors $p_i$ that are conjugate to each other. Conjugate directions ensure that the method progresses efficiently.
   - Compute the negative gradient direction

    $$
    p_k=-\nabla f(x_k, y_k)
    $$

   - Choose the step size $\alpha_k$​ using a line search method, such as the [[#Armijo rule]] or the [[#Wolf rule]]. This determines how far to move in the negative gradient direction.

    $$
    \begin{bmatrix}
    x_{k+1} \\
    y_{k+1}
    \end{bmatrix}
    =
    \begin{bmatrix}
    x_k \\
    y_k
    \end{bmatrix}
    +
    \alpha_k p_k
    $$

   - Compute the new gradient vector $\nabla f(x_{k+1}, y_{k+1})$
   - Compute the beta value for the conjugate direction

    $$
    \beta_k = \frac{\nabla f(x_{k+1}, y_{k+1})^T \nabla f(x_{k+1}, y_{k+1})}{\nabla f(x_k, y_k)^T \nabla f(x_k, y_k)}
    $$

   - Update the conjugate direction:

    $$
    p_{k+1} = -\nabla f(x_{k+1}, y_{k+1}) + \beta_k p_k
    $$

3. **Termination Criteria**: The process continues until a satisfactory solution is obtained or until a termination criterion is met (such as reaching a certain tolerance level for the residual or a maximum number of iterations).

The key idea behind the conjugate gradient method is to find the solution in a sequence of conjugate directions, which minimizes the error function $\| r_k \|$ in the Euclidean norm.

One of the advantages of the conjugate gradient method is that it typically converges more quickly than other iterative methods for solving linear systems, especially for large, sparse, symmetric positive definite matrices. This efficiency makes it particularly suitable for problems where storage requirements or computational resources are limited.

Overall, the conjugate gradient method provides an efficient and robust approach for solving large linear systems arising from various scientific and engineering applications.

## Choosing the step size - line search

Choosing the step size $\alpha$ in the Newton's method with line search is a crucial aspect of ensuring convergence and efficiency. There are various strategies to determine the step size, and two common methods are the Armijo rule and the Wolfe conditions.

When implementing Newton's method with line search, you typically start with an initial $\alpha$ and iteratively adjust it based on these conditions until they are satisfied. If the conditions are not met, you reduce the step size and try again.

The choice of constants ($c_1$ and $c_2$) can affect the performance, and sometimes different problems may require tuning these parameters. Experimentation and fine-tuning based on the characteristics of your specific optimization problem are common practices.

### Armijo rule

The Armijo rule is a simple and widely used line search method. It ensures that the function value decreases sufficiently along the search direction.

The basic idea is to choose the largest $\alpha$ that satisfies the Armijo condition:
$$
f(x_k + \alpha \nabla f(x_k)) \leq f(x_k) + c_1 \alpha \nabla f(x_k)^T \nabla f(x_k)
$$
where $c_1$ is a small positive constant (usually between 0 and 1) controlling the sufficient decrease in the function value.

### Wolf rule

The Wolfe conditions are more refined and include both a sufficient decrease condition and a curvature condition.

- **Sufficient Decrease (Armijo) Condition**:

$$
f(x_k + \alpha \nabla f(x_k)) \leq f(x_k) + c_1 \alpha \nabla f(x_k)^T \nabla f(x_k)
$$

- **Curvature Condition**:

$$
\nabla f(x_k + \alpha \nabla f(x_k))^T \nabla f(x_k) \geq c_2 \nabla f(x_k)^T \nabla f(x_k)
$$

where $c_1$ and $c_2$ are constants with $0 < c_1 < c_2 < 1$.
The curvature condition ensures that the step size is not too small.

## C++ code structure example for optimization with different backends

```C++
#include <iostream>
#include <Eigen/Dense>
#include <functional>

// Define the objective function to be minimized
double objectiveFunction(const Eigen::VectorXd& x) {
    // Define your objective function here
    // Example: f(x) = x^2
    return x[0] * x[0];
}

// Define the gradient of the objective function
Eigen::VectorXd gradient(const Eigen::VectorXd& x) {
    // Compute the gradient of your objective function here
    // Example: f'(x) = 2*x
    return 2 * x;
}

// Define the Hessian matrix of the objective function (for Newton methods)
Eigen::MatrixXd hessian(const Eigen::VectorXd& x) {
    // Compute the Hessian matrix of your objective function here
    // Example: f''(x) = 2
    return Eigen::MatrixXd::Constant(x.size(), x.size(), 2);
}

// Generic optimization function using different backends
template <typename Optimizer>
Eigen::VectorXd minimize(Optimizer& optimizer, const std::function<double(const Eigen::VectorXd&)>& f,
                         const std::function<Eigen::VectorXd(const Eigen::VectorXd&)>& grad,
                         const std::function<Eigen::MatrixXd(const Eigen::VectorXd&)>& hessian,
                         const Eigen::VectorXd& initialGuess, int maxIterations) {
    // Call the optimization method
    Eigen::VectorXd result = optimizer.minimize(f, grad, hessian, initialGuess, maxIterations);

    return result;
}

// Newton method implementation
class NewtonOptimizer {
public:
    Eigen::VectorXd minimize(const std::function<double(const Eigen::VectorXd&)>& f,
                             const std::function<Eigen::VectorXd(const Eigen::VectorXd&)>& grad,
                             const std::function<Eigen::MatrixXd(const Eigen::VectorXd&)>& hessian,
                             const Eigen::VectorXd& initialGuess,
                             int maxIterations) 
    {
        // Implement the Newton method here
        Eigen::VectorXd x = initialGuess;

        for (int iter = 0; iter < maxIterations; ++iter) {
            // Update x using the Newton method update rule
            x -= hessian(x).ldlt().solve(grad(x));

            // Check for convergence using your criteria
            // Implement your convergence criteria here

            // Break if converged
        }

        return x;
    }
};

int main() {
    // Set your initial guess
    Eigen::VectorXd initialGuess(1);
    initialGuess << 1.0;

    // Use Newton method
    NewtonOptimizer newtonOptimizer;
    Eigen::VectorXd resultNewton = minimize(newtonOptimizer, objectiveFunction, gradient, hessian, initialGuess, 1000);
    std::cout << "Newton Method Result: " << resultNewton[0] << std::endl;

    return 0;
}

```
