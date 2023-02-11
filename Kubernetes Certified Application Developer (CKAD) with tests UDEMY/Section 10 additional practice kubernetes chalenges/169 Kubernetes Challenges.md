
Kubernetes Challenges

The **Kubernetes Challenges** is a FREE fun and challenging set of challenges to Practice Kubernetes hands-on.  
  
These challenges are specially designed to give you more hands-on and challenges that would help you excel in Kubernetes

Kubernetes Challenges makes learning and practicing your Kubernetes skills fun by providing you with a set of challenges. Such as to deploy new applications to a cluster, troubleshooting existing applications, troubleshooting and fixing security and network related issues within the cluster and many more.

The challenge portal opens right in your browser. You are given an architecture diagram of the application to be deployed and a count down timer before which you must complete all tasks.

  

**Enroll in the Kubernetes Challenges (free):** [**Kubernetes Challenges**](https://bit.ly/3Lx76XH)

export ns=default
alias k='kubectl -n $ns' # This helps when namespace in question doesn't have a friendly name 
alias kdr= 'kubectl -n $ns -o yaml --dry-run'.  # run commands in dry run mode and generate yaml.

vim ~/.vimrc
set nu
set expandtab
set shiftwidth=2
set tabstop=2

Certification Tips - Student Tips #exam #tips 

Make sure you check out these tips and tricks from other students who have cleared the exam:

# 70 Certification Tips - student tips

- [ ] [https://www.linkedin.com/pulse/my-ckad-exam-experience-atharva-chauthaiwale/](https://www.linkedin.com/pulse/my-ckad-exam-experience-atharva-chauthaiwale/)
	- [ ] ## Kubernetes Resources

		Here are some resources I referred for CKAD preparation
	- [ ] 1.  [Linux Foundation LFD259](https://training.linuxfoundation.org/training/kubernetes-for-developers/) : Kubernetes for Developers course is an official training offered by Linux foundation. It is very useful for understanding basic K8s concepts. Fortunately, I got a good Christmas combo deal for LDF259 course and CKAD Exam .
	- [ ] 2.  Kubernetes Up and Running - by Kelsey Hightower, Brendan Burns and Joe Beda: What better resource than the book by creators themselves. This is another good resource for understanding concepts in depth.
	- [ ] 3.  [Udemy course by Mumshad Mannambeth](https://www.udemy.com/certified-kubernetes-application-developer/) : This is an excellent course in which you can practice commands on exam-like environment.
	- [ ] 4.  [https://github.com/dgkanatsios/CKAD-exercises](https://github.com/dgkanatsios/CKAD-exercises): Must Try these exercises 2-3 times before you appear.

## Time management tips

Biggest challenge in CKAD exam is time management. We have only 2 hours to complete 19 questions . On top of that, you need to write/edit YAML files is one of the default linux editors ( nano, vim etc ) which is not going to help in saving time. So here are some tips to save time.

### Master kubectl imperative commands: 

While YAML is good for Infrastructure as a Code, it won't help you in saving time in exam unless you are a VIM/YAML ninja.

> SO PLEASE DON'T WRITE YAML FILES FROM SCRATCH !

**_kubectl run_** and **_generators_** are the only saviours in this case. Check out my [blog post](https://medium.com/@atharvac.cloud/kubernetes-deep-dive-part-3-generators-for-quick-poc-6cac698f08eb) about how to use generators to improve productivity. Remember that searching through K8s documentation will also be time consuming, practice imperative commands so that you refer documentation as less as possible. 
[BLOG POST]([Kubernetes deep dive part 3 : Generators for quick POC | by Atharva Chauthaiwale | Medium](https://medium.com/@atharvac.cloud/kubernetes-deep-dive-part-3-generators-for-quick-poc-6cac698f08eb))

### Use bash aliases: 

I used following aliases to save typing commands.

export ns=default
alias k='kubectl -n $ns' # This helps when namespace in question doesn't have a friendly name 
alias kdr= 'kubectl -n $ns -o yaml --dry-run'.  # run commands in dry run mode and generate yaml.

However, do remember that you sometimes need to do ssh to a node or switch to root user. In that case, make sure you set the aliases properly.

### VIM settings

K8s imperative commands won't help in a few cases and you will have to write/edit YAMLs. E.g. For questions related to Persistent Volumes or Network Policies etc. I used following VIM settings to convert tabs to spaces and other syntax related help

vim ~/.vimrc
set nu
set expandtab
set shiftwidth=2
set tabstop=2

### Bookmark K8s documentation links

You are allowed to use K8s documentation. Make use of it and bookmark different sections in the document for quick access. 

## Things to remember during the exam

1.  Proctors are very strict about exam code of conduct. I was warned couple of times just for covering my mouth and reading out questions aloud.
2.  Before you attempt a new question, be sure to execute command to switch contexts. It is given at the start of the question
3.  Sometimes you need to ssh to another node or change to root user. Beware of where you are all the time on bash terminal.
4.  Note down questions and its percentage ( only in the note pad provided by exam environment ) if you want to skip the question for later. This strategy really helped me when there was a time crunch and I had to cover as much ground as possible 

## Conclusion

CKAD exam demands a lot of hands on practice and skills. However, it is also one of the most rewarding experiences. And even if you don't crack it in first attempt, there is a free retake !

# 2
- [ ] [https://medium.com/@harioverhere/ckad-certified-kubernetes-application-developer-my-journey-3afb0901014](https://medium.com/@harioverhere/ckad-certified-kubernetes-application-developer-my-journey-3afb0901014)


# 3
- [ ] [https://github.com/lucassha/CKAD-resources](https://github.com/lucassha/CKAD-resources)