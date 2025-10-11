## Monolithic Apps
 Consists of components tightly coupled together. Has to developed, deployed and managed as single entity.
 They run as a single OS process. Changes to one part of application requires re-deployment of whole applications.
 Easy to scale vertically (expensive), hard to scale horizontally(cheaper). Requires deap surgary of application.

 ## Microservices 
  Each component runs as an independent process and communicate with other services through simple well-defined interfaces (APIs).
  Microservices component uses protocal (http) to communicate and these services expose APIs. These protocals are not tied to any specific program
  language.
  Each component can be written in language that is most apporpiate to implement it.

  ## Scaling Microservices.
  We scan scale per service basis.


 ##Important - How containers can isolate processes if they're running on the same operating system?
 This is acheived by two components
 Linux namespaceses (Container belong to a namespace sees its own network interface, filesystem, CPU and memory and so on)
 Linux control groups - Limiting the resources (CPU, Memory, Network bandwidth and so on), amount of system resources a container can use.
                        Can't hog resources consumed by other resources.

 Linux namespaces
 Mount(mnt)
 Process ID(pid)
 Network (net)
 Inter-process communication(IPC)
 UTS
 User ID

Each kind is used to isolate certain group of resources.












 
