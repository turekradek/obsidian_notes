```
# Course Learning Objectives

By the end of this course, you should be able to:

-   Containerize and deploy a new Python script.​
-   Configure the deployment with ConfigMaps, Secrets, and SecurityContexts.
-   Understand multi-container Pod design.
-   Configure probes for Pod health.
-   Update and roll back an application.
-   Implement services and NetworkPolicies.
-   Use PersistentVolumeClaims for state persistence.
```

```
# Meet Your Instructor: Timothy Serewicz

**Timothy Serewicz** is the Training Program Director for The Linux Foundation, with over twenty years of training and content creation experience working with Linux and other open source projects. He leads a team creating and maintaining content provided online, as well as instructor-led training via a worldwide group of instructors. He also created, maintains, and teaches the CKA, CKAD, and CKS Kubernetes certification courses.
```

- [ ] Course Audience
```
This course is designed for developers looking to learn how to deploy, configure, and test their containerized applications on a multi-node Kubernetes cluster.
```

- [ ] Knowledge/Skills Requirements
```
For a successful learning experience, basic Linux command line and file editing skills are required. Familiarity with using a programming language (such as Python, Node.js, Go) and cloud native application concepts and architectures is helpful.

Our free [LFS158x - Introduction to Kubernetes](https://www.edx.org/course/introduction-to-kubernetes) MOOC on edX is a useful preparation for this course.
```

- [ ] Software Environment
```
The material produced by The Linux Foundation is distribution-flexible. This means that technical explanations, labs and procedures should work on most modern distributions, and we do not promote products sold by any specific vendor (although we may mention them for specific scenarios).

In practice, most of our material is written with the three main Linux distribution families in mind: ​

- Debian/Ubuntu

- Red Hat/Fedora​

- openSUSE/SUSE. ​

Distributions used by our students tend to be one of these three alternatives, or a product that is derived from them.
```

- [ ] Lab Environment
```
The lab exercises were written using Google Compute Engine (GCE) nodes. They have been written to be vendor-agnostic, so they could run on AWS, local hardware, or inside of virtual machines, to give you the most flexibility and options.

🚩

Each platform will have different access methods and considerations.

Each node has 2 vCPUs and 8G of memory, running Ubuntu 20.04. ​Smaller nodes should work, but you should expect a slow response. As we will be working with images, it is recommended that you allocate at least 20GB of disk space for the control plane (cp) node, more is better. Other Linux distributions should work in a similar manner, but have not been tested:

-   Don't use 192.168 network for nodes
-   No firewall
-   Disable swap
-   Disable SELinux and AppArmor

Using GCE requires setting up an account, and will incur expenses if using nodes of the size suggested. For more information review ["Quickstart Using a Linux VM"](https://cloud.google.com/compute/docs/quickstart-linux).

Amazon Web Service (AWS) is another provider of cloud-based nodes, and requires an account; you will incur expenses for nodes of the suggested size. You can find videos and information about [how to launch a Linux virtual machine](https://aws.amazon.com/getting-started/tutorials/launch-a-virtual-machine/) on the AWS website. 

Virtual machines such as KVM, VirtualBox, or VMWare can also be used for the lab systems. Putting the VMs on a private network can make troubleshooting ;easier.

Finally, using bare-metal nodes, with access to the Internet, will also work for the lab exercises.

If using a cloud provider like GCP or AWS, you should be able to complete the lab exercises using the free tier or credits provided to you. However, you may incur charges if you exceed the credits initially allocated by the cloud provider, or if the cloud provider’s terms and conditions change.

**Notes:**

-   Regardless of the platform used (VirtualBox, VMWare, AWS, GCE or even bare metal), please remember that security software like SELinux, AppArmor, and firewall configurations can prevent the labs from working. While not something to do in production, consider disabling the firewall and security software. 
-   GCE requires a new VPC to be created and a rule allowing all traffic to be included. The use of wireshark can be a helpful place to start with troubleshooting network and connectivity issues if you’re unable to open all ports. 
-   The kubeadm utility currently requires that swap be turned off on every node. The **swapoff -a** command will do this until the next reboot, with various methods to disable swap persistently. Cloud providers typically deploy instances with swap disabled.
```

# Course Resources

Resources for this course can be found online. Making updates to this course takes time. Therefore, if there are any changes in between updates, you can always access course updates, as well as the course resources online:

-   Go to the Linux Foundation training website to obtain [Course Resources](https://training.linuxfoundation.org/cm/LFD259/)
-   The user ID is **LFtraining** and the password is **Penguin2014**.
