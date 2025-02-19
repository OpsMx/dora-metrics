# dora-metrics  
clone this repo  
cd dora-metrics  
kubectl apply -k .  
 


Is the Authentication mechanism for Facade Layer will be OIDC?
If yes, can I configure my client service's (policy-service's) properties file in the below standard oauth2/oidc format? Can you provide the <server-name> value in the specific case?
spring:
  security:
    oauth2:
      client:
        registration:
          <server-name>:
            provider: my-oidc
            client-id: <client-id>
            client-secret: <client-secret>
            authorization-grant-type: <grant-type>
            scope: <scope>
        provider:
          my-oidc:
            token-uri: <https://your-oidc-provider.com/oauth/token>
