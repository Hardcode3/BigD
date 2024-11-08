# OBJ

## Object format for meshes

## What is a .obj file ?

- A file containing informations about the geometry of 3D objects
- It can support colors and additional informations
- Can be modelled in Blender for example 
- Defined by polygon faces (and so vertexes / points), normals, curves, texture maps and surfaces
- .obj is a vector size meaning there is no maximum file size

## Useful links

!!! quote

    - [Everything You Need to Know About Using OBJ Files](https://www.marxentlabs.com/obj-files/)
    - [Wikipedia](https://en.wikipedia.org/wiki/Wavefront_.obj_file?wprov=sfti1)

## Vertex data

A vertex is a point where the corners of a face / polygon meet.
Vertex statements begin with the letter v and contain the spatial variables x, y, z, one optional variable w and variable values from 0-1

### UV

Defines how a 3D odel is mapped onto a 2D surface such as a computer display and deterine how to apply textures to the 3D object.
They are sometimes called "texture vertexes".
UV statements starts with "vt".

### Vertex normal

Can be constructed using the cross product between two edges in a particular direction.
Defines shading and brightness by indicating the direction of a light source.
Statements starts with "vn" and contains the space variables x, y, z.

### Parameter space vertexes

Free form surface control points.
Statements begin with "vp".

## Surface data

## Element data

Other elements that you can include are points (p), lines (l), faces (f), curves and 2d curves.

## Grouping data

## Display and rendering data attributes
