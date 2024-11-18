# Wave propagation

## Seismic wave propagation

In 3D isotropic seismic wave propagation, the equations governing **P-waves (compressional waves)** and **S-waves (shear waves)** are derived from the wave equation for elastic media. These equations describe how seismic displacements propagate through an isotropic, homogeneous elastic medium.

---

### General Wave Equation for Elastic Waves

The displacement vector \(\mathbf{u}(\mathbf{r}, t)\) satisfies:

\[
\rho \frac{\partial^2 \mathbf{u}}{\partial t^2} = (\lambda + 2\mu) \nabla (\nabla \cdot \mathbf{u}) - \mu \nabla \times (\nabla \times \mathbf{u}),
\]

where:

- \(\rho\): density of the medium,  
- \(\lambda, \mu\): Lamé parameters,  
- \(\mathbf{u}(\mathbf{r}, t)\): displacement vector,  
- \(t\): time,  
- \(\nabla\): spatial gradient operator.  

---

### P-Wave and S-Wave Components

This general wave equation can be decomposed into P-wave and S-wave components:

---

#### P-Wave Equation (Compressional Wave)

P-waves correspond to the irrotational part of the displacement field, governed by:

\[
\nabla^2 \phi - \frac{1}{\alpha^2} \frac{\partial^2 \phi}{\partial t^2} = 0,
\]

where:

- \(\phi(\mathbf{r}, t)\) is the scalar potential such that \(\mathbf{u}_P = \nabla \phi\),
- \(\alpha = \sqrt{\frac{\lambda + 2\mu}{\rho}}\) is the P-wave velocity.

---

#### S-Wave Equation (Shear Wave)

S-waves correspond to the solenoidal (divergence-free) part of the displacement field, governed by:

\[
\nabla^2 \mathbf{\Psi} - \frac{1}{\beta^2} \frac{\partial^2 \mathbf{\Psi}}{\partial t^2} = 0,
\]

where:

- \(\mathbf{\Psi}(\mathbf{r}, t)\) is the vector potential such that \(\mathbf{u}_S = \nabla \times \mathbf{\Psi}\),
- \(\beta = \sqrt{\frac{\mu}{\rho}}\) is the S-wave velocity.

---

### Full Displacement Field

The total displacement field \(\mathbf{u}(\mathbf{r}, t)\) is the sum of the P-wave and S-wave contributions:

\[
\mathbf{u} = \nabla \phi + \nabla \times \mathbf{\Psi}.
\]

---

### Seismic Wave Velocities

#### P-wave velocity (\(\alpha\))
  
\[
\alpha = \sqrt{\frac{\lambda + 2\mu}{\rho}}
\]

#### S-wave velocity (\(\beta\))

\[
\beta = \sqrt{\frac{\mu}{\rho}}
\]

These velocities depend on the elastic properties (\(\lambda, \mu\)) and density (\(\rho\)) of the medium.

---

### Key Notes

- **Isotropy:** Assumes uniform properties in all directions.
- **Homogeneity:** Assumes constant \(\lambda, \mu, \rho\) in the medium.
- For layered or anisotropic media, additional terms or adjustments are required.

### Demonstration

TODO
