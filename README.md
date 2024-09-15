# test multiple argo-cd instances on the same cluster

this repo is not fully baked. it's just for playing around with that setup.
in order to try it yourself - change the NAME export in the script.sh file between argocd1 and argocd2, and then run the commands.
they will
1. install a namespaced argocd instance in ${NAME} namespace
2. add the "in-cluster" cluster as a remote cluster (to add the missing rbac rules)
3. add an app called "my-app"

the app will sync ${NAME} folder. in "argocd1" this includes a cm and another child app. in "argocd2" it only includes a cm.
running in vanilla argo-cd, i encoutered no issues with the app being in conflit between the two argo-cd instances.
