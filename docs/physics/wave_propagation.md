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

The demonstration is done for elastic isotropic and homogeneous media.

#### Starting with Newton's Second Law

In its most basic form, Newton's law states:

$$
F = ma
$$

where:

- $F$ is the force in $N/m$ or in $kg.m.s^{-1}$
- $m$ is the mass subject to acceleration in $kg$
- $a$ is the acceleration of the mass in $m.s^{-1}$

In other words, the force per unit volume is linked to the density of the material:

$$
\frac{F}{V} = \frac{m}{V}.a = \rho a
$$

For a continuous medium, this translates to:

$$
\text{force per unit volume} = \text{mass per unit volume} * \text{acceleration}
$$

The equation for is:

$$
F_{total} = \rho \frac{\partial^2 u}{\partial t^2}
$$

where:

- $\rho$ is the mass per unit volume or material density in $kg/m^3$
- $u$ is the displacement vector, describing motion of particles in the medium in $m$
- $\frac{\partial^2 u}{\partial t^2}$ is the particle acceleration (second derivative of the position with respect to time)

#### Recovering the momentum equation

In a continuous elastic medium, there are two main sources of force acting on a small element of material:

1. Body forces ($F$): external forces like gravity or a seismic source acting throughout the volume of the material.
2. Stress gradient ($\nabla.\tau$): internal forces due to the stress variations within the material. Stress represents how forces are distributed inside the medium and is described by a tensor $\tau$. The gradient of the stress tensor $\nabla.\tau$ gives the net force acting on the element due to stress imbalances.

Therefore, summing these forces give:

$$
F_{total} = \nabla.\tau+F
$$

This equation is the momentum equation, and is the foundation for deriving seismic wave equations.
It says that the motion of a material element is driven by internal stress variations and external body forces.

If internal forces are negligible, then $F$ vanishes and the simplified equations is:

$$
F_{total} = \nabla.\tau
$$

#### Using the stress-strain equation

To solve for the displacement $u$, we need to relate the stress tensor $\tau$ to the dusplacement field $u$.
This is done using Hooke's law for a linear, elastic and isotropic material.

$$
\tau_{ij} = \lambda \delta_{ij} (\nabla . u) + 2 \mu e_{ij} = \lambda \delta_{ij} (\nabla . u) + \mu (\partial_i u_j + \partial_j u_i)
$$

where:

1. **\(\tau_{ij}\)**: Stress Tensor

    - Describes internal forces per unit area within the material.
    - Subscripts \(i\) and \(j\) indicate directions:
        - \(i\): Direction of the force.
        - \(j\): Orientation of the surface on which the force acts.

2. **\(\lambda\) and \(\mu\)**: Lamé Parameters

    - Material-specific constants that describe how a material responds to stress.
    - \(\lambda\): Bulk modulus-related term, governing volume changes.
    - \(\mu\): Shear modulus, governing shape changes (shear deformation).
    - Together, they define the elastic properties of the medium.

3. **\(\delta_{ij}\)**: Kronecker Delta

    - A mathematical tool that equals:

    \[
    \delta_{ij} =
    \begin{cases}
    1, & \text{if } i = j \ (\text{diagonal terms, e.g., \(\tau_{xx}\)}), \\
    0, & \text{if } i \neq j \ (\text{off-diagonal terms, e.g., \(\tau_{xy}\)}).
    \end{cases}
    \]

4. **\(e_{ij}\)**: Strain Tensor

    - Describes deformation of the material:
      - \(e_{ij} = \frac{1}{2} \left( \partial_i u_j + \partial_j u_i \right)\),
      - Symmetric with respect to \(i\) and \(j\),
      - Represents how displacement gradients (\(\partial_i u_j\)) cause material deformation.

5. **\(e_{kk}\)**: Volumetric Strain

    - Sum of the diagonal components of the strain tensor (\(e_{xx} + e_{yy} + e_{zz}\)):

    \[
    e_{kk} = \nabla \cdot \mathbf{u}.
    \]

    - Represents changes in the material's volume (compression or dilation).

**\(\lambda \delta_{ij} e_{kk}\)**:

- Describes the isotropic part of stress (uniform compression or dilation).
- Depends on the volumetric strain \(e_{kk}\).
- Acts only on the diagonal components of \(\tau_{ij}\) (normal stresses).

**\(2\mu e_{ij}\)**:

- Describes the deviatoric part of stress (shape-changing or shearing deformation).
- Depends on the strain tensor \(e_{ij}\).
- Acts on both diagonal and off-diagonal components of \(\tau_{ij}\).

#### To the wave equation

By substituting this stress-strain relationship into the simplified momentum equation, we can derive the equations governing the propagation of seismic waves, ultimately leading to the separation of P-waves and S-waves.

$$
\rho \frac{\partial^2 u}{\partial t^2} = \nabla \cdot \left( \lambda \delta_{ij} (\nabla.u) + \mu(\nabla u + (\nabla u)^T) \right)
$$

If the material is homogeneous (elasticity parameters does not depend on space) $\lambda$, $\mu$ and $\rho$ are constants:

$$
\rho \frac{\partial^2 u}{\partial t^2} = \lambda \delta_{ij} \nabla \cdot (\nabla \cdot u) + \mu \nabla \cdot (\nabla \cdot u) + \mu \nabla \cdot (\nabla u)^T
$$

Simplifications using the vector identity $\nabla \times (\nabla \times u) = \nabla \cdot (\nabla \cdot u) - \nabla^2 u$ can be done.
Also $\nabla^2 u = \nabla \cdot (\nabla u)^T$.

