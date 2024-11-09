# Fast Sweeping Method

!!! quote "Umair Bin Waheed. A fast marching eikonal solver for tilted transversely isotropic media. [@Waheed2020]"

    Fast sweeping methods, on the other hand, solve an eikonal equation by sweeping the computational domain in alternating directions. The idea is that all characteristic directions can be divided into a finite number of groups and each sweeping iteration covers a group of characteristics (Zhao, 2005). The algorithm converges in a finite number of iterations and is more robust and flexible for general equations than the fast marching method.

    The complications associated with using fast marching for the anisotropic eikonal equation resulted in the fast sweeping method being the preferred algorithm for computing traveltimes in anisotropic media (Tsai et al., 2003; Luo and Qian, 2012; Waheed et al., 2015; Le Bouteiller et al., 2019).
