kubectl create secret generic encryption-keys \
  --from-file=aes-key=src/main/resources/keys/aes_key.enc \
  --from-file=rsa-private=src/main/resources/keys/rsa_private_key.pem \
  --from-file=rsa-public=src/main/resources/keys/rsa_public_key.pem \
  --from-file=ec-private=src/main/resources/keys/ec-private-pkcs8.pem \
  --from-file=ec-public=src/main/resources/keys/ec-public.pem \
  --namespace=backend



 
  # 2. Verify the secret was created
kubectl get secrets -n backend

# 3. Update your deployment
kubectl apply -f src/main/kubernetes/deployment.yaml

# 4. Check if pods are running
kubectl get pods -n backend

# 5. Check pod logs to see if keys are loading correctly
kubectl logs -f deployment/usbackend-deployment -n backend
