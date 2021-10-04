# Example Modular Yaml AaC Project
This example project explores modular models, implementations, behaviors, and more all in a yaml DSL while providing simplified user experience and an top-down enabled workflow.

## Goals
Some of the core ideas that are being explored here:
* Expand upon the `Modular Alarm Clock Example` project
* Reduce required versioning (Only imported definitions now need them)
* Allow for top-down decomposition

## Notes


## Problems

## Constructs
Predefined constructs/keywords are distinguished by capitalization and placement as the root node/key in a yaml file. 

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
| components | list of sub-models that compose the model |
| channels | list of defined communication paths between sub-models |
| data-in | incoming data models |
| data-out | outgoing data models |

### Data
Describes a data model that defines the data structures for component and system interfaces.

|Field Name| Description|
|----------|------------|
| name | Name of the data model |
| version | Semantic version of the data module |
| composition | A list of primitive fields or other data models |
