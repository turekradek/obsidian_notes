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


#CKAD #CKADTIPS 

# Rozwiązuj każde zadanie przy użyciu „Imperatives Commands” im szybciej się ich nauczysz tym lepiej. Bez bardzo dobrej znajomości tworzenia plików yaml/komponentów Kubernetesa nie będziesz w stanie zdać egzaminu!!!

Przykłady Imperative commands: Kubectl Reference Docs (kubernetes.io) https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#-em-ingress-em-

- [x] Jeśli jesteś zielony w temacie warto zacząć od Kubernetes for the Absolute Beginners - Hands-on (udemy.com)
- [x] Nastepnie przejść szkolenie Kubernetes Certified Application Developer (CKAD) with Tests (udemy.com) w trakcie szkolenia na bieżąco robić zadania załączone do tematu Udemy Labs - Certified Kubernetes Application Developer - KodeKloud. Póki co pomijamy Lightning Labs i Mock Exams!!!
- [ ] W dziale „Update for Sep 2021 Changes” przerobić tematy wraz z zadaniami na KodeKloud
	- [ ] Define, build, and modify container images
	- [ ] Deployment Strategy – Blue Green 
	- [ ] Deployment Strategy - Canary 
	- [ ] Helm Introduction 
	- [ ] Helm Concepts
- [ ] Po skończeniu szkolenia i przerobieniu zadań z punktu 2 i 3, ponownie przejść te same zadania na kodekloud. Utrwalisz sobie komendy i ogólną wiedzę na temat poszczególnych komponentów. Póki co pomijamy Lightning Labs i Mock Exams!!!
- [ ] Zrób 3 rundy z zadaniami z Git-a GitHub - dgkanatsios/CKAD-exercises: A set of exercises to prepare for Certified Kubernetes Application Developer exam by Cloud Native Computing Foundation. Wszystko co tylko się da rób przy użyciu Imperative Commands. Po przerobieniu 5 powyższych punktów powinieneś być w stanie recytować większość komend lepiej niż wierszyki w przedszkolu, a resztę komend przynajmniej będziesz kojarzył. Ogólnie, gdyby twoi rodzice wiedzieli o co tu chodzi to byliby z Ciebie dumni. Zadania z tego punktu możesz rozwiązywać lokalnie u siebie na maszynie przy Uzyciu np. „minikube” lub Interactive Tutorial - Creating a Cluster | Kubernetes
- [ ] Teraz czas na przerobienie Lightning Labs i Mock Exams z punktu 2. Nie martw się jak za pierwszym razem nie będziesz w stanie wszystkiego rozwiązać, śmiało podejrzyj odpowiedzi, ZROZUM, dlaczego takie jest rozwiązanie i powtórz ćwiczenie. Przerób te dwa działy kilka razy, aż będziesz znał odpowiedzi na pamięć, na egzaminie pojawią się zadania o podobnej treści. Ważne, żebyś kojarzył jak rozwiązać dany problem. 7. 
- [ ] Po zakupie egzaminu CKAD Kubernetes otrzymasz dwie sesje „Killer SH”. Po zrobieniu punktów 1-6, tydzień przed egzaminem włącz pierwszy symulator egzaminu, najlepiej na weekend. Po zakończonej sesji otrzymasz dostęp do rozwiązań zadań. Sesja jest aktywna tylko 36h, wykorzystaj ten czas, aby zrobić kilka sesji po 2h z tymi zadaniami. Jak w punkcie powyżej, naucz się tych zadań i ich rozwiązań na tyle ile dasz radę. 8. 
- [ ] Egzamin najlepiej ustawić na poniedziałek. W weekend przed egzaminem włącz drugi „Killer SH” i powtórz kroki z przed weekendu. Pomiędzy tymi weekendami warto przejść zadania z punktów 1 – 6 aby utrwalić „Imperative commands”

