I used following aliases to save typing commands.
```
export ns=default
alias k='kubectl -n $ns' # This helps when namespace in question doesn't have a friendly name 
alias kdr= 'kubectl -n $ns -o yaml --dry-run'.  # run commands in dry run mode and generate yaml.
```

### VIM settings

K8s imperative commands won't help in a few cases and you will have to write/edit YAMLs. E.g. For questions related to Persistent Volumes or Network Policies etc. I used following VIM settings to convert tabs to spaces and other syntax related help

vim ~/.vimrc
set nu
set expandtab
set shiftwidth=2
set tabstop=2

Certification Tips - Student Tips

Make sure you check out these tips and tricks from other students who have cleared the exam:

[https://www.linkedin.com/pulse/my-ckad-exam-experience-atharva-chauthaiwale/](https://www.linkedin.com/pulse/my-ckad-exam-experience-atharva-chauthaiwale/)

[https://medium.com/@harioverhere/ckad-certified-kubernetes-application-developer-my-journey-3afb0901014](https://medium.com/@harioverhere/ckad-certified-kubernetes-application-developer-my-journey-3afb0901014)

[https://github.com/lucassha/CKAD-resources](https://github.com/lucassha/CKAD-resources)

[[KUBERNETES_COMMANDS]]
[[KUBERNETES_COMMANDS_2]]

