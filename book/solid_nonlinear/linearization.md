$\newcommand{\E}{\\[3pt]}$
$\newcommand{\DE}{\\[6pt]}$
$\newcommand{\TE}{\\[9pt]}$
$\newcommand{\QE}{\\[12pt]}$
$\newcommand{\eps}{\varepsilon}$
$\newcommand{\beps}{\boldsymbol\eps}$
$\newcommand{\bsig}{\boldsymbol\sigma}$
$\newcommand{\dbdot}{\,\colon\!}$
$\newcommand{\hint}{\displaystyle\int}$
$\newcommand{\hsum}{\displaystyle\sum}$
$\newcommand{\alert}[1]{{\color{pdcolor9}#1}}$
$\newcommand{\gives}{\quad\Rightarrow\quad}$
$\newcommand{\ud}{\mathrm{d}}$
$\newcommand{\uf}{\mathrm{f}}$
$\newcommand{\bff}{\mathbf{f}}$
$\newcommand{\ba}{\mathbf{a}}$
$\newcommand{\bb}{\mathbf{b}}$
$\newcommand{\bc}{\mathbf{c}}$
$\newcommand{\bh}{\mathbf{h}}$
$\newcommand{\bn}{\mathbf{n}}$
$\newcommand{\bq}{\mathbf{q}}$
$\newcommand{\bt}{\mathbf{t}}$
$\newcommand{\bu}{\mathbf{u}}$
$\newcommand{\bv}{\mathbf{v}}$
$\newcommand{\bw}{\mathbf{w}}$
$\newcommand{\bx}{\mathbf{x}}$
$\newcommand{\bB}{\mathbf{B}}$
$\newcommand{\bD}{\mathbf{D}}$
$\newcommand{\bJ}{\mathbf{J}}$
$\newcommand{\bK}{\mathbf{K}}$
$\newcommand{\bM}{\mathbf{M}}$
$\newcommand{\bN}{\mathbf{N}}$
$\newcommand{\bP}{\mathbf{P}}$
$\newcommand{\bzero}{\mathbf{0}}$
$\newcommand{\pder}[2]{\frac{\partial #1}{\partial #2}}$
$\newcommand{\dder}[2]{\frac{\ud #1}{\ud #2}}$
$\newcommand{\pders}[3]{\frac{\partial^2 #1}{\partial #2 \partial #3}}$
$\newcommand{\lder}[2]{{\ud #1}/{\ud #2}}$
$\newcommand{\lpder}[2]{{\partial #1}/{\partial #2}}$
$\newcommand{\lpders}[3]{{\partial^2 #1}/{\partial #2 \partial #3}}$
$\newcommand{\hfrac}[2]{\displaystyle\frac{#1}{#2}}$
$\newcommand{\lfrac}[2]{{#1}/{#2}}$
$\newcommand{\hpder}[2]{\displaystyle\frac{\partial #1}{\partial #2}}$
$\newcommand{\myVec}[1]{\left\{ \begin{matrix} #1 \end{matrix} \right\}}$
$\newcommand{\myMat}[1]{\left[ \begin{matrix} #1 \end{matrix} \right]}$
$\newcommand{\sym}{\ensuremath{_\mathrm{s}}}$
$\newcommand{\dg}{\ensuremath{^\circ}}$
$\newcommand{\mbf}[1]{\mathbf{#1}}$
$\newcommand{\mrm}[1]{\mathrm{#1}}$
$\newcommand{\bs}[1]{\boldsymbol{#1}}$
$\newcommand{\T}{^\mathrm{T}}$
$\newcommand{\dOmega}{\,\mathrm{d}\Omega}$
$\newcommand{\dGamma}{\,\mathrm{d}\Gamma}$
$\newcommand{\us}{\mathrm{s}}$

$\newcommand{cA}[1]{\textcolor[RGB]{1,113,136}{#1}}$
$\newcommand{cB}[1]{\textcolor[RGB]{195,49,47}{#1}}$
$\newcommand{cC}[1]{\textcolor[RGB]{0,102,162}{#1}}$
$\newcommand{cD}[1]{\textcolor[RGB]{0,183,211}{#1}}$
$\newcommand{cE}[1]{\textcolor[RGB]{0,163,144}{#1}}$
$\newcommand{cF}[1]{\textcolor[RGB]{97,164,180}{#1}}$
$\newcommand{cG}[1]{\textcolor[RGB]{130,215,198}{#1}}$
$\newcommand{cH}[1]{\textcolor[RGB]{153,210,140}{#1}}$
$\newcommand{cI}[1]{\textcolor[RGB]{235,114,70}{#1}}$
$\newcommand{cJ}[1]{\textcolor[RGB]{241,190,62}{#1}}$
$\newcommand{cK}[1]{\textcolor[RGB]{231,41,138}{#1}}$

# Linearized discrete form

In this page we go back to the weak form of the equilibrium PDE and offer a reinterpretation of the left-hand size of the discrete form as an equilibrium between internal and external forces. Then we focus on the internal force and show how it can take the form of a complex function of the DOF vector $\ba$.

## Virtual work interpretation

We start with the expression for the weak form we {doc}`previously derived<../continuum_linear/derivation>`:

$$
-\displaystyle\int_\Omega \nabla^\us\bw : \bsig \dOmega + \int_\Omega \bw\cdot\bb\dOmega +\int_{\Gamma_N}\bw\cdot\bt\dGamma = \bzero, \quad\forall\quad\bw
$$(sn-l-weakform1)

where we employ a weight function $\bw$ with no physical interpretation, and one that in principle is only introduced so it can "absorb" the divergence from $\bsig$ and allow us to obtain new solutions with lower-order differentiability.

Another way to reach the same weak form is by using the **virtual work** principle. From the expression above we can easily reach it by just substituting $\bw$ for a *virtual displacement* $\delta\bu$:

$$
-\displaystyle\int_\Omega \nabla^\us\delta\bu \dbdot \bsig \dOmega + \int_\Omega \delta\bu\cdot\bb\dOmega +\int_{\Gamma_N}\delta\bu\cdot\bt\dGamma = \bzero, \quad\forall\quad\delta\bu
$$(sn-l-weakform2)

which should be valid for any **admissible** virtual displacement $\delta\bu$, i.e. any arbitrarily small variation in displacement that does not violate Dirichlet boundary conditions. This is also a reinterpretation of the constraint on $\bw$ we enforced before, namely that $\bw=0$ at $\Gamma_D$.

By recognizing that the gradient of a virtual displacement can be seen as a *virtual strain* (i.e. $\nabla^\us\delta\bu=\delta\beps$), we arrive at:

$$
\underbrace{-\displaystyle\int_\Omega \delta\beps \dbdot \bsig \dOmega}_{W_\mrm{int}} + \underbrace{\displaystyle\int_\Omega \delta\bu\cdot\bb\dOmega +\displaystyle\int_{\Gamma_N}\delta\bu\cdot\bt\dGamma}_{W_\mrm{ext}} = \bzero, \quad\forall\quad\delta\bu
$$(sn-l-weakform3)

where we now see two terms with clear physical interpretation. The weak form can therefore be seen as a balance between an internal work driven through deformation and an external work related to the loads applied to the body. To reach the discrete form we introduce $\delta\bu = \bN\delta\ba$ and $\delta\beps = \bB\delta\ba$ and use Eq. {eq}`p-l-transprod` to remove $\delta\ba$ from the integrals:

$$
\delta\ba\T\underbrace{\displaystyle\int_\Omega \bB\T\bsig\dOmega}_{\bff_\mrm{int}} = \delta\ba\T\underbrace{\left( \displaystyle\int_\Omega \bN\T\bb\dOmega +\displaystyle\int_{\Gamma_N}\bN\T\bt\dGamma \right)}_{\bff_\mrm{ext}}
$$(sn-l-discreteform1)

We see terms being multiplied by displacements on both sides of the equation above. From the definition of work, these terms must represent **forces**, one representing **internal** forces and the other **external** forces. After elimination of $\delta\ba$ we therefore have the following system of equations:

$$
\bff_\mrm{int}\left(\ba\right) = \bff_\mrm{ext}
$$(sn-l-discreteform2)

and by solving the discrete form for $\ba$ we are enforcing equilibrium between them. We immediately see that $\bff_\mrm{int}$ is a function of $\ba$, and from the discussion on {doc}`the previous page<introduction>` we know this must be the term from which nonlinearities can arise. 

```{admonition} Flashback to linear problems
:class: dropdown
Although we are setting the scene for nonlinear problems, it is good to point out that the expression in Eq. {eq}`sn-l-discreteform2` is for linear problems equivalent to what we have seen before. Substitution of $\bsig=\bD\bB\ba$ into the expression for $\bff_\mrm{int}$ from Eq. {eq}`sn-l-discreteform1` and moving $\ba$ out of the integral gives the familiar left hand side expression:

$$
\bff_\mrm{int}\left(\ba\right) = \displaystyle\int_\Omega \bB\T\bD\bB\dOmega\,\ba
$$

which makes $\bff_\mrm{int}=\bff_\mrm{ext}$ take the form of a linear system of equations  $\bK\ba=\bff_\mrm{ext}$. 
```

As we will see in the next page, solving Eq. {eq}`sn-l-discreteform2` will involve iterative linearizations of the form:

$$
\widetilde{\bff}_\mrm{int}(\ba) = \bff_\mrm{int}(\ba_\mrm{o}) + \cB{\hpder{\bff_\mrm{int}}{\ba}}\left(\ba-\ba_\mrm{o}\right)
$$(sn-l-linearization0)

and it therefore suffices to look at the term in red.

## Consistent linearization of $\bff_\mrm{int}$

To start off, we restate the expression for the internal force:

$$
\bff_\mrm{int} = \displaystyle\displaystyle\int_\Omega\bB\T\bsig\dOmega
$$(sn-l-linearization1)

and take its derivative with respect to $\ba$. Using the chain rule and the result $(fg)'=f'g+fg'$ for the derivative of a product, we get:

$$
\hpder{\bff_\mrm{int}}{\ba} = \displaystyle\int_\Omega \pder{\bB\T}{\ba}\bsig \dOmega + \int_\Omega\bB\T\pder{\bsig}{\beps}\pder{\beps}{\ba} \dOmega
$$(sn-l-linearization2)

and recalling that $\bB=\hpder{\beps}{\ba}$ we reach:

$$
\hpder{\bff_\mrm{int}}{\ba} = \displaystyle\int_\Omega \pder{\bB\T}{\ba}\bsig\dOmega + \int_\Omega\bB\T\pder{\bsig}{\beps}\bB \dOmega
$$(sn-l-linearization3)

which is a general expression for a **tangent stiffness** following from consistent linearization. This expression already hints at which terms can give rise to nonlinearities, but to make that clear we start at linear elasticity again and work our way back.

## Sources of nonlinearity

For linear elasticity, we can further simplify Eq. {eq}`sn-l-linearization3` by noting that $\beps=\bB\ba$ and $\bsig=\bD\beps$, and therefore:

$$
\displaystyle\pder{\bB\T}{\ba} = \mbf{0},\quad\hpder{\bsig}{\beps} = \bD
\quad\Rightarrow\quad
\bK = \int_\Omega\bB\T\bD\bB \dOmega
$$(sn-l-linearelasticity)

We see that to get back to linearity we had to assume that both $\bB$ and $\bD$ were constant. Relaxing each of these assumptions in turn can therefore lead to **two distinct sources** of nonlinearity:

```{card}
**Geometric nonlinearity**
^^^
The mapping between displacements and strains is nonlinear, which is equivalent to saying that $\bB$ is a function of $\ba$.

An example is the so-called *true strain*, given by:

$$
\beps = \ln\left(1+\nabla\bu\right)
$$
```

```{card}
**Material nonlinearity**
^^^
Also referred to *physical* nonlinearity. Here the mapping between strains and stresses is nonlinear, which is equivalent to saying that $\bD$ is a function of $\beps$.

Nonlinear material models are often also a function of strain **history**:

$$
\bsig=\bsig(\beps,\mrm{history})
$$
```

Different problems of interest will feature different types of nonlinearity, and sometimes both types will be present at once. We will come back to these two types later, but in order to solve for the equilibrium path it suffices for now to assume that the stiffness $\bK$ changes with $\ba$ in some way.

```{admonition} Tangent matrices
For the next pages, we assume $\hpder{\bff_\mrm{int}}{\ba}\equiv\bK$ and $\hpder{\bsig}{\beps}\equiv\bD$, which means that $\bK$ and $\bD$ will denote **tangent** matrices arising from consistent linearization.
```
