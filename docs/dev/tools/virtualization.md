# Virtualization

!!! info

    Virtualization is the emulation of a physical computer using a software called hypervisor.

    It allows to run multiple virtual computers on the same physical computer.

    The operating system (OS) already runs on a virtual computer, and have no way to make the difference between a physical and a virtual computer.

    The key components of the virtualization are:

    - Hypervisor
    - Virtual machines
    - Host machines
    - Guest operating systems

## Hypervisors

!!! quote "ByteByteGo.com"

    A hypervisor is software that runs above the physical server or host.
    
    It pools the host’s resources and allocates them to virtual machines (VMs).

### Type 1 Hypervisor (Bare Metal)

 A Type 1 hypervisor installs directly on the physical server.
 They are also called bare metal hypervisors. Type 1 hypervisors are the most common. They provide better security and lower latency.

 ![bytebytego_gif](https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F5a0adc43-7db3-4eda-bb80-acf8ca16378f_3900x3000.png){target=_blank title="Bare Metal Hypervisors"}

 Examples:

- VMware ESXi
- Microsoft Hyper-V
- Open source KVM

### Type 2 Hypervisor (Hosted)

A Type 2 hypervisor runs on top of a host operating system installed on the physical server.
They are also called hosted hypervisors. Type 2 hypervisors see less frequent use, mainly for end-user virtualization. They have higher latency than Type 1 hypervisors.

![bytebytego_gif](https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fc4245a43-e87b-4cc7-b3ab-588f21327fd9_3900x3409.png){target=_blank title="Hosted Hypervisors"}

Examples:

- Oracle VirtualBox
- VMware Workstation

## Virtual Machine (VM)

!!! info "What is a Virtual Machine?"

    A virtual machine (VM) is a software-based emulation of a physical computer, running an entire operating system and applications within a completely isolated environment.

    VMs use hardware-level virtualization through a hypervisor to create and run virtual machines.

!!! success "Benefits of VMs"

    - `Isolated` between the host and the virtual machine
    - `Multi-OS capability`: can run different operating systems (e.g., Windows, Linux) simultaneously on the same hardware.
    - `Environment replication`: great for testing, development, and running legacy applications in a controlled environment without impacting the host.
    - `Controlled ressource allocation`: VMs can be allocated specific amounts of CPU, memory, and storage, making them predictable in resource usage.
    - `Portability`: can be easily moved, copied, or backed up as files, simplifying disaster recovery and scaling.
    - `Security`: since each VM is isolated, a crash or compromise in one VM doesn't affect others or the host system.
    - `Cost efficiency`: allows better utilization of hardware by running multiple VMs on the same physical server, reducing the need for additional physical machines.

!!! failure "Drawbacks of VMs"

    - `Resource intensive`: require significant memory, CPU, and storage since each VM runs its own OS. This can lead to overhead.
    - `Performance overhead`: the hypervisor adds a layer between the hardware and VMs, which can cause slower performance compared to running applications directly on the host OS.
    - `Long startup time`: needs to iunitialize a full OS
    - `Complex management` when dealing with large-scale VMs
    - `License cost`: each VM needs its own OS license
    - `Limited scalability` when dealing with loads compared to lightweight solutions like containers.

## Containers

!!! info "What is a container?"

      Containers share the host OS kernel and isolate applications at the process level: a container is a process of the host machine.

      They don't include a full OS, just the necessary libraries and dependencies.
      
      This makes them lightweight and fast.

      Containers use OS-level virtualization, where the container runtime (like Docker) isolates processes without the need for a separate OS.

!!! success "Benefits of containers"

    - `Lightweitgh`: containers share the host OS kernel, requiring fewer resources compared to virtual machines. They start quickly and use less memory and CPU than VMs.
    - `Portiability`: A containerized application can run consistently across different environments (development, testing, production) without compatibility issues.
    - `Scalability`: Containers are designed for rapid scaling. You can deploy, replicate, or terminate containers quickly to handle changing workloads.
    - `Resource Efficiency`: Containers use only the resources they need for the application and dependencies, avoiding the overhead of a full operating system (unlike VMs).
    - `Isolation`: Applications in containers run in isolated environments, ensuring that dependencies or conflicts don't affect other containers or the host.
    - `Microservices Architecture`: Ideal for breaking applications into smaller, manageable microservices, which can be developed, deployed, and scaled independently.
    - `Continuous Integration/Continuous Deployment (CI/CD)`: Containers integrate seamlessly with DevOps tools, making automation in building, testing, and deploying applications easier.

!!! failure "Drawbacks of containers"

    - `Weaker isolation than VMs`: Containers share the host OS kernel, so they are less isolated than virtual machines. A vulnerability in the host OS or runtime (like Docker) can affect all containers.
    - `Limited Multi-OS Capability`: Containers use the host OS kernel, so they can't run a different operating system: When running an Ubuntu container on a Windows machine, you're likely using Docker Desktop, which includes a Linux virtual machine (via WSL2 or Hyper-V). This VM provides a Linux kernel, allowing Linux containers to run on Windows. From the user's perspective, it feels seamless, but under the hood, you're relying on a lightweight virtual machine.
    - `Security Risks`: Misconfigured containers or vulnerabilities in the container runtime can expose the host system.
    - `Storage and Networking Complexity`: Persistent storage and advanced networking setups can be challenging in containerized environments.
    - `Learning Curve`: Properly designing, deploying, and managing containers requires understanding of new tools and technologies like Docker, Kubernetes, and orchestration.
    - `Not Ideal for Monolithic Applications`: Large, monolithic applications might not benefit from the microservices model that containers are optimized for.

![bytebytego_gif](https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F5350f89a-6e38-41e6-a2d2-3ad1c711e82d_3900x3159.png){target=_blank title="Containers"}

### Image

A container is created using an image.

Using Oriented Object Programming the container would be the class and the image would be an instance of this class.

An image is defined by its tag: it is fixed.
On the other hand, the container is dynamic and can be used from this fixed image.

### Layers

An image is made from layers.
Layers can be added or removed so that the image is relevant for our usage.

## Virtualization VS Containerization

![bytebytego_gif](https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2F14409324-6525-49f9-85b5-ea416d4efffb_2556x1383.jpeg){target=_blank title="Containers"}
