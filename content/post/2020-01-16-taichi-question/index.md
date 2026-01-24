---
title: "A way to store the 'shape' of a convex polygon and divide them in fix grid in Taichi"
date: 2020-11-06
subtitle: Here is some extra detail about the post.
---

*This is just archiving the post on the forum: https://forum.taichi-lang.cn/t/a-way-to-store-the-shape-of-a-convec-polygon-and-divide-them-in-fix-grid-in-taichi/1247?u=wyq977*

## Main questions

Hi guys, I am having a bit of trouble with describing a polygon in a 2d grid, hoping someone could suggest anything. Thx in advance

I couldn't find a proper way to handle geometry of a cell using immersed boundary method in a fixed grid i.e. 1000 x 1000. My overall goal is to re-implemented the LBIBCell in Taichi. However, it seems pretty difficult to for me to think of a way for the shape of a polygon (cell) in lattice grid in Taichi.

I have the code here: https://github.com/wyq977/taichi_lbibcell.

As shown in the gif on homepage, the simulation went well for Computational fluid dynamics (CFD) using Lattice Boltzmann methods, inspired by LBM_Taichi.

Since I cannot initialize another variable to store upon each iteration, one has to come up with a plan to store a list of points (f32 or f64) and their connection.

Also, because the polygon (cell) are subject to tension/forces between each other, increasing mass (not described here) one has to find a way to re-mesh the polygon and finally divide along the longest axis or a random axis (representing cell division).

To put it simply, one has to come up with the following functionality to describe the reaction-diffusion as well as the fluid dynamics:

1. Find the closest lattice grid `point(i, j)`  to the polygon geometry, (kind of done, see below, i, j are integer
2. Mark the closest as inner or outer
3. Re-mesh the geometry:
    * For example, the 4 points for the cubes are too far away from each other, more points have to be inserted between those 4 points to capture the forces (tension)
4. Divide a polygon along certain axis

In the final version or current LBIBCell, the number of cells are not fixed due to division.

```python
        self.boundary = ti.Vector.field(2, dtype=ti.f32, shape=(4,)) # store 4 points of a cube
```
Currently, I could have one or multiple variables representing multiple polygon (cell) geometry in the beginning. But the problem with that, I limit the resolution of the polygon since I cannot change/re-mesh edges/connection later in simulation.

Ideal situation would be like this:

LBIBCell's way to finding closest grid points, figure of illustration below
1. for each edge (connection) AB, calculate all the coordinates of points that AB intersects with grid line (x=1, 2,... and y = 1,2,..),basically finds the y=ax +b from AB coordinates
2. Finds the closest grid point `p(i, j)` to those intersection
3. Find out the ones that are outside of the polygon

Since polygon like ABCDE may have edges horizontally or vertically align with the gird/axis, a little perturbation will be done before to avoid cases like AB is parallel to x = 0 or y = 0.

![polygon_lbm](draw.jpeg)

Thx you guys in advance and any suggestions would be much appreciated

## Follow-up

Due to the limits on url in the forum for new users: the github issue might be a bit more informative: https://github.com/wyq977/taichi_lbibcell/issues/1

The idea is inspired by the homework:https://forum.taichi-lang.cn/t/homework0/506/26

Credit to them
