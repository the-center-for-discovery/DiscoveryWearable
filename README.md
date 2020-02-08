# DiscoveryWearable
An OSS and Open Schematic repository to create a wearable stress monitoring system for children with neurocognitive disabilities.

---

As of now, the repository has the following structure:

```tex

Discovery_Wearable/
  |
  └───Sensors/
  |     |
  │     └───GSR/
  │     |   │   interface.c
  │     |   │   logger.c
  │     |   │   ...
  |     |
  │     └───Accelerometer/
  │     |   │   interface.c
  │     |   │   logger.c
  │     |   │   ...
  |     |
  │     └───...
  │         │   ...
  │   
  └───Signal_Processing/
  |   │   filter.jl
  |   |   plot.py
  |   │   ...
  |
  └───Data_Visualization/
  │   |   gui.js
  │   |   socket.py
  |   |   database.sql
  │   |   ...
```

Here is an overview of the programming languages used on this repository and in which areas they will be used:


|       Domain       |  Language  |   Standard  |
|:------------------:|:----------:|:-----------:|
|      Hardware      |      C     |     TBD     |
|      Hardware      |   GoLang   |    GoDocs   |
|      Hardware      |   MATLAB   | MATLAB Docs |
|  Signal Processing |   Python   |    PEP-8    |
|  Signal Processing |  JuliaLang |   BlueBook  |
|  Signal Processing |   MATLAB   | MATLAB Docs |
| Data Visualization | JavaScript |   JSDoc-3   |
| Data Visualization |   Python   |    PEP-8    |
| Data Visualization | PostgreSQL |    SQL-99   |

<br>

> *As we move closer to production, most likely we will be narrowing this list down (e.g. such as removing MATLAB, assessing the utility of GoLang and JuliaLang in this context, etc.) and streamlining development/contribution workflow*


