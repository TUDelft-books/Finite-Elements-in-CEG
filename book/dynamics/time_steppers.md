$\newcommand{\ba}{\mathbf{a}}$
$\newcommand{\bb}{\mathbf{b}}$
$\newcommand{\bc}{\mathbf{c}}$
$\newcommand{\bff}{\mathbf{f}}$
$\newcommand{\bt}{\mathbf{t}}$
$\newcommand{\bu}{\mathbf{u}}$
$\newcommand{\bw}{\mathbf{w}}$
$\newcommand{\bx}{\mathbf{x}}$
$\newcommand{\bN}{\mathbf{N}}$
$\newcommand{\bB}{\mathbf{B}}$
$\newcommand{\bC}{\mathbf{C}}$
$\newcommand{\bD}{\mathbf{D}}$
$\newcommand{\bM}{\mathbf{M}}$
$\newcommand{\bK}{\mathbf{K}}$

# Time stepping schemes for elasto-dynamics

On the previous page, we have derived the semi-discrete finite element equations for continuum dynamics. Discretization in space was applied, but derivatives with respect to time were maintained. In order to arrive at an algorithm that can be implemented in computer code, time discretization should also be applied. It is possible to perform time-discretization also with shape functions to arrive at the **space-time finite element method**. However, this is not the most common choice. The finite element discretization approach with nodes, elements and shape functions is convenient for discretization in space, but less so for discretization in time. Therefore, in finite element solvers for time-dependent problems, the finite element discretization in space is usually combined with some type of finite difference discretization in time. To solve the governing equations over a certain time interval, finite time increments $\Delta t$ are introduced and the solution $\ba$ is computed for a finite number of time steps.

In this page different algorithms are introduced for the temporal discretization. In every case, the objective is to find the solution vector $\ba_{n+1}=\ba(t_{n+1})$ and, depending on the scheme, its time derivatives $\dot\ba_{n+1} = \dot\ba(t_{n+1})$ and $\ddot\ba_{n+1}=\ddot\ba(t_{n+1})$, assuming that the previous solution with $\ba_{n}=\ba(t_{n})$ and either $\dot\ba_{n}=\dot\ba(t_{n})$ or $\ba_{n-1}=\ba(t_{n-1})$ is known. This implies that for the first time step, initial conditions $\ba_0$ and $\dot\ba_0$ need to be given. 

Starting point is the semi-discrete form, for generality with damping included:

$$
\bM\ddot\ba + \bC\dot\ba + \bK\ba = \bff
$$(steppers-semi-discrete)

We aim to find $\ba(t)$ for given $\bK$, $\bC$, $\bM$ and $\bff(t)$. On the previous page, we have shown how to derive $\bM$ and $\bK$ for continuum dynamics. Note that similar matrices can also be derived for other mechanical systems such as beams, frames, plates or shells. The contents of the matrices will vary, but the semi-discrete equations for dynamics problems can always be expressed as Eq. {eq}`steppers-semi-discrete`.

```{card}
**Main algorithm for dynamic analysis**
^^^
**Require** Stiffness matrix $\bK$; mass matrix $\bM$; external force vector $\bff(t)$; time step size $\Delta t$

**Optional** Damping matrix $\bC$

**Initialize** $n=0$, initial conditions $\ba_0, \dot\ba_0$

- **while** $n<\text{number of time steps}$
    - Compute solution $\ba_{n+1}$ with selected **time stepping scheme**
    - Update velocity $\dot\ba_{n+1}$ (and acceleration $\ddot\ba_{n+1}$)
    - Go to the next time step $n=n+1$

**Return** Nodal displacements for every time step $[\ba_1, \ba_2, \ldots, \ba_n]$ (and velocities, accelerations)
```

This page is about the different options that exist for the time stepping scheme in the algorithm above. The solution is computed with a linear system of equations and involves evaluation of the force vector, either at $t=t_n$ or at $t=t_{n+1}$. 

## Central difference scheme

One of the most popular time stepping schemes makes use of central difference approximations for the first and second order time derivatives at $t_n$. These are: 

$$
\dot\ba_n \approx \frac{\ba_{n+1}-\ba_{n-1}}{2\Delta t}
$$

and 

$$
\ddot\ba_n \approx \frac{\ba_{n+1}-2\ba_n+\ba_{n-1}}{\Delta t^2}
$$

Substituting these expressions into Eq. {eq}`steppers-semi-discrete` at $t=t_n$ gives:

$$
\bM\frac{\ba_{n-1}-2\ba_n+\ba_{n+1}}{\Delta t^2} + \bC\frac{\ba_{n+1}-\ba_{n-1}}{2\Delta t} + \bK\ba_n = \bff_n
$$

With previous solutions known, this equation can be reordered, such that only terms associated with the unknown $\ba_{n+1}$ remain on the left hand side:

