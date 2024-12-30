# pyJive - General structure

This section guides you through the basic structure of the library. 

## Your Python script
Using the pyJive starts in your own Python script. In that script, two basic steps are required. 

1. **Read the specified properties.** The properties of your model - like the mesh, the boundary conditions, the material properties and many more - are stored in the properties file, denoted with the _.pro_ extension. 
2. **Start globdat with main.jive(properties)**. With the specified properties, _globdat_ can be initialized using the main.jive() function. Globdat is the communication database between the **models** and the **modules**, and stores the input and output.

## main.py
The main.jive() function is read from the main.py file, which contains one function: jive(). It starts by taking information from the declare.py file and adding it to globdat. If the name of one of the modules is found in the properties file that was provided when calling main.jive(), jive() will add it to the Module chain. Once everything is added, all modules in the chain are initialized for the given properties. The modules start running, and keep running until one of them gives the _exit_ command, after which the modules are shut down. The function returns globdat.

In other words, main.py finds all the models, modules and shapes from declare.py, puts the needed modules in a chain based on the information from the properties, also collecting the types (e.g. model['type'] = 'multi', material['type'] = 'elastic', etc.).
With three loops, it calls the three methods that all modules in the chain have: **init**, **run**, and **shutdown**. These are already set up in the basic Module class, found in module.py. 

## Modules
### ControlModule class
The ControlModule class can be found in the controlmodule.py file. The class inherits from the Module class, where the three basic methods are defined as mentioned before: **init**, **run**, and **shutdown**. These methods are further filled in the ControlModule class. 

- **init:** initiates the time step and the different states at 0. It counts the Degrees of Freedom (DOFs) from the given mesh and selects the right models to use in the module at hand. 
- **advance:** this method lets you know what time step is running and saves the state once the result of the time step is accepted. 
- **run:** if a time step is accepted, it continues to the next step and, unless specified otherwise, saves the history of the state. When the specified number of time steps has passed, it returns the _exit_ command. 

### Inheriting modules
Modules that inherit from ControlModule, such as ArclenModule and NonlinModule, have the same structure, but **init** and **run** are specified further for the different modules. 

- **init:** this method now reads relevant parameters form the properties file (e.g. maximum number of iterations), and initializes any needed additinal values, such as _fext_ in ArclenModule. It also makes space in globdat for values it needs to save and/or communicate to the models. 
- **run:** starts off by counting the DOFs, after which it selects the right model as saved to globdat by jive(). It then calls _utils_, like the Constrainer class, and _advance_, as defined in ControleModule. 
After this setup, modules communicate with the models through the model.take_action() method. In the case of _multimodel_, the specified action is executed for all models as specified in the multimodel. Based on the input of take_action(), it calls the right method within the model. 
Example: in module NonlinModule, it is specified model.take_action(act.GETMATRIX0, params, globdat), which can be answered in e.g. ElasticModel by self._get_matrix(params, globdat), which constructs the K matrix. 
In short, the take_action makes sure that the specified step of the module is executed for the specified model. 
- **shutdown:** passes.

Modules define _what_ needs to be done, the models take care of the _how_. 

## Models
Just like how most modules inherit from Module (directly or indirectly), the models inherit from the Model class, which again just sets up the methods to use in the child classes. The file model.py also contains the ModelFactory. With the declare_model method, the name with which the model can be called in the properties file is connected to the model, usually through some cound found at the end fo the file. E.g., in dirimodel.py, class DirichletModel is called by specifying 'Dirichlet' in the properties file. 

These are the main methods found in the models:

- **init:** this just puts the name of the model there. 
- **take_action:** this links the actions as received from the module at hand to the corresponding method within the model. 
- **configure:** reads the needed properties from the .pro file. These are checked, and pre-specified values are put in if there is none specified in the properties file.

Any other methods present in the model are based on the action that the model should be able to perform. All possible actions are defined in the names.py file. 

Since you often need multiple models for your problem - such as one for your material and one for the boundary conditions - the MultiModel class can be used. This model also contains the **take_action** and **configure** methods, but they just combine all the take_actions and configures of the models specified within the MultiModel. Be aware that you still need to specify all the properties of all the models within the MultiModel in your properties file. 