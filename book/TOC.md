# Finite Elements for Civil Engineering and Geosciences

## 1. Introduction to Finite elements - 1D Laplacian

### 1.1. Introduction and notation
### 1.2. Strong form of the problem
### 1.3. Weak form of the problem 
    - Link to virtual displacement
### 1.4. Galerkin method
    - Using arbitrary FE spaces
### 1.5. Matrix form
### 1.6. Special case for linear Lagrangian shape functions
### 1.7. Isoparametric element in 1D
### 1.8. Numerical integration
### 1.9. Tutorial

### Appendix 1.1. High-order Lagrange polynomials
### Appendix 1.2. Other type of shape functions

## 2. Introduction to numerical analysis of Finite Elements (optional chapter - to develop at the end)

### 2.1. Introduction to functional spaces
### 2.2. Well-posedness of the variational problem
### 2.3. Well-posedness of the discrete problem
### 2.4. Galerkin orthogonality
### 2.5. Convergence
### 2.6. Error estimates

## 3. Finite Elements for linear static problems in CEG applications

### 3.1. 1D problems
#### 3.1.1. Poisson (rod, soil consolidation, ...)
#### 3.1.2. Euler-Bernoulli beam
#### 3.1.3. Timoshenko beam
#### 3.1.4. 1D elements in 2/3D (space-frame structures)

### 3.2. 2D/3D problems
#### 3.2.1. Poisson (potential flow, pressure in saturated soil, temperature distribution, ...)
#### 3.2.2. Linear elasticity in 2D (plane strain, plane stress, isotropic/anisotropic, ...)
#### 3.2.3. Linear elasticity in 3D
#### 3.2.4. Stokes flow
#### 3.2.5. Poroelasticity with Darcy flow

### 3.3. Tutorials

### Appendix 3.1. Linear solvers


## 4. Finite Elements for linear dynamic problems in CEG applications

### 4.1. Numerical methods for ODEs
#### 4.1.1. Taylor series
#### 4.1.2. ODE solver from Taylor series (Forward/Backward Euler)
#### 4.1.3. Type of solvers 
- 1st order: FE/BE, BDF, RK
- 2nd order: Newmark, Generalized-alpha, 2 systems of 1st order
#### 4.1.4. Stability
#### 4.1.5. Time discretization error
#### 4.1.6. Adaptive time stepping

### 4.2. Dynamic problems in 1D
### 4.3. Dynamic problems in 2D/3D
### 4.4. Modal analysis

## 5. Finite Elements for nonlinear problems in CEG applications

### 5.1. Nonlinear solvers (Picard, Newton, arclength, ...)

### 5.2. Geometrically nonlinear problems
#### 5.2.1. 1D structures subject to large deformations
#### 5.2.2. Buckling ?
#### 5.2.3. Hyperelasticity ?

### 5.3. Solids (nonlinear constitutive models)
#### 5.3.1. Plasticity
#### 5.3.2. Damage
#### 5.3.3. Viscoelasticity
#### 5.3.4. Viscoplasticity
#### 5.3.5. Cohesive zone models

### 5.4. Fluids
#### 5.4.1. Convection-Diffusion-Reaction
#### 5.4.2. Shallow water equations
#### 5.4.3. Navier-Stokes equations

### 5.5. Tutorials

## 6. Advanced topics on Finite Elements
### 6.1. Unfitted Finite Elements
### 6.2. Surface-coupled multiphysics problems
### 6.3. Multiphysics 
### 6.3. Multiscale methods
### 6.4. Layout optimization

## 7. Codes
### 7.1 Pyjive
### 7.2 Gridap

