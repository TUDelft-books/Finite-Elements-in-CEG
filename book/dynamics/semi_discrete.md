$\newcommand{\beps}{\boldsymbol\varepsilon}$
$\newcommand{\bsig}{\boldsymbol\sigma}$
$\newcommand{\ud}{d}$
$\newcommand{\us}{\mathrm{s}}$
$\newcommand{\ba}{\mathbf{a}}$
$\newcommand{\bb}{\mathbf{b}}$
$\newcommand{\bc}{\mathbf{c}}$
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
$\newcommand{\pder}[2]{\frac{\partial #1}{\partial #2}}$

# Semi-discrete form for elasto-dynamics

On this page, we make a start in deriving finite element formulations for dynamics problems. In previous chapters, solid and structural mechanics problems have been posed as equilibrium problems. This is a special case of the equation of motion where accelerations are assumed to be zero. Here, we release that assumption. Specifically, we will focus on continuum elasticity, where we go from elasto-statics to elasto-dynamics. 

In this page, we go from the strong from to the semi-discrete form. The derivation follows the same line as what is done for the {doc}`diffusion equation<./diffusion>`. The steps are the same as done for deriving the discrete form for {doc}`elasto-statics<../continuum_linear/derivation>`. The difference is that we have one more term in the strong form equation. This terms contains a second order time-derivative, that we will leave undiscretized for now. That is why the result of the derivation is referred to as **semi-discrete**. 

## Strong form

As strong form equation, consider the balance of linear momentum in a continuum, expressed as

$$
\nabla\cdot\bsig + \bb = \rho \ddot\bu
$$(dynamics-strong)

Compared to the strong form for elasto-statics in Eq. {eq}`equilibrium-strong`, the right hand side term is new, which contains the volumetric density $\rho$ and the second time derivative of the displacement field, or the *acceleration field*. 

## Weak form

The first step towards the finite element formulation is to multiply the strong form equation with a vector of test functions. At this step, we also reorder the equation to have everything that is dependent on $\bu$ (or its time-derivative) to the left hand side and the term that is unrelated to $\bu$ (i.e. the term with $\bb$) to the right hand side:

$$
\int_\Omega \bw\cdot\rho\ddot\bu\,d\Omega-\int_\Omega \bw\cdot(\nabla\cdot\bsig)\,d\Omega = \int_\Omega \bw\cdot\bb\,d\Omega
$$(dynamics-preweak)


Next we apply integration by parts on the term involving $\bsig$ and substitute Neumann boundary conditions to arrive at the weak form equation (cf. Eq. {eq}`equilibrium-weak`):

$$
\int_\Omega \bw\cdot\rho\ddot\bu\,d\Omega+\int_\Omega \nabla^\us\bw:\bsig\,d\Omega = \int_\Omega \bw\cdot\bb\,d\Omega + \int_{\Gamma_N}\bw\cdot\bt\,d\Gamma
$$(dynamics-weak)

## Semi-discrete form

Now we introduce the spatial discretization. The displacement field $\bu(\bx)$ is discretized with a set of shape functions as in Eq. {eq}`continuum-discretization`, with the difference that the time-dependence is accounted for. The time-dependence goes into the degree of freedom vector $\ba$, achieving a separation of variables:

$$ 
\bu^h(\bx,t) = \bN(\bx)\ba(t)
$$(dynamics-discretization)

This separation of variables is consistent with the classical interpretation of $\ba$ as the displacement of the nodes. In a dynamics problem, the dependence on time in $\ba(t)$ then represents how the displacement of the nodes changes over time. 

It follows from Eq. {eq}`dynamics-discretization` that the time derivative of $\bu$ is related to the time derivative of $\ba$ as:

$$
\dot\bu^h = \bN\dot\ba
$$

and for the second time derivative

$$
\ddot\bu^h = \bN\ddot\ba
$$

As usual, we substitute $\bw^h=\bN\bc$ for $\bw$ and eliminate $\bc$ to arrive at: 

$$
\left(\int_\Omega \bN^T\rho\bN\,\ud\Omega\right)\ddot\ba + \left(\int_\Omega \bB^T\bD\bB\,\ud\Omega\right) \ba = \int_\Omega \bN^T\bb\,\ud\Omega + \int_{\Gamma_N}\bN^T\bt\,\ud\Gamma
$$(dynamics-discrete-full)

or in short (cf. Eq. {eq}`continuum-discrete-short`):

$$
\bM\ddot\ba + \bK\ba = \mathbf{f}
$$(dynamics-discrete-short)

where $\bK$ and $\mathbf{f}$ are the stiffness matrix and force vector from elasto-statics. The matrix $\bM$ is commonly called the **mass matrix** (note how it is multiplied with nodal accelerations). It is defined as:

$$
\bM = \int_\Omega \bN^T\rho\bN\,\ud\Omega
$$

Unlike in statics, discretization in space is not sufficient to arrive at a linear system of equations, even for an individual time instance. The result in Eq. {eq}`dynamics-discrete-short` contains two vectors with unknowns $\ddot\ba$ and $\ba$. Of course these are related in time, but their values at any given time instance are independent unknowns. On the following page we will show how to exploit their dependency in time to arrive at a linear system of equations for each time step. 

:::{card} Exercise
In derivation of the finite element method, you have become used to using integration by parts to get rid of second derivatives. That is usually applied when there are second derivatives in space. Here, Eq. {eq}`dynamics-preweak` we have the term $\int_\Omega \bw\cdot\rho\ddot\bu\,d\Omega$ and you may wonder why we do not apply integration by parts here. One reason is that the boundary term does not emerge as we are used to. Moreover, even ignoring the term that normally becomes a boundary term which would need to be evaluated at the boundaries of the time domain, the derivation gets stuck when balancing the order of time derivatives in the product between $\bw$ and $\bu$. 

Ignoring the boundary term, show what problem arises in the derivation when replacing $\bw\cdot\rho\ddot\bu$ with $-\dot\bw\cdot\rho\dot\bu$.


```{admonition} Solution
:class: tip, dropdown
We will need the time derivative of $\bw$, with $\bN$ already defined as time-independent, we get $\dot\bw^h=\bN\dot\bc$. After substitution of $\dot\bw^h$, on term in the equation is contains $\dot\bc$ while other terms still have $\bc$. This implies that $\bc$ cannot be eliminated.
```
:::

## Damping

In structural mechanics, some degree of damping can be expected. On the structural scale, the source of damping is not easily included in a theoretically sound way. The strong form equation that was the starting point on this page was therefore one of an undamped system. In the semi-discrete form, it is conceptually clear how damping can be introduced, namely by introducing a term that is proportional to $\dot\ba$: 

$$
\bM\ddot\ba + \bC\dot\ba + \bK\ba = \mathbf{f}
$$(dynamics-discrete-damped)

Where $\bC$ is a damping matrix. Again, sound theories to derive $\bC$ from fundamental principles are lacking. A simple method to construct a meaningful damping matrix is by defining $\bC$ in terms of the known $\bK$ and $\bM$-matrices: 

$$
\bC = \alpha\bK + \beta\bM
$$

in which the choice for $\alpha$ and $\beta$ will be problem-dependent. This is called *Rayleigh damping* and by choosing $\alpha$ and $\beta$ it is possible to control to some extent the relative damping on higher and lower frequencies. 


