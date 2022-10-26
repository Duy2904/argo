# Install argoCD inside cluster
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Download ArgoCD CLI
# Detail here: https://argo-cd.readthedocs.io/en/stable/cli_installation/
sudo curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo chmod +x /usr/local/bin/argocd

# After install, we can log in ArgoCD CLI by username and password or
# Publish WebUI to access



# Default username: admin
# Default password: is the output of this command
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

# If you reset, the password will turn to name of the pod
kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2

# Install CRDs
kubectl apply -k https://github.com/argoproj/argo-cd/manifests/crds\?ref\=stable

# Login to argo cd using Argo CLI
argocd login <server-name>

# Create a project
argocd app create testrepo -f <file path>

argocd app create testrepo -f ./svc.yaml --dest-namespace default --dest-server https://kubernetes.default.svc --directory-recurse


ssh-keygen

argocd repo add ssh://APKAZWKFNB7VWNVJ3S54@git-codecommit.ap-southeast-1.amazonaws.com/v1/repos/test-repo --ssh-private-key-path /home/kum/.ssh/id_rsa  --insecure-skip-server-verification


