# Error control

In the previous section we have seen that the error of the approximation is governed by the time step size. Reducing the time step the error is reduced. In this section we will see how we can define the time step size such that the solution satisfies certain accuracy.

Generally speaking, for an approximation to be accurate it needs to resolve all the scales of the system. A system that results in a solution with small time scales (high frequency), like the blue curve in the figure below, requires smaller time steps than a system with large scales (low frequency), red curve.

```{figure} ./Figures/Large-small-freq.png
---
height: 600px
name: 1_4_1
---
Solutions to system with different characteristic frequencies. 
```

In the [Numerical error](./Error_stability.md) section we found out that the local truncation errors for the solution and its derivative using the Forward-Euler method were

$$\epsilon_u = \left|\frac{\Delta t^2}{2}\ddot{u}_n+\ldots\right|\sim\mathcal{O}(\Delta t^2)$$

$$\epsilon_{\dot{u}} = \left|\frac{\Delta t^2}{2}\dddot{u}_n + \ldots\right|\sim\mathcal{O}(\Delta t^2)$$

Thus, we see that reducing the time step, the local truncation error reduces quadratically. The value of the error will also be governed by $\ddot{u}_n$ and $\dddot{u}_n$. The higher these quantities, the larger the error. Let us now assume that we have a solution where these two quantities have different orders of magnitude during the simulation time, as depicted in the figure below. 

```{figure} ./Figures/variable-freq.png
---
height: 300px
name: 1_4_2
---
Solution with variable characteristic frequency in time. 
```

In that case, the size of a constant time step $\Delta t$ would be limitted by the size required to achieve a prescribed accuracy in the region with highest frequencies. Such a small time step would not be required for the low frequency regions, where we could use a larger time step size to reach the same accuracy. To prevent this issue, we can define variable time step size, $\Delta t(t)$. 

Let us say that we want the error to be smaller than some tolerance $\tau$. Then, we have that at a given time $t_n$

$$ \epsilon_u = \left|\frac{\Delta t_n^2}{2}\ddot{u}_n+\mathcal{O}(\Delta t^3)\right|\leq\tau,$$

$$ \epsilon_{\dot{u}} = \left|\frac{\Delta t_n^2}{2}\dddot{u}_n+\mathcal{O}(\Delta t^3)\right|\leq\tau.$$

Ignoring the higher order terms and solving for $\Delta t$ gives:

$$ \Delta t_n\leq\min\left(\sqrt{2\frac{\tau}{\left|\ddot{u}_n\right|}},\sqrt{2\frac{\tau}{\left|\dddot{u}_n\right|}}\right). $$

In the case of study of this chapter, we can define $\ddot{u}_n$ using the equation of motion: $m\ddot{u}(t)+c\dot{u}(t)+ku(t)=F(t)$. However, we do not have the value of $\dddot{u}_n$. In that case, we can approximate it as

$$ \dddot{u}_n\approx\frac{\ddot{u}_n-\ddot{u}_{n-1}}{\Delta t_{n-1}}. $$

Since the required accuracy of the solution might also depend on the magnitude of the solution, we can define the tolerance in terms of an absolute value and a relative value as follows:

$$ \tau=\max\left(\epsilon_{rel}\left|u_n\right|,\epsilon_{abs}\right). $$
