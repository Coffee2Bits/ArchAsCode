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
* Defining versions could be optional, and if a version isn't defined then the latest module version is used instead. Versioning is primarily focused around supporting importing modules over versioning locally defined modules.
* Systems without implementations specified are identified as logical containers for their components and will inherit any implementation details from a parent system.
* Module imports from remote registries could resemble the scheme developed by docker for identifying containers: {repository}/{organization name}/{package name}:{version}

## Problems
* The data model is duplicated in channel/link definitions and implementation definitions. This is hard to escape since importing/exporting implementations should include interface details (data models), and channels need to define data models as way of describing the system and for validating the implementation/system model. This could potentially be resolved by defining abstract data models for channels and ensuring that services 
* Channels are directional, meaning that they are inherently one-to-one, but that isn't sufficient to describe a pub/sub model where publishing to a topic could lead to not only multiple recipients, but also multiple messages being published depending on stream processing (e.g. an event being processed and resulting in the dissemination of multiple new events).

## Constructs
Predefined constructs/keywords are distinguished by capitalization and placement as the root node/key in a yaml file. 

### System
Describes an abstract system that contains components or other subsystems.  

|Field Name| Description|
|----------|------------|
| name | Name of the model |
| components | A list of models or subsystems with defined behaviors and implementations that constitutes the system |
| links | A list of communication links between system components |

### Link
Describes inter-component and inter-system communication paths.

|Field Name| Description|
|----------|------------|
| name | Name of the model |
| origin | the initiator of a request with a payload described by the data model and implementation |
| target | the component that will receive the request |
| implementation | implementation details for the data link |

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