# TIPS:
 - [ ] Używaj „Imperative commands” do tworzenia plików YAML/komponentów Kubernetesa • 
 - [ ] Naucz się gdzie szukać informacji w dokumentacji Kubernetesa Get a Shell to a Running Container | Kubernetes. Jeśli będziesz znał gdzie jaki komponent jest opisany w dokumentacji, łatwo skopiujesz kawałki plików YAML potrzebnych w danym zadaniu i tylko je zmodyfikujesz. Używaj pola „Search”! • 
 - [ ] Na egzaminie „okno” w którym pracujesz jest dość małe, możesz mieć tylko laptopa dlatego warto znać dokumentację i wiedzieć gdzie co jest opisane i skąd możesz skopiować poszczególne komponenty pliku YAML jak np. volumen, secret, configmap używane w deploymentach lub podach itd. • 
 - [ ] Podczas egzaminu możesz korzystać z dokumentacji która zaczyna się adresem: https://kubernetes.io/docs - czyli to też jest dostępne Kubectl Reference Docs (kubernetes.io)
 - [ ] musisz bardzo dobrze rozumieć “Networking”!!!
	 - [ ] Jak działa Service, Network policy, Ingress, Egress ➢ 
	 - [ ] Jak tworzyć Network Policy, używać odpowiednich „labelów”, w odpoiwednie miesjca wpisywać dane porty ➢ 
	 - [ ] Naucz się na pamięć komendy jak stworzyć Ingress/Egress!!! ➢ 
	 - [ ] Posiadaj dobre zrozumienie jak pody łączą się przez Service, Network Policy ➢ 
	 - [ ] Jak odpytywać Pody zapytaniami curl/wget – sprawdzanie czy jest połączenie z podem
- [ ] Na moim egzaminie 3-4 zadania to był „troubleshooting” związany z powyższymi tematami. Ważne żebyś rozumiał jak ustawiać port, target-port, jaki label gdzie powinien być użyty. Jest kilka zadań w tym temacie, zapamiętaj je! • 
- [ ] Pamiętaj o komendach „kubectl --help” na dole jest informacja jak zbudować przykładowe zapytanie przy uzyciu imperative commands – przykład „kubectl create --help” lub „ kubectl run --help” • 
- [ ] Gdy edytujesz jakiś komponent np. pod lub deployment w pliku YAML to używaj komendy „apply” i na końcu dodaj --force • 
- [ ] Po rozpoczęciu egzaminu warto dodać skróty: ➢ 
	- [ ] export do="--dry-run=client -o yaml" # tworzenie pliku YAML bez tworzenia komponentu ➢ 
	- [ ] export now="--force --grace-period 0" # usunięcie natychmiast danego komponentu • 
- [ ] Na egzaminie pracujesz w edytorze „vi”. Plik ~/vimrc powinien być skonfigurowany ale warto to sprawdzić czy poniższe komendy są w nim zawarte: ➢ 
	- [ ] set tabstop=2 ➢ 
	- [ ] set expandtab ➢ 
	- [ ] set shiftwidth
- [ ] Przydatne skróty przy pracy w edytorze „vi”: ➢ 
	- [ ] Zaznaczanie kilku linii – shift + V (strzałkami zaznaczasz kolejne linie) ➢ 
	- [ ] Po zaznaczeniu linii shift + . – przesunięcie tekstu o pola wpisane w pliku ~/.vimrc ➢ 
	- [ ] Po zaznaczeniu kilku linii „delete” aby usunąć zaznaczony tekst 
	- [ ] ➢ +G – przejdź do danej linii 
	- [ ] ➢ Shift + G – przejdź do ostatniej lini
- [ ] Jeśli zatrzymasz się na jakimś zadaniu na egzaminie „oflaguj” je i przejdź do kolejnego. Jeśli zostanie czas możesz do niego wrócić. • 
- [ ] Pamiętaj aby zawsze przed rozpoczęciem nowego zadania na egzaminie wybrać odpowiedni Node i context Kubernetesa. Komenda do wybrania contextu będzie w treści zadania (ja nie musiałem zmieniać Node-a). Po rozwiązaniu zadania należy wrócić na domyślny Node – będzie to opisane przed rozpoczęciem egzaminu w pliku readme. Zawsze możesz do niego wrócić. • 
- [ ] Zapisywanie jakichkolwiek plików jest możliwe tylko w lokalizacji student – na 99% tak to się nazywało. W każdym razie coś związanego z egzaminem. Na pewno jest to niestandardowa lokalizacja i wyróżnia się od lokalizacji systemowych. • 
- [ ] Korzystaj na egzaminie z już gotowych plików YAML, jeśli jest takowy stworzony do danego zadania. • 
- [ ] Pamiętaj, aby pracować w odpowiednim namespace, inaczej zadanie nie będzie zaliczone! • 
- [ ] Na egzaminie jest 16 zadań, aby zdać należy zdobyć 66%. • 
- [ ] 2h czasu to naprawdę mało na 16 zadań. Bez znajomości imperative commands nie ma opcji zdania egzaminu.
- [ ] Dodatkowe linki:
	- [ ] https://medium.com/@harioverhere/ckad-certified-kubernetes-application-developer-my-journey-3afb0901014
	- [ ] https://github.com/twajr/ckad-prep-notes#current-progress
- [ ] Dodajcie do tej listy tworzenie plików Docker-owych. Omówione jest to w punkcie 3 „Define, build, and modify container images
	- [ ] [[CKAD_TIPS.png]]

![[CKAD_TIPS.png]]