$$
\rho \frac{\partial^2 u}{\partial t^2} = \lambda \delta_{ij} \nabla \cdot (\nabla \cdot u) + \mu \nabla \cdot (\nabla \cdot u) + \mu (\nabla \cdot (\nabla \cdot u) - \nabla \times (\nabla \times u))
$$

Developing:

$$
\rho \frac{\partial^2 u}{\partial t^2} = \lambda \delta_{ij} \nabla \cdot (\nabla \cdot u) + \mu \nabla \cdot (\nabla \cdot u) + \mu \nabla \cdot (\nabla \cdot u) - \mu \nabla \times (\nabla \times u)
$$

And grouping terms in $\nabla \cdot (\nabla \cdot u)$, we get:

$$
\rho \frac{\partial^2 u}{\partial t^2} = (\lambda + 2 \mu) \nabla \cdot (\nabla \cdot u)  - \mu \nabla \times (\nabla \times u)
$$

#### Decomposition in P-waves

Taking the divergence ($\nabla \cdot$) of the wave equation gives the equation for P-waves:

$$
\nabla \cdot \left( \rho \frac{\partial^2 u}{\partial t^2} \right) = \nabla \cdot \left[ (\lambda + 2 \mu) \nabla \cdot (\nabla \cdot u)  - \mu \nabla \times (\nabla \times u) \right]
$$

Since the divergence of a curl is always zero:

$$
\nabla \cdot \left( \rho \frac{\partial^2 u}{\partial t^2} \right) = \nabla \cdot \left[ (\lambda + 2 \mu) \nabla \cdot (\nabla \cdot u) \right]
$$

And that the material is homogeneous:

$$
\rho \frac{\partial^2 (\nabla \cdot u)}{\partial t^2} = (\lambda + 2 \mu) \nabla \cdot \nabla \cdot (\nabla \cdot u)
$$

Lets detail a bit.

The Laplacian, $\nabla^2$, is the natural result of applying divergence twice on a scalar field because of symmetry in second-order partial derivatives (Clairaut's theorem):

$$
\nabla \cdot \nabla \cdot (\nabla \cdot u) = \nabla^2 (\nabla \cdot u)
$$

Simplifying to (homogeneous medium, $\rho$ is constant):

$$
\rho \frac{\partial^2 (\nabla \cdot u)}{\partial t^2} = (\lambda + 2 \mu) \nabla^2 (\nabla \cdot u)
$$

Define $\phi = \nabla \cdot u$.
$\phi$ is a scalar field or scalar potential representing compressional component of the wave.

$$
\rho \frac{\partial^2 \phi}{\partial t^2} = (\lambda + 2 \mu) \nabla^2 \phi
$$

Or:

$$
\frac{\partial^2 \phi}{\partial t^2} = \frac{\lambda + 2 \mu}{\rho} \nabla^2 \phi
$$

Using $\frac{\lambda + 2 \mu}{\rho} = \alpha^2 = V_p^2$ (P-wave velocity) we get the common notation:

$$
\frac{\partial^2 \phi}{\partial t^2} = \alpha^2 \nabla^2 \phi
$$

#### Decomposition in S-waves

Taking the curl ($\nabla \times$) of the wave equation gives the equation for S-waves:

$$
\nabla \times \left( \rho \frac{\partial^2 u}{\partial t^2} \right) = \nabla \times \left[ (\lambda + 2 \mu) \nabla (\nabla \cdot u)  - \mu \nabla \times (\nabla \times u) \right]
$$

The curl of a gradient is always zero:

$$
\nabla \times \left( \rho \frac{\partial^2 u}{\partial t^2} \right) = \nabla \times \left[ - \mu \nabla \times (\nabla \times u) \right]
$$

Lets detail a bit.

Simplifying to (homogeneous medium, $\rho$ and $\mu$ do not depend on space coordinates):

$$
\rho \frac{\partial^2 (\nabla \times u)}{\partial t^2} = - \mu \nabla \times \nabla \times (\nabla \times u)
$$

But we have the vector identity $\nabla \times (\nabla \times u) = \nabla (\nabla \cdot u) - \nabla^2 u$.

Taking the curl of this vector identity gives: $\nabla \times \nabla \times (\nabla \times u) = \nabla \times \nabla (\nabla \cdot u) - \nabla \times \nabla^2 u$.

Lets break down this expression and simplify it:

1. The curl of a gradient is always zero: $\nabla \times \nabla (\nabla \cdot u) = 0$
2. Taking the curl of the Laplacian is equivalent to taking the Laplacian of the curl: $\nabla \times \nabla^2 u = \nabla^2 (\nabla \times u)$

In the end: $\nabla \times \nabla \times (\nabla \times u) = \nabla^2 (\nabla \times u)$.

$$
\rho \frac{\partial^2 (\nabla \times u)}{\partial t^2} = \mu \nabla^2 (\nabla \times u)
$$

Define $\Psi = \nabla \times u$.
$\Psi$ is a vector field or vector potential representing the shear component of the wave.

$$
\rho \frac{\partial^2 \Psi}{\partial t^2} = \mu \nabla^2 \Psi
$$

Using $\frac{\mu}{\rho} = \beta^2 = V_s^2$ (S-wave velocity) we get the common notation:

$$
\frac{\partial^2 \Psi}{\partial t^2} = \beta^2 \nabla^2 \Psi
$$
