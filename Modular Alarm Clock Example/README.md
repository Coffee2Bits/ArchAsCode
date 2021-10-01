# Example Modular Yaml AaC Project
This example project explores modular models, implementations, behaviors, and more all in a yaml DSL

## Goals
Some of the core ideas that are being explored here:
* Separating behavior definitions from the models in order to allow modular imports of models without dictating the imported module's behavior in the system.
* Modularizing everything -- Attempting to modularize all aspects of AaC for maximum code re-use.
* Explore using a type and super type system to allow a gradual abstract -> concrete definition process as the architecture goes from modelling to implementation.
* Versioned interface data, as described by the data models, can be leveraged for incremental interface changes in support of iterative development strategies like the strangler pattern.

## Notes
* It's assumed that that the complexity introduced by the module names and versions will be mitigated via a user interface.
* Defining versions could be optional, and if a version isn't defined then the latest module version is used instead.

## Constructs
Predefined constructs/keywords are distinguished by capitalization. 

### System
Describes an abstract system that contains components 

|Field Name| Description|
|----------|------------|
| name | Name of the model |
| components | A list of models with defined behaviors and implementations that constitutes the system |

### Model
Describes an abstract model.

|Field Name| Description|
|----------|------------|
| name | Name of the model |
| version | Semantic version of the module |
| type | The type classification of the module |
| super-type | The super type of the module |
| data-in | incoming data models |
| data-out | outgoing data models |

### Data
Describes a data model that defines the data structures for component and system interfaces.

|Field Name| Description|
|----------|------------|
| name | Name of the data model |
| version | Semantic version of the data module |
| composition | A list of primitive fields or other data models |