$$
\left(\frac{1}{\Delta t^2}\bM + \frac{1}{2\Delta t}\bC\right)\ba_{n+1} = \frac{1}{\Delta t^2}\bM \left(2\ba_n-\ba_{n-1}\right) + \frac{1}{2\Delta t}\bC\ba_{n-1} - \bK\ba_n + \bff_n
$$

Now we arrive at a linear system of equations

$$
\hat\bM\ba_{n+1} = \hat\bff_n
$$(central-difference-system)

with

$$
\hat\bM = \left(\frac{1}{\Delta t^2}\bM + \frac{1}{2\Delta t}\bC\right) \\
$$

and

$$
\hat\bff_n = \frac{1}{\Delta t^2}\bM \left(2\ba_n-\ba_{n-1}\right) + \frac{1}{2\Delta t}\bC\ba_{n-1} - \bK\ba_n + \bff_n
$$

This linear system of equations can be solved step by step in a loop over time steps as shown in the algorithm at the top of this page. This time stepping scheme is referred to as the **central difference scheme**. It counts as an explicit time integration scheme and is very popular. The central difference scheme is particularly powerful in combination with **mass lumping**. The matrix $\hat\bM$ can be made diagonal without too much loss of accuracy. Then the system of equations {eq}`central-difference-system` can be solved at much lower cost than regular linear systems of equations, because the equations are uncoupled. 

```{admonition} Explicit dynamics with finite elements
The central difference scheme is an explicit time integration scheme. Note how we approximated time derivatives at time step $n$ to compute the solution at time step $n+1$. Moreover, for computing $\ba_{n+1}$, we have $\bff_n-\bK\ba_n$ on the right hand side, which is a measure for the force unbalance at $t=t_n$.
```

The central difference scheme is **second order accurate**, which means that the magnitude of the error in the solution due to the time-discretization is proportional to the square of the magnitude of the time increments, or $O(\Delta t^2)$. 

A downside of the central difference scheme is that it is only **conditionally stable**. Time steps need to be chosen sufficiently small to avoid instability in the time integration. This makes the central difference scheme particularly well-suited for fast dynamics problems like impact simulations where the time window of interest is relatively short. 

The time stepping scheme is stable for 

$$
\Delta t \leq  \frac2{\omega^h}
$$

where $\omega^h$ is the highest natural frequency of the discretized system. The critical time step size is in no way related to the time window of interest. If one is interested in simulating the dynamic response over a long period of time, a very high number of time steps may need to be taken, which in some cases offsets the efficiency gain per time step of solving the uncoupled system of equations with lumped mass matrix.  The continuous system has no upper bound for the natural frequencies. The highest eigenfrequency will be inversely proportional to the size of the (smallest) elements in the mesh. This is bad news, theoretically the solution should converge to a unique and exact solution upon mesh-refinement. This is still the case, but only if the mesh-refinement is accompanied with reduction of the time step size. 

For linear elements, the highest natural eigenfrequency is approximately given by:

$$
\omega^h = \frac{2c}{\Delta x}
$$
 
where $c=\sqrt{E/\rho}$ is the wave speed, dependent on Young's modulus $E$ and density $\rho$, and $\Delta x$ is the length of the element. This means that the stability criterion becomes

$$ 
\Delta t \leq \frac{\Delta x}{c}
$$

which is the Courant, Friedrichs, Lewy (CFL) stability condition: the time step has to be smaller than the time it takes for a stress wave to propagate through one element. 

Because of their robustness, explicit dynamics solvers as obtained with the central difference scheme are also used for solving **quasi-static nonlinear equilibrium problems**. The critical time step size is then increased by artificially scaling the mass matrix to contain higher values, which is conceptually allowed because in the end the static solution should be independent of the mass. One should remain careful when using explicit solvers for equilibrium problems. Equilibrium is by definition violated in the dynamic solver and the influence of this on the results cannot be assessed with certainty, although it is possible to get some insight by monitoring the energy balance. 

## Newmark scheme

For slower dynamics problems, the stability requirement from the critical time step can make the central difference scheme impractical. Then **implicit time integration** schemes are to be preferred. For this, the Newmark family of time integration schemes is a popular option. 

Starting point of the Newmark scheme are expressions for $\ba_{n+1}$ and $\dot\ba_{n+1}$ in terms of quantities from the previous time step and $\ddot\ba_{n+1}$: 

$$
\dot\ba_{n+1} &= \dot\ba_n + \Delta t \left((1-\gamma)\ddot\ba_n + \gamma\ddot\ba_{n+1}\right) \\
\ba_{n+1} &= \ba_n + \Delta t\dot\ba_n + \frac{\Delta t^2}{2}\left((1-2\beta)\ddot\ba_n + 2\beta\ddot\ba_{n+1}\right)
$$(newmark-integration)

of which the first can be recognized as a generalized trapezoidal time-integration scheme with parameter $\gamma$, and the second is a similar kind of time-integration rule with parameter $\beta$. 

