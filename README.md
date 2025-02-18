# dora-metrics  
clone this repo  
cd dora-metrics  
kubectl apply -k .  
 What is the exact criteria to know that a service now check has passed? Some criterias were mentioned like being within a time window, specific value of a field. What will be the full criteria

// Sample docker inspect data.

[
    {
        "Id": "sha256:17f00b15dbdffd7778f7be7ebd96815b6c699b61ba788ca77dfc8a62962cec6c",
        "RepoTags": [
            "utkarsh-opsmx/podinfo:latest",
            "utkarshopsmax/flux-test:v1",
            "utkarshopsmax/podinfo:1.0.1",
            "utkarshopsmax/podinfo:1.0.3",
            "utkarshopsmax/podinfo:latest",
            "utkarshopsmx/podinfo:1.0.1",
            "utkarshopsmx/podinfo:1.0.3",
            "utkarshopsmx/podinfo:latest"
        ],
        "RepoDigests": [
            "utkarshopsmx/podinfo@sha256:b7dac220ecacfb35684e71531829c20c48623983b5df21e7ad2665aebeaca7dc"
        ],
        "Parent": "",
        "Comment": "buildkit.dockerfile.v0",
        "Created": "2024-05-14T13:23:43.749634635+05:30",
        "DockerVersion": "",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "app",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "./podinfo"
            ],
            "ArgsEscaped": true,
            "Image": "",
            "Volumes": null,
            "WorkingDir": "/home/app",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {
                "maintainer": "stefanprodan"
            }
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 77638641,
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/w5413szn5pstxguxouir9aduw/diff:/var/lib/docker/overlay2/hwgpdlrv7df5h1dzh27km2hu0/diff:/var/lib/docker/overlay2/5sdnbnwn0s8nzlzb48pjw5sja/diff:/var/lib/docker/overlay2/zjkrh3aus6s9b1d1pvhrbtznd/diff:/var/lib/docker/overlay2/p6w8pwzd5vggb39rikk0232me/diff:/var/lib/docker/overlay2/69f09f1a314e841a981467da00e8907071228359cc880d0b0d69594eb41b6162/diff",
                "MergedDir": "/var/lib/docker/overlay2/uzic6h0jdf5jc5zh00fzpqhi7/merged",
                "UpperDir": "/var/lib/docker/overlay2/uzic6h0jdf5jc5zh00fzpqhi7/diff",
                "WorkDir": "/var/lib/docker/overlay2/uzic6h0jdf5jc5zh00fzpqhi7/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:d4fc045c9e3a848011de66f34b81f052d4f2c15a17bb196d637e526349601820",
                "sha256:10baa8e69daad1a57c6bbb8d1fdbfb2757eb90ea1d13b789deed6665f39ea7dd",
                "sha256:5f70bf18a086007016e948b04aed3b82103a36bea41755b6cddfaf10ace3c6ef",
                "sha256:5e6673c356e6cdc5aaa4212eab14856a9ad81751bc7f67e8ed5895fa3d589fe8",
                "sha256:1cfe6457b73f51b4a8ae9fc1d4bf6015280ebae91dde689708b238ebbf99e086",
                "sha256:bc618a195e71553a65ec2e6c885f5f809e92bcaa21536dbe68ed1bbaf6758aa3",
                "sha256:cc246ee08f8331e1e1d7a3f3dc28389ae726871a29d68fe2a11f537157ed5905"
            ]
        },
        "Metadata": {
            "LastTagTime": "2024-05-20T12:44:51.763129471+05:30"
        }
    }
]
