# Quad Tree

## General description

### Reference

!!! quote

    This article is based on the work of **Hanan Samet** **'The Quadtree and related hierarchical data structures'** published in **1984**.

### Use cases

Quadtrees are used as a representation of binary images.

### Definitons and properties

#### Definitions

- The term `quadtree` is used to described a class of hierarchical data structures whose common property is that they are based on the principle of recursive decompostion of space. [Samet 1984]
- Quadtrees structures can be differentiated on the following base:
    1. The **type of data they represent**
        - Point data
        - Regions
        - Curves
        - Surfaces
        - Volumes
    2. The principle guiding the **decomposition process**
        - Equal part on each level **regular** decomposition
        - **Irregular** decomposition governed by the input data
        - Tesselation can be done with various samples such as:
            - Squares
            - Equilateral triangles
            - Isoceles triangles
            - Right triangles
            - Hexagons
            - etc...
    3. The **resolution**, variable or not

#### Properties

Any plamar decomposition for image representation should possess the following two properties:

1. Partitions should be infinitely repetitive patterns so it can be used for images of any size
2. Partitions should be infinitely composable into increasingly finer patterns

## Principle

### With region data

- Take the data of a region given by ones if in and 0 if out.
- This region can be represented by a binary image with a specific resolution. The array can be subdivided into four equal-size quadrants. If the resulting subquadrants contains a mix of 0 and 1, they can be divided into more subquadrants just as before. In the end, every quadrant contains only zeroes or only ones.
- Precision can go up to the pixel if necessary.

### Some vocabulary on quadtrees

Fron the former example (region quadtrees), it is possible to define some vocabular:

- The array of pixels is an **image**
- If the image is composed of zeroes or ones only, it is a **binary image**
- If the image is composed of other values, then it is a **gray-scale image**
- The **border of the image** is the outer-boundary of the array
- Four pixels are said to be **4-adjacent** if they are adjacent to each other in the vertical or horizontal directions
- If the concept of adjacency also includes adjacency at a corner (diagonal adjacency), then the pixels are said to be **8-adjacent**
- A **black region** is a maximal 4-connected set of black pixels
- A **white region** is a maximal 4-connected set of white pixels
- A pixel is said to have four edges of unit length
- The boundary of a black region consists of the set of edges of its constituent pixels also being edges for white regions / pixels

### Applications

Quadtrees have many different applications.

- The 'split and merge' algorithm takes an image as input and is splitted with the quadtree structure. Then it is merged given the adjacencies and the output is the map of the boudaries between the original regions of the image.

### Representations

#### Pointer-based trees

##### The quad-tree structure

A tree structure is composed of branches and leafs.
The original point represents the entire image and has four branches / leafs.
Each leaf is then subdivided or not in other branches, giving this tree structure.
In the numerical domain, it corresponds to a node having four pointers, one for each leaf.

##### The binary tree structure

The space is still divided in equaly sized parts but this time, one node has only two leafs and so two pointers to store. It has the advantage to store less nullpointers because some subdivisions are not necessary.

#### Pointerless trees

TODO...