For defining an implicit time stepping scheme from the Newmark family, we rearrange the expressions in {eq}`newmark-integration` to express $\ddot\ba_{n+1}$ and $\dot\ba_{n+1}$ in terms of $\ba_{n+1}$ as:

$$
\ddot\ba_{n+1} &= \frac{1}{\beta\Delta t^2}\left(\ba_{n+1}-\ba_n\right) - \frac{1}{\beta\Delta t}\dot\ba_n + \left(1-\frac{1}{2\beta}\right)\ddot\ba_n   \\
\dot\ba_{n+1} &= \dot\ba_n + \Delta t\left((1-\gamma)\ddot\ba_n + \gamma\left( \frac{1}{\beta\Delta t^2}\left(\ba_{n+1}-\ba_n\right) - \frac{1}{\beta\Delta t}\dot\ba_n + \left(1-\frac{1}{2\beta}\right)\ddot\ba_n\right)\right)
$$(newmark-derivs)

Setting $\bC$ to zero, substitution into the semi-discrete form at $t=t_{n+1}$ gives:

$$
\bM\left(\frac{1}{\beta\Delta t^2}\left(\ba_{n+1}-\ba_n\right) - \frac{1}{\beta\Delta t}\dot\ba_n + \left(1-\frac{1}{2\beta}\right)\ddot\ba_n\right) + \bK\ba_{n+1} = \bff_{n+1}
$$

which can be rearranged to 

$$
\hat\bK\ba_{n+1} = \hat\bff_{n+1}
$$(newmark-system)

with

$$
\hat\bK = \bK + \frac{1}{\beta\Delta t^2}\bM
$$

and

$$
\hat\bff_{n+1}  =  \bff_{n+1} + \bM\left(\frac{1}{\beta\Delta t^2}\ba_n + \frac{1}{\beta\Delta t}\dot\ba_n + \left(\frac{1}{2\beta}-1\right) \ddot\ba_n\right)
$$

With damping included, the first expression of Eq. {eq}`newmark-derivs` is also used. Still the resulting system of equations can be written as {eq}`newmark-system`, but the expressions for $\hat\bK$ and $\hat\bff$ get additional terms that are associated with $\bC$.



:::{card} Exercise
Derive the expression for $\hat{\bK}$ and $\hat{\bff}_{n+1}$ when damping is not neglected
```{admonition} Solution
:class: tip, dropdown

$$\hat\bK = \bK + \frac{1}{\beta\Delta t^2}\bM + \frac{\gamma}{\beta\Delta t}\bC$$ 

$$
\hat\bff_{n+1} = \bff_{n+1} + \bM\left(\frac{1}{\beta\Delta t^2}\ba_n + \frac{1}{\beta\Delta t}\dot\ba_n + \left(\frac{1}{2\beta}-1\right) \ddot\ba_n\right) \\ 
+ \bC\left(\frac{\gamma}{\beta\Delta t}\ba_n + \left(\frac{\gamma}{\beta}-1\right)\dot\ba_n + \left(\frac{\gamma}{2\beta}-1\right)\Delta t\ddot\ba_n\right)
$$
```
:::

```{admonition} Implicit dynamics with finite elements
The Newmark scheme is an implicit time integration scheme. Here we compute the solution at $t=t_{n+1}$ by evaluating the semi-discrete form at $t=t_{n+1}$. 
```

The Newmark method is **unconditionally stable** for:

$$
2\beta \geq \gamma \geq \frac12
$$

It is **second order accurate** for $\gamma=\frac12$, and first order accurate for all other values of $\gamma$.

It is possible to introduce **damping** with the Newmark parameters, as an alternative to working with a nonzero $\bC$-matrix. Given the uncertainty around appropriate values for $\bC$, avoiding its construction altogether is appealing. By setting $\gamma>\frac12$, numerical damping is introduced, which can be helpful to filter out unphysical oscillations from the computational response. The degree of numerical damping can be controlled through the choice for $\gamma$. However, introducing any numerical damping does come at a price in accuracy, because the order of the time-discretization error becomes $O(\Delta t)$. 


## Generalized-$\alpha$ method

An alternative time integration scheme that allows for **numerical damping while maintaining second order accuracy** is the generalized-$\alpha$ method, also referred to as the Hilbert-Hughes-Taylor (or HHT) method. It involves using a Newmark scheme to solve: 

$$
\bM\ddot\ba_{n+1}+(1-\alpha)\bK\ba_{n+1}-\alpha\bK\ba_n = (1-\alpha)\bff_{n+1}+\alpha\bff_n
$$

If $0\leq\alpha\leq\frac13$ and the Newmark parameters are set to $\gamma=\frac12+\alpha$ and $\beta=\frac14(1+\alpha)^2$ the scheme is second order accurate while the parameter $\alpha$ can be used to control the amount of numerical damping. For $\alpha=0$ the undamped second order accurate Newmark scheme is recovered; increasing $\alpha$ increases the degree of numerical damping. 


