# dora-metrics  
clone this repo  
cd dora-metrics  
kubectl apply -k .  
 
COPY ./dependencies/github.com /go/pkg/mod/github.com
COPY ./dependencies/k8s.io /go/pkg/mod/k8s.io
COPY ./dependencies/sigs.k8s.io /go/pkg/mod/sigs.k8s.io
COPY ./dependencies/gopkg.in /go/pkg/mod/gopkg.in
