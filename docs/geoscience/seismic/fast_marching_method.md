# Fast Marching Method

!!! info "Overview"

    The Fast Marching Method (FMM) is a numerical algorithm used to solve the [[Eikonal equation]], which describes the travel time of a wavefront through a medium.
    It is particularly useful in seismic modeling, image processing, and various other applications where the evolution of a wavefront needs to be computed efficiently.
    The Fast Marching Method is widely used in applications such as seismic imaging, medical imaging, and computer graphics, where accurate and fast computation of wavefront propagation is essential.

!!! cite "Refer to Sethian (1996) & Sethian (1999) & Rawlinson and Sanbridge (2004) for more details on FMM."

!!! success "Strengths"

    - unconditional stability (robust)
    - low computation time (efficient)
    - handle velocity models of arbitrary complexities
    - computational cost is $o(Nlog(N))$ where N is the number of grid points

!!! error "Weaknesses"

    - Raw FMM can only locate first arrival phases in continuous media
    - Like most of the finite difference Eikonal solvers, struggle with high velocity gradients (adressed Kim and Cook, 1999)
    - Wavefront may have discontinuous travel time gradients (when wavefront self intersect = multi-pathing) and later arriving information is discarded. The Eikonal cannot be easily solved where $\Delta_x T$ is discontinuous because it needs it to be solved... (Adressed Popovici, 1999 using the entropy satisfying upwind scheme "once a point burns, it stays burnt")
    - High wavefront curvature cause accuracy loss because first order FDM struggles at describing this trend
    - Second, the original fast marching algorithm does not work when the group velocity vector is not aligned with the phase velocity vector, as in the case of the TTI eikonal equation [@Waheed2020]

## Overview

Here's a basic overview of how the Fast Marching Method works:

1. **Initialization:**
   - Start with a known source point (or points) where the wavefront originates.
   - Set the travel time at the source point(s) to zero.
   - Assign initial estimates of travel time to neighboring points based on the local velocity information.

2. **Ordered List (Heap):**
   - Maintain an ordered list of grid points (or nodes) based on their current estimates of travel time. A priority queue or heap data structure is often used for this purpose.

3. **Fast Marching:**
   - While the ordered list is not empty:
      - Extract the point with the smallest current estimate of travel time from the list.
      - Update the travel time estimates of its neighbors based on the local velocity information and the Eikonal equation.
      - Reorder the list to maintain its order.

4. **Termination:**
   - Continue the process until the wavefront reaches the desired locations or covers the entire domain.

From Sambridge (2005) [@Rawlindson2005]:

<figure markdown="span">
  ![FMM Principle](https://www.researchgate.net/profile/Malcolm-Sambridge/publication/242120349/figure/fig1/AS:668908654710802@1536491659867/Principle-behind-the-tracking-of-reflection-and-transmission-traveltimes-The-incident.png){target=_blank}
  <figcaption>
    Principle behind the tracking of reflection and transmission traveltimes. The incident wavefront is tracked to all points on the wavefront, before FMM is reinitialised in the incident (for reflection) or adjacent (for transmission) layer.
  </figcaption>
</figure>

<figure markdown="span">
  ![FMM concept](https://www.researchgate.net/profile/Malcolm-Sambridge/publication/242120349/figure/fig2/AS:668908654706707@1536491659898/Tracking-of-a-single-reflection-arrival-through-a-medium-containing-a-single-interface.png){target=_blank}
  <figcaption>
    Tracking of a single reflection arrival through a medium containing a single interface. Wavespeed varies linearly with depth within a layer, so each ray path segment is described by a circular arc. Wavefronts are plotted at 0.4 s intervals in all cases. Receivers are denoted by grey triangles and the source by a dark grey star. (a)-(d) Wavefronts and rays; (e)-(h) traveltime accuracy of four different schemes using four different grid sizes (1000 m, 500 m, 250 m, 125 m).
  </figcaption>
</figure>

## Historical note

Fast marching (Sethian, 1999) and fast sweeping (Zhao, 2005) are the two most commonly used algorithms for numerically solving an eikonal equation. Fast marching methods rely on the fact that the direction of energy propagation of a wavefront, given by the group velocity, is aligned with the direction of wave propagation, given by the phase velocity. While this is true for isotropic media, the phase velocity vector in an anisotropic medium deviates from the group velocity vector. Therefore, the original fast marching algorithm cannot be reliably used to solve the anisotropic eikonal equation. This limitation led to the development of a more generally applicable version of the fast marching method known as the ordered upwind method (Sethian and Vladimirsky, 2003). However, implementation became significantly more complex compared to the original fast marching method, in addition to an increase in the computational cost. [@Waheed2020]

## Equations

!!! quote "Popovici (1999), Chopp (2001), and Popovici and Sethian (2002) [@Popovici2002]"

    $$
    \left[ \sqrt{max(D_a^{-x} T | -D_b^{+x} T| 0) + max(D_c^{-y} T | -D_d^{+y} T| 0) + max(D_e^{-z} T | -D_f^{+z} T| 0)}\right] _{ijk} = s_{ijk}
    $$

    where:

    - Upwind operators are denoted by $D$
    - First order in $-x$ direction (backward FDM) is $$D_1^{-x} T_i = \frac{T_i - T_{i-1}}{\delta x}$$
    - Second order in $-x$ direction (backward FDM) is $$D_1^{-x} T_i = \frac{3T_i - 4T_{i-1} + T_{i-2}}{2\delta x}$$
    - $(i,j,k)$ are Cartesian grid increment variables $(x,y,z)$ coordinate system
    - $a,b,c,d,e,f$ are integer values describing the order of the FDM scheme
    - $\delta x$ is the grid spacing in x
