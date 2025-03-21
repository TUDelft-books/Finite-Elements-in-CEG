# General structure

This section guides you through the basic structure of the library. 

## Your Python script
Using the pyJive starts in your own Python script. In that script, two basic steps are required. 

1. **Read the specified properties.** The properties of your model --- like the mesh, the boundary conditions, the material properties and many more --- are stored in the properties file, denoted with the _.pro_ extension. 
2. **Start globdat with `main.jive(properties)`**. With the specified properties, `globdat` can be initialized using the `main.jive()` function. *Globdat* is the communication database between the **models** and the **modules**, and stores the input and output.

## The `main.py` file
The `main.jive()` function is read from the `main.py` file, which contains one function: `jive()`. It starts by taking information from the `declare.py` file and adding it to globdat. If the name of one of the modules is found in the properties file that was provided when calling `main.jive()`,  it will be added to the Module chain. Once everything is added, all modules in the chain are initialized for the given properties. The modules start running, and keep running until one of them gives the _exit_ command, after which the modules are shut down. The function returns globdat.

In other words, `main.py` finds all the models, modules and shapes from `declare.py`, puts the needed modules in a chain based on the information from the properties, also collecting the types (e.g. `model['type'] = 'multi'`, `material['type'] = 'elastic'`, etc.).
With three loops, it calls the three methods that all modules in the chain have: `init()`, `run()`, and `shutdown()`. These are already set up in the basic `Module` class, found in `modules/module.py`. 

## Modules

Modules define _what_ needs to be done, the models take care of the _how_. The two main types of modules currently implemented in PyJive are **solver-type** modules and **post-processing** modules. 

### The `ControlModule` parent class for solvers
The `ControlModule` class can be found in the `modules/controlmodule.py` file. The class inherits from the `Module` class, where the three basic methods are defined as mentioned before: `init`, `run`, and `shutdown`. These methods are further filled in the `ControlModule` class. 

- `init()`: initiates the time step and the different states at zero. It counts the Degrees of Freedom (DOFs) from the given mesh and selects the right models to use in the module at hand. 
- `advance()` this method lets you know what time step is running and saves the state once the result of the time step is accepted. 
- `run()` if a time step is accepted, it continues to the next step and, unless specified otherwise, saves the history of the state. When the specified number of time steps has passed, it returns the _exit_ command. 

### Inheriting from `ControlModule`
Modules that inherit from `ControlModule`, such as `ArclenModule` and `NonlinModule`, have the same structure, but `init()` and `run()` are specified further for the different modules. 

- `init()`: this method now reads relevant parameters form the properties file (e.g. maximum number of iterations), and initializes any needed additinal values, such as `fext` in `ArclenModule`. It also makes space in `globdat` for values it needs to save and/or communicate to the models. 
- `run()`: starts off by counting the DOFs, after which it selects the right model as saved to `globdat`. It then calls `utils`, like the `Constrainer` class, and `advance()`, as defined in `ControleModule`. 
After this setup, modules communicate with the models through the `model.take_action()` method. In the case of `MultiModel`, the specified action is executed for all models as specified in the class. Based on the input of `take_action()`, it calls the right method within the model. 
Example: in module `NonlinModule`, it is specified `model.take_action(act.GETMATRIX0, params, globdat)`, which can be answered in e.g. `ElasticModel` by `self._get_matrix(params, globdat)`, which constructs the $\mathbf{K}$ matrix. 
In short, `take_action()` makes sure that the specified step of the module is executed for the specified model. 
- `shutdown()`: this function can include any final post-processing tasks after the solver finishes running. Right now it is empty.


## Models
Just like how most modules inherit from `Module` (directly or indirectly), the models inherit from the `Model` class, which again just sets up the methods to use in the child classes. The file `models/model.py` also contains the ModelFactory. With the `declare_model()` method, the name with which the model can be called in the properties file is connected to the model, usually through some cound found at the end fo the file. E.g., in `models/dirimodel.py`, class `DirichletModel` is called by specifying `'Dirichlet'` in the properties file. 

These are the main methods found in the models:

- `init()`: this just puts the name of the model there. 
- `take_action()`: this links the actions as received from the module at hand to the corresponding method within the model. 
- `configure()`: reads the needed properties from the .pro file. These are checked, and pre-specified values are put in if there is none specified in the properties file.

Any other methods present in the model are based on the action that the model should be able to perform. All possible actions are defined in the `names.py` file. 

Since you often need multiple models for your problem --- such as one for your material and one for the boundary conditions --- the `MultiModel` class can be used. This model also contains the `take_action()` and `configure()` methods, but they just combine all calls to the models specified within `MultiModel`. Be aware that you still need to specify all the properties of all the models within `MultiModel` in your properties file. 

## Highlighting some files from pyJive
There are a lot of options within pyJive, and there are quite some files. Some you will need more often than others, so here some of the files are introduced.

````{tab-set}
```{tab-item} DiriModel

**Found in `models/dirimodel.py`**

Implements Dirichlet boundary conditions. As input it takes on what nodegroups as specified in your properties file, what values are applied on which degrees of freedom. It also reads how much the increment should be for a given timesignal and delta time.

Actions: `_get_constraints()`, `_advance_step_constraints()`
```

```{tab-item} MultiModel

**Found in `models/multimodel.py`**

In theory, there could just be one big model class which could handle every action from a given module. However, this would be a very cluttered implementation, which would also make it sensitive to errors. This is why the `MultiModel` class can bundle different models together in such a way that it can communicate every call to action from a module to the right subclass.
```

```{tab-item} NeumannModel 

**Found in `models/neumannmodel.py`**

Implements Neumann boundary conditions. Just like `DirichletModel`, it takes the nodegroups the BCs should work on, on what DOF, with what value and if relevant, how much the load should increase for what time signal and time increment.

Actions: `_get_ext_force()`, `_get_unit_force()`, `_advance_step()`.
```

```{tab-item} SolidModel

**Found in `models/solidmodel.py`**

If your material is nonlinear and you can’t use elastic, this is where to go. It takes in more properties through simply the property `'material'`, in which the material properties are specified. 

Actions: `_get_matrix()`, `_get_mass_matrix()`, `_get_body_force()`, `_commit()`, `_check_commit()`, `_get_stresses()`, `_get_strains()`, `_get_stiffness()`.
```

```{tab-item} Constrainer 

**Found in `utils/constrainer.py`**

A class that handles the application of constrains to the as-assembled stiffness matrix and force vector, and returns constrained versions of them, ready for solving.
```

```{tab-item} DOFSpace 

**Found in `utils/dofspace.py`**

Degree of Freedom  management to provide mapping between DOF index and node number, and DOF type.
```
```` 

