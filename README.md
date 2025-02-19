# dora-metrics  
clone this repo  
cd dora-metrics  
kubectl apply -k .  
 


When we hit the service now API: https://jules-validator.gaiacloud.jpmchase.net/api/snow/changes/CHG33204755
We get a response:
{"message":"Service Now Change Detailed Fetched Successfully","change":{"number":{"identifier":"CHG33204755","namespace":"jpmc::serviceMgt::changeNumber"},"changeType":"Normal","shortDescription":"Onyx Cloud - AWS Updates","description":"Business reasons : Update Onyx AWS resources to improve stability, security and performance.\r\nDowntime: No downtime expected\r\nImpacted Accounts:\r\nPartior\r\nODA\r\nLiink\r\nCoin\r\nPerimeter Workload\r\nPerimeter Platform\r\nToolchain\r\nNetworking\r\n\r\nImpacted Components:\r\nTGW Route Table\r\nNLBs\r\nAccount Baseline\r\nEBS Volumes\r\nEKS\r\nArgoCd\r\nArtifactory\r\nAzureAd TFC Configuration\r\nGrafana\r\nCloudbees Jenkins\r\n\r\n\r\n\r\nBusiness Impact : Updates to existing infrastructure. No application code changes. No business impact during implementation","isRetroactive":"false","state":"Review","startTime":"2025-01-06T14:00:20Z","endTime":"2025-01-11T04:50:28Z","mainConfigurationItem":{"name":"Onyx Cloud Prod","number":{"identifier":"109959:114041","namespace":"jpmc::configMgt::seal::applicationAndDeploymentId"},"id":{"identifier":"CI165860871","namespace":"jpmc::configMgt::configurationItemId"},"environment":"PROD"},"affectedConfigurationItems":[{"task":{"identifier":"CHG33204755","namespace":"jpmc::serviceMgt::changeNumber"},"ci":{"number":{"identifier":"109959:114041","namespace":"jpmc::configMgt::seal::applicationAndDeploymentId"},"id":{"identifier":"CI165860871","namespace":"jpmc::configMgt::configurationItemId"},"environment":"PROD"},"correlationID":""}],"isInstantChange":false},"valid":true}
From this response how can we know that the status of the service now check has passed?
