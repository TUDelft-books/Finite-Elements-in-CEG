# Weak form of the problem

In the FE method, before the problem is discretized, the governing equation is rewritten in the so-called **weak form**. In some cases, the weak form can be given a physical intepretation. In solid mechanics, for instance, one can interpret the weak form as an expression for a minimization problem of an energy potential. The weak form is then also referred to as *variational form* in the sense that in the minimization problem a solution is found for which variations in the potential are equal to zero. Here, however, we follow a formal route that arrives at the weak form by recasting the strong form as an integral equation without physical considerations. 

```{figure} .././images/Chapter1/1_3_1.png
---
height: 400px

name: 1_3_1
---
Strong form to weak form 
```

## Derivation of the weak form

In general, the weak form of the problem is derived by multiplying the strong form by a test function, integrating over the domain, and then applying integration by parts on the terms containing derivatives[^integration_by_parts]. In this manner, the order of derivatives appearing in the equations is reduced and the resulting form is symmetric (in general), facilitating a more efficient numerical solution.

Let's put this in practice for the rod equation {eq}`1drod`. The first step is premultiplication of left hand side and right hand side with a test function $w(x)$ and integrating over the domain. Assuming constant $EA$, we get:

$$ -\int_{0}^{L} wEA \frac{\partial^{2} u}{\partial x^{2}}\,dx = \int_0^Lwq\,dx,\quad\forall\quad w$$ (integralform)

The $\forall w$ means that the equality has to hold for all possible test functions $w(x)$. Note that a solution of the *strong form* will indeed satisfy this equation for every function $w(x)$. Conversely, for any $u(x)$ that does not satisfy the strong form anywhere in the domain, it is possible to find a function $w(x)$ for which equation {eq}`integralform` does not hold.

Next, integration by parts is used to get rid of the second order derivative in $u$:

$$ \int_{0}^{L} \frac{\partial w}{\partial x}EA \frac{\partial u}{\partial x}\,dx -w EA \left[\frac{\partial u}{\partial x}\right]_0^L = \int_0^Lwq\,dx,\quad\forall\quad w$$ (1drod_weak)

Note that after integrating by parts, a boundary term appears. 

```{admonition} Integration by parts
Recall the definition of integration by parts in 1D

$$ \int_{0}^{L} \alpha\beta'\,dx = \left[\alpha\beta\right]_0^L-\int_{0}^{L} \alpha'\beta\,dx 
$$

Where the $'$ is used to indicate a derivative with respect to $x$. In our case, we have $\alpha=w$ and $\beta={\partial u}/{\partial x}$. 

Note that this integration by parts definition is related to the product rule of differentiation, which says:

$$
(\alpha\beta)' = \alpha'\beta + \alpha\beta'
$$
```

## Boundary conditions 

We typically distinguish between two[^BC_types] types of boundary conditions:

- **Dirichlet** (or *essential*) boundary conditions, where we enforce the value of the solution. 
- **Neumann** (or *natural*) boundary conditions, where we enforce the flux (or force). 

In the case introduced in the previous section (see Figure {numref}`rodDefinition`), one boundary condition of each type is specified:

- Dirichlet: $u=0$ at $x=0$
- Neumann: $EA \frac{\partial u}{\partial x}=F$ at $x=L$

To enforce Dirichlet boundary conditions we strongly[^weak_bc] prescribe the value of the solution and set the test function to zero at that boundary. This effectively means that the boundary term coming from the integration by parts evaluated at the Dirichlet boundary goes to zero.

$$
{\color{red}w} EA \left.\frac{\partial u}{\partial x}\right|_{x=0} = {\color{red}0} EA \left.\frac{\partial u}{\partial x}\right|_{x=0} = 0
$$ (1drodDirichlet)

To enforce the Neumann boundary condition we just need to replace the value of the prescribed flux (or force) in the boundary term apearing after the integration by parts. This type of boundary condition is often called *natural* as it naturally appears when deriving the weak form.

$$
w {\color{red}EA \left.\frac{\partial u}{\partial x}\right|_{x=L}} = w(L){\color{red}F}.
$$ (1drodNeumann)

Now we can replace equations {eq}`1drodDirichlet` and {eq}`1drodNeumann` into the weak form {eq}`1drod_weak`, and send to the righ-hand site the terms that do not depend on the unknown $u$. This leads us to the final weak form:

$$ \int_{0}^{L} \frac{\partial w}{\partial x}EA \frac{\partial u}{\partial x}\,dx = \int_0^Lwq\,dx + w(L)F,\quad\forall\quad w$$ (1drod_weak_final)

:::{card} Quiz questions
<iframe src="https://tudelft.h5p.com/content/1292102792292432297/embed" aria-label="Natural boundary conditions" width="1088" height="637" frameborder="0" allowfullscreen="allowfullscreen" allow="autoplay *; geolocation *; microphone *; camera *; midi *; encrypted-media *"></iframe><script src="https://tudelft.h5p.com/js/h5p-resizer.js" charset="UTF-8"></script>
:::

<!-- - Link to virtual displacement -->

[^integration_by_parts]: Note that this is not a general rule. There are cases of terms containing derivatives that might not be integrated by parts, typically non-symmetric terms.

[^BC_types]: We can also find Robin type of boundary conditions, which are a mix between Dirichlet and Neumann type, for example: $\alpha u + EA \frac{\partial u}{\partial x}=f$.

[^weak_bc]: We can also enforce Dirichlet boundary conditions in a *weak* sense, by introducing additional terms on the weak form that penalize the difference between the solution and the prescribed value at the boundary. This will not be covered in this chapter.

