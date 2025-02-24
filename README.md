# dora-metrics  
clone this repo  
cd dora-metrics  
kubectl apply -k .  
 
Plugins have limited information that is available from Argocd, it may extract git repo name, branch etc, but it does not get git last commit message which will contain the snow ID. For that we need to make plugin use of 'git' command and hence the dependency.
helm template .
kustomize build
the above commands are used to build the manifests of images that are applied to the cluster, our plugin appends manifests of presync and postsync job to the image manifests. The final output is then used by ArgoCD for overall deployment/sync.
Again argocd internally uses these tools to build manifests but the plugin has the repo as access from which it can build using helm or kustomize.
if it is sure that only helm charts will be used for application, we can remove kustomize dependency
