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
$\newcommand{\bN}{\mathbf{N}}$
$\newcommand{\bB}{\mathbf{B}}$
$\newcommand{\bD}{\mathbf{D}}$
$\newcommand{\bK}{\mathbf{K}}$
$\newcommand{\pder}[2]{\frac{\partial #1}{\partial #2}}$
$\newcommand{\iD}{\boldsymbol{\mathcal{D}}}$
$\newcommand{\mbf}[1]{\mathbf{#1}}$
$\newcommand{\mrm}[1]{\mathrm{#1}}$
$\newcommand{\bs}[1]{\boldsymbol{#1}}$
$\newcommand{\T}{^\mathrm{T}}$
$\newcommand{\inv}{^{-1}}$
$\newcommand{\myVec}[1]{\left\{ \begin{matrix} #1 \end{matrix} \right\}}$
$\newcommand{\myMat}[1]{\left[ \begin{matrix} #1 \end{matrix} \right]}$
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


# Linear algebra

In this page we go through a few fundamental linear algebra operations we are going to need in order to derive the Finite Element Method. We start with matrix/vector operations and also touch upon eigenvalue problems and linear systems.

## Matrix/vector operations

We will be using two forms of vector product throughout this book. The **dot product**, also known as inner product or scalar product, is an operation that takes two vectors and produces a scalar. It can be defined as:

$$
c = \ba\cdot\bb = \ba\T\bb = a_ib_i = \displaystyle\sum_i^ma_ib_i
$$(p-l-dotproduct)

where we use tensor notation, matrix/vector notation and index notation, respectively. Refer back to the {doc}`previous page<tensors>` for a recap on these notations.

We will also be using the **outer product**, also known as dyadic product. It takes two vectors and produces a matrix:

$$
\mbf{C} = \ba\otimes\bb = \ba\bb\T = a_ib_j
$$(p-l-outerproduct)

where you should remember that in matrix/vector notation we consider vectors to be in column format, and therefore note how the position of the transpose in $\mbf{b}$ leads to the result being a matrix. 

Multiplying a matrix with a vector results in another vector:

$$
\mbf{c} = \mbf{A}\cdot\bb = \mbf{A}\bb = A_{ij}b_j
$$(p-l-matvecprod)

In index notation, note how the repeated index $j$ is summed over and is therefore eliminated, leading to a vector $\mbf{c}=c_i$.

Matrices can be multiplied in different ways. An operation analogous to the dot product can be defined for matrices:

$$
c = \mbf{A}:\mbf{B} = A_{ij}B_{ij}
$$(p-l-matdotprod)

which results in a scalar and cannot be represented in matrix/vector notation. A similar operation can also be defined between a higher-order tensor and a matrix:

$$
\mbf{C} = \bs{\mathcal{A}}:\mbf{B} = \mathcal{A}_{ijkl}B_{kl}
$$(p-l-tensdotprod)

which results in a matrix. Again note how summing over $k$ and $l$ in index notation leads to a second-order tensor.

We can also define matrix-matrix products, possibly involving the transpose of one of the matrices:

$$
\mbf{C} = \mbf{A}\cdot\mbf{B} = \mbf{A}\mbf{B} = A_{ik}B_{kj}\quad\quad \mbf{C} = \mbf{A}\T\cdot\mbf{B} = \mbf{A}\T\mbf{B} = A_{ki}B_{kj}
$$(p-l-matmatprod)

where tensor notation and matrix/vector notation give the same representation and we therefore do not repeat it. When taking transposes of matrix products, we also often make use of the following result:

$$
(\mbf{A}\mbf{B})\T = \mbf{B}\T\mbf{A}\T
$$(p-l-transprod)

```{admonition} Tensor contractions
:class: tip, dropdown
In tensor notation, we can often determine the dimensionality of the result of an operation by looking at the operator symbol between operands. When the operator contains dots (e.g. $\cdot$, $:$), the number of dots indicates how many dimensions will be summed over, for instance:

$$
\ba\cdot\bb\quad\Rightarrow\quad\,\,\text{one dimension summed over}\quad\,\,\Rightarrow\quad\text{result is a scalar}
$$

$$
\mbf{A}\cdot\bb\quad\Rightarrow\quad\,\,\text{one dimension summed over}\quad\,\,\Rightarrow\quad\text{result is a vector}
$$

$$
\mbf{A}\cdot\mbf{B}\quad\Rightarrow\quad\,\,\text{one dimension summed over}\quad\,\,\Rightarrow\quad\text{result is a matrix}
$$

$$
\mbf{A}:\mbf{B}\quad\Rightarrow\quad\text{two dimensions summed over}\quad\Rightarrow\quad\text{result is a scalar}
$$

$$
\bs{\mathcal{A}}:\mbf{B}\quad\Rightarrow\quad\text{two dimensions summed over}\quad\Rightarrow\quad\text{result is a matrix}
$$

```

Finally we will often deal with inverting matrices. The inverse $\mbf{A}\inv$ of a square matrix $\mbf{A}$ is defined from:

$$
\mbf{A}\inv\mbf{A} = \mbf{A}\mbf{A}\inv = \mbf{I}
$$(p-l-matinverse)

where $\mbf{I}$ is the identity matrix. 

## Eigenvalue problems

For a given square matrix $\mbf{A}\in\mathbb{R}^{m\times m}$, let a set of vectors $\mbf{v}$ and scalars $\lambda$ be defined such that:

$$
\left(\mbf{A}-\lambda\mbf{I}\right)\mbf{v}=\mbf{0}
$$(p-l-eigenvalueproblem)

is satisfied. Then $\lambda$ and $\mbf{v}$ would respectively be the set of **eigenvalues** and **eigenvectors** of $\mbf{A}$. 

A generalized eigenvalue problem is one where the identity matrix $\mbf{I}$ is replaced with a general matrix $\mbf{B}$ of the same size of $\mbf{A}$. 

$$
\left(\mbf{A}-\lambda\mbf{B}\right)\mbf{v}=\mbf{0}
$$(p-l-geneigenvalueproblem)

For certain problems in FEM we will be concerned with finding $\mbf{v}$ and $\lambda$ for such generalized eigenvalue problems, with their physical meanings differing between problems.

## Linear systems of equations

Finite Element formulations will often lead to a linear system of equations of the form:

$$
\mbf{K}\mbf{a}=\mbf{f}
$$(p-l-kuf)

where we have $\mbf{f}$ and $\mbf{K}$ and would like to compute $\mbf{a}$. A trivial solution for this is to do:

$$
\mbf{a} = \mbf{K}\inv\mbf{f}
$$(p-l-ukinvf)

```{admonition} Coding FEM
:class: dropdown

The trivial solution above is extremely computationally inefficient. In FEM, $\mbf{K}$ is usually a matrix of extremely high dimensionality, and inverting it is therefore a costly operation. 

A vast family of solvers exists that can solve for $\mbf{a}$ without having to explicitly invert $\mbf{K}$. Two main types of solver are of common use for FEM:

- Direct solvers: The matrix $\mbf{K}$ is decomposed into a product of two or more matrices (e.g. $\mbf{L}\mbf{U}$ decomposition, $\mbf{L}\mbf{D}\mbf{L}\T$ decomposition) followed by a back-substitution step using the values in $\mbf{f}$. These decompositions involve significantly less operations than computing $\mbf{K}\inv$.
- Iterative solvers: The system is solved in an approximate way through a series of matrix multiplications, iterating from an initial guess and moving along directions in $\mbf{a}$ space informed by $\mbf{K}$ and possibly one or more preconditioner matrices. Examples are Conjugate Gradient (CG) solvers and Generalized Minimal Residual (GMRES) solvers.

Specialized algorithms manage to be even faster in case $\mbf{K}$ is sparse, and also exploit other useful properties of $\mbf{K}$ such as symmetry and bandwidth. There are also solvers that can use multiple processors in parallel to find a solution, and/or run operations faster on GPUs. The search for even faster solvers for FE problems is an active research field.
```

## Quiz Notations and Products

:::{card} Exercise 1
What is the type of the result of the product (scalar/vector/matrix)?

$\mathit{v}_i \cdot \mathit{A}_{ij} \cdot \mathit{w}_j$


```{admonition} Solution
:class: tip, dropdown
Scalar
```
**Exercise 2**

How would you write the product

$\mathit{v}_i \cdot \mathit{A}_{ij} \cdot \mathit{w}_j$

in matrix/vector notation?
```{admonition} Solution
:class: tip, dropdown
$\mathbf{v}^T \cdot \mathbf{A} \cdot \mathbf{w}$
```
**Exercise 3**

What is the type of the result of the following product (scalar/vector/matrix)?

$\mathit{v}_i \cdot \mathit{w}_j$
```{admonition} Solution
:class: tip, dropdown
Matrix
```

**Exercise 4**

How would you write the product

$\mathit{A}_{ij} \cdot \mathit{v}_{i}$

in matrix/vector notation?
```{admonition} Solution
:class: tip, dropdown
$\mathbf{A}^T \cdot \mathbf{v}$
```

**Exercise 5**

How would you write the result of the product

$\mathit{v}_{i} \cdot \mathit{w}_{j}$

in matrix/vector notation?
```{admonition} Solution
:class: tip, dropdown
$\mathbf{v} \cdot \mathbf{w}^T$
```

**Exercise 6**

How would you write the product

$\mathbf{A} \cdot \mathbf{B}^T$

in index notation?
```{admonition} Solution
:class: tip, dropdown
$\mathit{A}_{ik} \cdot \mathit{B}_{jk}$
```
:::
