I used following aliases to save typing commands.
```
export ns=default
alias k='kubectl -n $ns' # This helps when namespace in question doesn't have a friendly name 
alias kdr= 'kubectl -n $ns -o yaml --dry-run'.  # run commands in dry run mode and generate yaml.

export do="--dry-run=client -o yaml" 
export now="--force --grace-period 0"
```

### VIM settings

K8s imperative commands won't help in a few cases and you will have to write/edit YAMLs. E.g. For questions related to Persistent Volumes or Network Policies etc. I used following VIM settings to convert tabs to spaces and other syntax related help

vim ~/.vimrc
set number
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


#CKAD #CKADTIPS 

# Rozwiązuj każde zadanie przy użyciu „Imperatives Commands” im szybciej się ich nauczysz tym lepiej. Bez bardzo dobrej znajomości tworzenia plików yaml/komponentów Kubernetesa nie będziesz w stanie zdać egzaminu!!!

Przykłady Imperative commands: Kubectl Reference Docs (kubernetes.io) https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#-em-ingress-em-

- [x] 1. Jeśli jesteś zielony w temacie warto zacząć od Kubernetes for the Absolute Beginners - Hands-on (udemy.com)
- [x] 2. Nastepnie przejść szkolenie Kubernetes Certified Application Developer (CKAD) with Tests (udemy.com) w trakcie szkolenia na bieżąco robić zadania załączone do tematu Udemy Labs - Certified Kubernetes Application Developer - KodeKloud. Póki co pomijamy Lightning Labs i Mock Exams!!!
- [x] 3. W dziale „Update for Sep 2021 Changes” przerobić tematy wraz z zadaniami na KodeKloud
	- [x] Define, build, and modify container images [[128 Updates for Sep 2021 Change]] [[129 Define, build and modify container images]] 
	- [x] Deployment Strategy – Blue Green [[161 Deployument Strategy - Blue Green]]
	- [x] Deployment Strategy - Canary [[162 Deployment Strategy Canary]]
	- [x] Helm Introduction [[166 Install Helm]]
	- [x] Helm Concepts [[169 Labs - Helm Concepts]]
- [x] 4. Po skończeniu szkolenia i przerobieniu zadań z punktu 2 i 3, ponownie przejść te same zadania na kodekloud. Utrwalisz sobie komendy i ogólną wiedzę na temat poszczególnych komponentów. Póki co pomijamy Lightning Labs i Mock Exams!!!
- [ ] 5. Zrób 3 rundy z zadaniami z Git-a GitHub - https://github.com/dgkanatsios/CKAD-exercises. Wszystko co tylko się da rób przy użyciu Imperative Commands. Po przerobieniu 5 powyższych punktów powinieneś być w stanie recytować większość komend lepiej niż wierszyki w przedszkolu, a resztę komend przynajmniej będziesz kojarzył. Ogólnie, gdyby twoi rodzice wiedzieli o co tu chodzi to byliby z Ciebie dumni. Zadania z tego punktu możesz rozwiązywać lokalnie u siebie na maszynie przy Uzyciu np. „minikube” lub [Interactive Tutorial - Creating a Cluster | Kubernetes](https://kubernetes.io/docs/tutorials/kubernetes-basics/create-cluster/cluster-interactive/)
- [ ] 6. Teraz czas na przerobienie Lightning Labs i Mock Exams z punktu 2
	- [ ] LIGHTNING LABS
		- [ ] [[175 Lightning Lab -1]] 
			- [ ] [[176 Solution Lightning Lab1]]  
		- [ ] [[177 Lighyning Lab - 2]] 
			- [ ] [[178  Solution Lighyning Lab - 2]]
	- [ ] Mock Exams 
		- [ ] [[179 Mock Exam - 1]]
			- [ ] [[180 Solution Mock Exam - 1]]
		- [ ] [[181  Mock Exam - 2]] 
			- [ ] [[182 Solution Mock Exam - 2]]
	Nie martw się jak za pierwszym razem nie będziesz w stanie wszystkiego rozwiązać, śmiało podejrzyj odpowiedzi, ZROZUM, dlaczego takie jest rozwiązanie i powtórz ćwiczenie. Przerób te dwa działy kilka razy, aż będziesz znał odpowiedzi na pamięć, na egzaminie pojawią się zadania o podobnej treści. Ważne, żebyś kojarzył jak rozwiązać dany problem. 
