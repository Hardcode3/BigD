# Spatial acceleration structrures

## Useful links

[Youtube - Rendering Lecture 1 - Spatial Acceleration Structures](https://www.youtube.com/watch?v=MzUxOe5x24w)

## Why using spacial acceleration structures ?

Scenes in vedeogames or rendering consists of millions or even billions of triangles. In order to compute some distances between any point and any vertex, some inneficient nested loops are required.
This is where spatial data structures are useful.

## The different data structures

### Regular grids

The scene is overlayed by a regular grid and triangles are sorted into cells. Cells are traversed et their content tested, for instance to compute a distance between a point and a triangle in a defined direction.

However, in reality data is not as spatially uniform. One option to solve the problem would be to make the grid finer.
But this can lead to unused cells in the grid, wasting memory space.

### Quad and octrees

They solve the former problems while keeping the advantages.
First we need to start with a scene boundary and then do finer subdivisions only if needed.
Hence, the max subdivision number and minimum number of triangles for spliting are parameters to be defined.
Then a recursive split is made into quadrants (2D - [Quadtree](quadtree.md)) and octants (3D - Octree).
The algorithm is stopped after the defined number of subdivisions is reached or if no cell has more than the defined number of triangles.

### Binary space partition tree (BSP tree)

A recursive split via hyperplanes is done.
Left and right child nodes treat objects in each half space. Note that split can be arbitrary.

### K-dimensional tree (K-d tree)

Is a specialisation of BSP trees where every hyperplane must be perpendicular to a base axis, limiting search space for splits.

### Bounding volumes (AABB, OBB)

The goal here is to encapsulate mesh primitives such as triangles into spheres or more commonly into boxes.
There are two ways to create bouding boxes: axis-aligned bounding boxes (AABB tree) or oriented bounding boxes (OBB).
The main goal is the same as formerly: we want to avoid excessive tests of intersections by quickly telling if there is an intersection or not.

AABB are boxes defined by their two extrema in each dimension.
OBB spheres are described by a radius and a center location.

Bounding volumes can spatially overlap.
