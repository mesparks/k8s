eksctl create iamserviceaccount \
  --cluster=k8s-playpen \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --role-name "AmazonEKSLoadBalancerControllerRole" \
  --attach-policy-arn=arn:aws:iam::547097428470:policy/AWSLoadBalancerControllerIAMPolicy \
  --override-existing-serviceaccounts \
  --approve


helm upgrade aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=k8s-playpen \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller  \
  --set region=us-east-1 \
  --set vpcId=vpc-0fe51737c00b3e0c3

helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=k8s-playpen \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller  \
  --set region=region-code=us-east-1 \
  --set vpcId=vpc-0fe51737c00b3e0c3
