# Born Modelling

!!! info "Overview"

    The Born modeling in seismic exploration is a **linearized** approximation of the wave equation used to describe the relationship between the perturbations in the subsurface properties and the resulting perturbations in the recorded seismic data.
    It's named after Max Born, a physicist who contributed to the theory of wave propagation.

## Formulations

### Mathematical Formulation

!!! question "Why Born Modeling?"

    In seismic inversion, the goal is to estimate the subsurface model by comparing observed and modeled seismic data. The Born modeling equation is used iteratively to update the model until the simulated data match the observed data. This process helps in recovering information about subsurface structures, such as the distribution of velocity and density.

!!! info "Born modeling equation"

    $$
    \delta \mathbf{d} = \mathbf{G} \cdot \delta \mathbf{m} = \delta \mathbf{d}(\mathbf{x}, t) = \int_{V} \mathbf{G}(\mathbf{x}, \mathbf{y}, t) \cdot \delta \mathbf{m}(\mathbf{y}) \, d\mathbf{y}
    $$

    Where:

    - $\delta \mathbf{d}$ is the perturbation in the recorded seismic data
    - $\delta \mathbf{m}$ is the perturbation in the subsurface model (changes in velocity, density, or other parameters)
    - $\mathbf{G}$ is the Born operator, representing the linearized relationship between the perturbations in the model and the resulting perturbations in the data
    - $\mathbf{x}$ and $\mathbf{y}$ are spatial coordinates
    - $t$ is time
    - $V$ represents the volume of the subsurface

!!! warning

    Born modeling is based on the assumption that the perturbations in the subsurface are small enough to be treated linearly. This is a reasonable approximation in many cases, especially when dealing with small contrasts in velocity or density.

### Born modelling steps

1. **Wave Equation:**

    Start with the full wave equation describing seismic wave propagation in the subsurface. This is typically a second-order partial differential equation involving the wavefield $p$, velocity $v$, and density $\rho$.

2. **Linearization:**

    Linearize the wave equation by assuming small perturbations in the subsurface properties. This involves expressing the wavefield, velocity, and density as the sum of their background values and perturbations.

3. **Born Approximation:**

    Apply the Born approximation, neglecting higher-order terms in the perturbation series. This leads to a simplified linearized equation that relates the perturbations in the seismic data to the perturbations in the subsurface model.

4. **Born Modeling Equation:**

    Obtain the Born modeling equation of the form $\delta \mathbf{d} = \mathbf{G} \cdot \delta \mathbf{m}$, where $\delta \mathbf{d}$ is the perturbation in the recorded seismic data, $\delta \mathbf{m}$ is the perturbation in the subsurface model, and $\mathbf{G}$ is the Born operator.

### Algorithmic Implementation

1. **Discretization:**
    Discretize the subsurface into a grid or mesh. Represent the wavefield, velocity, and density at each grid point.

2. **Wavefield Computation:**

    Use a numerical method (e.g., finite-difference or finite-element) to solve the linearized wave equation for the perturbed wavefield. This involves updating the wavefield iteratively in time.

3. **Forward Modeling:**

    Compute the perturbed seismic data by applying the Born modeling equation. This involves integrating the Born operator over the subsurface volume.

4. **Inverse Problem:**

    In seismic inversion, compare the perturbed seismic data with the observed data. Adjust the subsurface model iteratively to minimize the misfit between the modeled and observed data.

5. **Model Update:**

    Update the subsurface model using an optimization algorithm (e.g., gradient-based methods). The gradient is computed through the Born modeling process.

6. **Iteration:**

    Repeat the forward modeling and inversion steps iteratively until a satisfactory match between modeled and observed data is achieved.

## Born Operator

- The **Born operator $\mathbf{G}$ describes the sensitivity of the seismic data to changes in the subsurface model**. It depends on the geometry of the acquisition setup, wave propagation characteristics, and the subsurface structure.

- Computation of $\mathbf{G}$ involves solving an [[Eikonal equation]] to calculate travel times and performing integrations over the subsurface volume.

- The efficiency of Born modeling is often enhanced using numerical techniques such as pre-computed Green's functions and parallel computing.
