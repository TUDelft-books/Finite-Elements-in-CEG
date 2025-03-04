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

# Towards nonlinear problems

In this chapter we make the jump from the relatively simple linear problems we have been treating up until now to a more complex class of **nonlinear** FEM problems.

The final result of our preceding formulations has been a system of equations of the form

$$
\bK\ba=\bff
$$(sn-i-kaf)

which implicitly assumes a linear relationship between $\ba$ and $\bff$. Plotting this for a system with one DOF, that would look like the blue curve in the following plot:

```{figure} ./figures/linvsnonlin.svg
---
height: 200px
name: linvsnonlin
---
Illustrative force-displacement curves coming from linear (blue) and nonlinear (red) simulations.
```

Nevertheless, we are often concerned with nonlinear problems, an example of which is the red curve in the figure above. In this case the mapping between $\ba$ and $\bff$ becomes more complex, and sometimes even non-unique (e.g. in the second plot above). At most, we can define a **tangent** stiffness $K_t$ relating infinitesimal changes in $\ba$ and $\bff$.

The presence of nonlinearities brings substantial changes to the way we approach simulations. Due to the nonlinear and often non-unique mapping between forces and displacements, and due to the fact that $K_t$ represents a **local** approximation of the system, we are now interested in treating the red curve as a path we are trying to follow in an incremental way. This leads to the concept of **following the equilibrium path**, in which we assume the existence of a *pseudotime* along which the physical system being modeled is evolving and obtain a set of equilibrium points that describe this behavior.

```{admonition} What about models with more than one DOF?
:class: dropdown

Load-displacement behavior is usually represented by plotting a single load versus a single displacement. In 1-DOF systems this is all there is to plot, but we also do it for more complex models sometimes comprising millions of DOFs and featuring complicated load shapes. 

There are different ways to still make a 1D representation possible in those cases, but they usually involve taking the average displacement in some region of the model and either summing up all external loads at the same nodes or assuming all loads in the model increase proportionally and plotting a *load factor* instead.
```

Our goal for the rest of this chapter will be to explore nonlinear problems in solid mechanics. We start by going {doc}`back to the weak-form<linearization>` PDE and showing how and where nonlinearities can arise. We then show how to reach a series of linearized equations we can solve in order to {doc}`trace the equilibrium path<solution_algorithms>`. Finally, we dive deeper into {doc}`geometric<geometric_nonlinearity>` and {doc}`material<material_nonlinearity>` nonlinearities.
