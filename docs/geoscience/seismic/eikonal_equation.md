# Eikonal equation

!!! info "Overview"

    The eikonal equation describes the travel time of a seismic wavefront through a medium.
    Its general form is the following:

    $$
    |\Delta u(x) | = F(x)
    $$

    $$
    F(x) in \Omega \in R^2 \space or \space R^3, F(x) 0
    $$

    $u$ is a known function given along a prescribed curve or surface $\Gamma$ in $R^3$.
    The Eikonal is part of a broader Hamilton-Jacobi equations set of the form $\mathcal{H}(u_x,u_y,u_z,x,y,z)=0$.
    The Hamiltonian generalized hamiltonian function is $\mathcal{H}=|\Delta u(x)|-F(x)=0$

## Mathematical expressions

### Isotropic Heterogeneous Eikonal

!!! info "Isotropic Heterogeneous Eikonal"

    $$
    |\nabla T|^2 = \frac{1}{v^2}
    $$

    With:

    - $T$ is the travel time of the seismic wave,
    - $\nabla$ is the gradient operator,
    - $|\nabla T|^2$ represents the squared magnitude of the gradient of the travel time,
    - $v$ is the velocity of the seismic wave, which can vary spatially in heterogeneous media.

Solving this equation provides the travel time information for the seismic wavefront at different locations in the heterogeneous medium.

Numerical methods, such as the [[Fast Marching]] Method or the Fast Sweeping Method, are commonly employed to solve the eikonal equation in practical applications.

## Algorithms to solve the Eikonal equation

There are various numerical methods to solve the Eikonal equation efficiently. Here are some common methods:

1. **Fast Marching Method (FMM):**

    - **Description:** The Fast Marching Method is an efficient algorithm for solving the Eikonal equation. It iteratively updates the travel times from seed points in a wavefront-propagation manner.
    - **Advantages:** Fast and accurate for isotropic and simple anisotropic media.
    - **Limitations:** Less suitable for highly anisotropic media.

2. **Fast Sweeping Method:**

    - **Description:** The Fast Sweeping Method is another approach to solve the Eikonal equation. It involves iteratively sweeping through the grid in a specific order and updating travel times based on neighboring points.
    - **Advantages:** Efficient for parallel computation, suitable for anisotropic media.
    - **Limitations:** May require careful handling of complex boundary conditions.

3. **Level Set Methods:**

    - **Description:** Level Set Methods represent the evolving wavefront as the zero level set of a higher-dimensional function. The Eikonal equation is solved using techniques from level set methods.
    - **Advantages:** Handles evolving interfaces well, applicable to various geometric settings.
    - **Limitations:** Can be computationally demanding.

4. **Fast Iterative Method (FIM):**

    - **Description:** The Fast Iterative Method is an iterative numerical approach to solving the Eikonal equation. It updates the travel times using an iterative process.
    - **Advantages:** Can be computationally efficient, suitable for parallelization.
    - **Limitations:** May require tuning of parameters.

5. **Finite Difference Methods:**

    - **Description:** Finite difference methods can be employed to discretize the Eikonal equation in both space and time. The resulting system of equations is then solved iteratively.
    - **Advantages:** Versatile, applicable to various grid types.
    - **Limitations:** Computational demands may increase with higher accuracy.

6. **Characteristics Method:**

    - **Description:** The Characteristics Method involves solving ordinary differential equations along characteristic curves derived from the Eikonal equation.
    - **Advantages:** Can handle complex velocity models.
    - **Limitations:** Computationally more intensive in certain scenarios.

7. **Fast Iterative Method (FIM):**

    - **Description:** The Fast Iterative Method is an iterative approach to solving the Eikonal equation. It iteratively updates travel times based on local information.
    - **Advantages:** Can be computationally efficient, suitable for parallelization.
    - **Limitations:** Convergence may depend on the problem setup.

8. **Finite Element Methods (FEM):**

    - **Description:** Finite element methods can be adapted to solve the Eikonal equation by discretizing the problem and solving the resulting system iteratively.
    - **Advantages:** Versatile, applicable to complex geometries.
    - **Limitations:** Computational demands may be higher for certain applications.

The choice of method depends on factors such as the nature of the subsurface, the desired level of accuracy, and available computational resources. Fast Marching and Fast Sweeping are particularly popular for their efficiency in many practical scenarios, while other methods may be more suitable for specific applications or complex geological settings.