- [ ] 7. Po zakupie egzaminu CKAD Kubernetes otrzymasz dwie sesje „Killer SH”. Po zrobieniu punktów 1-6, tydzień przed egzaminem włącz pierwszy symulator egzaminu, najlepiej na weekend. Po zakończonej sesji otrzymasz dostęp do rozwiązań zadań. Sesja jest aktywna tylko 36h, wykorzystaj ten czas, aby zrobić kilka sesji po 2h z tymi zadaniami. Jak w punkcie powyżej, naucz się tych zadań i ich rozwiązań na tyle ile dasz radę. 
- [ ] 8. Egzamin najlepiej ustawić na poniedziałek. W weekend przed egzaminem włącz drugi „Killer SH” i powtórz kroki z przed weekendu. Pomiędzy tymi weekendami warto przejść zadania z punktów 1 – 6 aby utrwalić „Imperative commands”

# TIPS:
 - [x] Używaj „Imperative commands” do tworzenia plików YAML/komponentów Kubernetesa • 
 - [x] Naucz się gdzie szukać informacji w dokumentacji Kubernetesa [Get a Shell to a Running Container | Kubernetes](https://kubernetes.io/docs/tasks/debug/debug-application/get-shell-running-container/). Jeśli będziesz znał gdzie jaki komponent jest opisany w dokumentacji, łatwo skopiujesz kawałki plików YAML potrzebnych w danym zadaniu i tylko je zmodyfikujesz. Używaj pola „Search”! • 
 - [x] Na egzaminie „okno” w którym pracujesz jest dość małe, możesz mieć tylko laptopa dlatego warto znać dokumentację i wiedzieć gdzie co jest opisane i skąd możesz skopiować poszczególne komponenty pliku YAML jak np. volumen, secret, configmap używane w deploymentach lub podach itd. • 
 - [ ] Podczas egzaminu możesz korzystać z dokumentacji która zaczyna się adresem: https://kubernetes.io/docs - czyli to też jest dostępne [Kubectl Reference Docs (kubernetes.io)](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#-em-ingress-em-)
 - [ ] musisz bardzo dobrze rozumieć “Networking”!!!
	 - [x] Jak działa Service, Network policy, Ingress, Egress ➢ [[105 Ingress Networking]] [[106 Article Ingress]] [[107 Labs Ingress Networking - 1]] [[112 Network Policies]]
	 - [x] Jak tworzyć Network Policy, używać odpowiednich „labelów”, w odpoiwednie miesjca wpisywać dane porty ➢ 
	 - [x] Naucz się na pamięć komendy jak stworzyć Ingress/Egress!!! ➢ 
	 - [x] Posiadaj dobre zrozumienie jak pody łączą się przez Service, Network Policy ➢ 
	 - [ ] Jak odpytywać Pody zapytaniami curl/wget – sprawdzanie czy jest połączenie z podem
- [x] Na moim egzaminie 3-4 zadania to był „troubleshooting” związany z powyższymi tematami. Ważne żebyś rozumiał jak ustawiać port, target-port, jaki label gdzie powinien być użyty. Jest kilka zadań w tym temacie, zapamiętaj je! • 
- [x] Pamiętaj o komendach „kubectl --help” na dole jest informacja jak zbudować przykładowe zapytanie przy uzyciu imperative commands – przykład „kubectl create --help” lub „ kubectl run --help” • 
- [x] Gdy edytujesz jakiś komponent np. pod lub deployment w pliku YAML to używaj komendy „apply” i na końcu dodaj --force • 
- [x] Po rozpoczęciu egzaminu warto dodać skróty: ➢ #vi #VIM 
	- [x] export do="--dry-run=client -o yaml" # tworzenie pliku YAML bez tworzenia komponentu ➢ 
	- [x] export now="--force --grace-period 0" # usunięcie natychmiast danego komponentu • 
- [x] Na egzaminie pracujesz w edytorze „vi”. Plik ~/vimrc powinien być skonfigurowany ale warto to sprawdzić czy poniższe komendy są w nim zawarte: ➢ 
	- [x] set tabstop=2 ➢ 
	- [x] set expandtab ➢ 
	- [x] set shiftwidth
- [x] Przydatne skróty przy pracy w edytorze „vi”: ➢ 
	- [x] Zaznaczanie kilku linii – shift + V (strzałkami zaznaczasz kolejne linie) ➢ 
	- [x] Po zaznaczeniu linii shift + . – przesunięcie tekstu o pola wpisane w pliku ~/.vimrc ➢ 
	- [x] Po zaznaczeniu kilku linii „delete” aby usunąć zaznaczony tekst 
	- [x] 10 +G – przejdź do danej linii 
	- [x] Shift + G – przejdź do ostatniej lini
- [x] Jeśli zatrzymasz się na jakimś zadaniu na egzaminie „oflaguj” je i przejdź do kolejnego. Jeśli zostanie czas możesz do niego wrócić. • 
- [ ] Pamiętaj aby zawsze przed rozpoczęciem nowego zadania na egzaminie wybrać odpowiedni Node i context Kubernetesa. Komenda do wybrania contextu będzie w treści zadania (ja nie musiałem zmieniać Node-a). Po rozwiązaniu zadania należy wrócić na domyślny Node – będzie to opisane przed rozpoczęciem egzaminu w pliku readme. Zawsze możesz do niego wrócić. • 
- [x] Zapisywanie jakichkolwiek plików jest możliwe tylko w lokalizacji student – na 99% tak to się nazywało. W każdym razie coś związanego z egzaminem. Na pewno jest to niestandardowa lokalizacja i wyróżnia się od lokalizacji systemowych. • 
- [x] Korzystaj na egzaminie z już gotowych plików YAML, jeśli jest takowy stworzony do danego zadania. • 
- [x] Pamiętaj, aby pracować w odpowiednim namespace, inaczej zadanie nie będzie zaliczone! • 
- [x] Na egzaminie jest 16 zadań, aby zdać należy zdobyć 66%. • 
- [x] 2h czasu to naprawdę mało na 16 zadań. Bez znajomości imperative commands nie ma opcji zdania egzaminu.
- [ ] Dodatkowe linki:
	- [ ] https://medium.com/@harioverhere/ckad-certified-kubernetes-application-developer-my-journey-3afb0901014
	- [ ] https://github.com/twajr/ckad-prep-notes#current-progress
- [ ] Dodajcie do tej listy tworzenie plików Docker-owych. Omówione jest to w punkcie 3 „Define, build, and modify container images
	- [ ] [[CKAD_TIPS.png]]

![[CKAD_TIPS.png]]

---
# 29 Certification Tip: Formatting Output with kubectl

The default output format for all **kubectl** commands is the human-readable plain-text format.

The -o flag allows us to output the details in several different formats.

  

**kubectl [command] [TYPE] [NAME] -o <output_format>**

Here are some of the commonly used formats:

  

1. `-o json`Output a JSON formatted API object.
    
2. `-o name`Print only the resource name and nothing else.
    
3. `-o wide`Output in the plain-text format with any additional information.
    
4. `-o yaml`Output a YAML formatted API object.
    

Here are some useful examples:

- **Output with JSON format:**
    

1. master $ kubectl create namespace test-123 --dry-run -o json
2. {
3.     "kind": "Namespace",
4.     "apiVersion": "v1",
5.     "metadata": {
6.         "name": "test-123",
7.         "creationTimestamp": null
8.     },
9.     "spec": {},
10.     "status": {}
11. }
12. master $

  

- **Output with YAML format:**
    

1. master $ kubectl create namespace test-123 --dry-run -o yaml
2. apiVersion: v1
3. kind: Namespace
4. metadata:
5.   creationTimestamp: null
6.   name: test-123
7. spec: {}
8. status: {}

  

- **Output with wide (additional details):**
    

Probably the most common format used to print additional details about the object:

1. master $ kubectl get pods -o wide
2. NAME      READY   STATUS    RESTARTS   AGE     IP          NODE     NOMINATED NODE   READINESS GATES
3. busybox   1/1     Running   0          3m39s   10.36.0.2   node01   none           none
4. ningx     1/1     Running   0          7m32s   10.44.0.1   node03   none           none
5. redis     1/1     Running   0          3m59s   10.36.0.1   node01   none            none
6. master $

For more details, refer:
[**https://kubernetes.io/docs/reference/kubectl/overview/**](https://kubernetes.io/docs/reference/kubectl/overview/)
[**https://kubernetes.io/docs/reference/kubectl/cheatsheet**](https://kubernetes.io/docs/reference/kubectl/cheatsheet)**/**

---
# Certification Tip: Imperative Commands

While you would be working mostly the declarative way - using definition files, imperative commands can help in getting one-time tasks done quickly, as well as generate a definition template easily. This would help save a considerable amount of time during your exams.

Before we begin, familiarize yourself with the two options that can come in handy while working with the below commands:

`--dry-run` : By default, as soon as the command is run, the resource will be created. If you simply want to test your command,
use the `--dry-run=client` option. This will not create the resource. Instead, tell you whether the resource can be created and if your command is right.

`-o yaml`: This will output the resource definition in YAML format on the screen.

Use the above two in combination along with Linux output redirection to generate a resource definition file quickly, that you can then modify and create resources as required, instead of creating the files from scratch.

`kubectl run nginx --image=nginx --dry-run=client -o yaml > nginx-pod.yaml`


#### POD

**Create an NGINX Pod**

`kubectl run nginx --image=nginx`


**Generate POD Manifest YAML file (-o yaml). Don't create it(--dry-run)**

`kubectl run nginx --image=nginx --dry-run=client -o yaml`

  
#### Deployment

**Create a deployment**

`kubectl create deployment --image=nginx nginx`

  
**Generate Deployment YAML file (-o yaml). Don't create it(--dry-run)**

`kubectl create deployment --image=nginx nginx --dry-run -o yaml`

  

**Generate Deployment with 4 Replicas**

`kubectl create deployment nginx --image=nginx --replicas=4`

  

You can also scale deployment using the `kubectl scale` command.

`kubectl scale deployment nginx --replicas=4`

  

**Another way to do this is to save the YAML definition to a file and modify**
```
kubectl create deployment nginx --image=nginx --dry-run=client -o yaml > nginx-deployment.yaml
```

  

You can then update the YAML file with the replicas or any other field before creating the deployment.

  

#### Service

**Create a Service named redis-service of type ClusterIP to expose pod redis on port 6379**

```
kubectl expose pod redis --port=6379 --name redis-service --dry-run=client -o yaml
```

(This will automatically use the pod's labels as selectors)

Or

`kubectl create service clusterip redis --tcp=6379:6379 --dry-run=client -o yaml` (This will not use the pods' labels as selectors; instead it will assume selectors as **app=redis.** [You cannot pass in selectors as an option.](https://github.com/kubernetes/kubernetes/issues/46191) So it does not work well if your pod has a different label set. So generate the file and modify the selectors before creating the service)

  

**Create a Service named nginx of type NodePort to expose pod nginx's port 80 on port 30080 on the nodes:**

`kubectl expose pod nginx --port=80 --name nginx-service --type=NodePort --dry-run=client -o yaml`

(This will automatically use the pod's labels as selectors, [but you cannot specify the node port](https://github.com/kubernetes/kubernetes/issues/25478). You have to generate a definition file and then add the node port in manually before creating the service with the pod.)

Or

`kubectl create service nodeport nginx --tcp=80:80 --node-port=30080 --dry-run=client -o yaml`

(This will not use the pods' labels as selectors)

Both the above commands have their own challenges. While one of it cannot accept a selector the other cannot accept a node port. I would recommend going with the `kubectl expose` command. If you need to specify a node port, generate a definition file using the same command and manually input the nodeport before creating the service.

  

**Reference:**

[https://kubernetes.io/docs/reference/kubectl/conventions/](https://kubernetes.io/docs/reference/kubectl/conventions/)

[[40 A quick note on editing Pods and Deployments]]

#kubeconfig [[136 KubeConfig]]

#securitycontext
#context 
k exec -h [[53 Security Contexts]]


# SERVICES AND NETWORKING 
- services [[100 services NodePort]]
- service ClusterIp [[101 service ClusterIP]]
- Network Policies [[112 Network Policies]]
- Ingress [[105 Ingress Networking]]
- Engress 
