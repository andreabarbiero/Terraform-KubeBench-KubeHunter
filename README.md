# Terraform-KubeBench-KubeHunter
 Come effettuare un check della sicurezza del cluster k8s.

 Pre-requisiti:

 Terraform 
 file .kube/config impostato nella vostra home (se gestite più di un cluster k8s, assicuratevi che avete il config del cluster che volete analizzare)


 Installazione:

 da un terminale portatevi nella cartella Terraform-KubeBench-KubeHunter

 cd /home/k8s/Terraform-kubeBench-KubeHunter

 e lanciate il comando:

 terraform init 

 Terraform si connetterà direttamente al vostro cluster k8s tramite il file provider.tf 

 lanciare il comando:

 terraform apply

 e quando ve lo chiede scrivete "yes"

 Il file main.tf creerà un namespace denominato "security", mentre gli altri due file .tf creeranno i rispettivi pod al suo interno.
 Per verificare i risultati dei due pod kube-bench e kube-hunter lanciate i seguenti comandi:

 kubectl logs <nome-del-pod> -n security

 Spero possa essere utile a qualcuno.


