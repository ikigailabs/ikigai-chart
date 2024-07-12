# Install Ikigai Into Kubernetes Cluster

[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

This is a guide on how to deploy the Ikigai application into your environment. 
Ensure you have the most update version of The Ikigai helm chart and the appropriate permissions and access to your Kubernetes cluster. 
Ensure you the latest version of helm installed. 
## Table of Contents

- [Configure Kubectx](#configure-kubectx)
- [Download Helm Charts from ArtifactHub](#download-helm-charts-from-artifacthub)
- [Configure Values File](#configure-values-file)
	- [AWS Cert](#aws-cert)
- [Deploy Ikigai](#deploy-ikigai)
- [Rollback Deployment](#rollback-deployment)


## Configure Kubectx

The first step is to ensure you have the appropriate Kubectx configurations on your machine. If this is already the case feel free to skip this section

1. Install [awscli](#https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
2. **[OPTIONAL]** Install [kubectx](#https://github.com/ahmetb/kubectx)

**NOTE: the environment variables values in steps 3-5 should be set as such**
- REGION - the region where the aws resources are located ex. "us-west-2"
- ARN - the [amazon resource name](#https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html) for the user deploying resources ex. "arn:aws:iam::00000000000:user/george"
- MAIN_CLUSTER_NAME - the name of the eks cluster launched in terraform ex. "ikigai-cluster"
- USERNAME - the iam username for the user that deployed the cloud infrastructure ex. "george"
- GROUP - the level of access being mapped to a specific user. This should be set to "system:masters"
3. Enable public access endpoint
```shell
$ aws eks update-cluster-config --name $MAIN_CLUSTER_NAME --region=$REGION --resources-vpc-config endpointPublicAccess=true,endpointPrivateAccess=true
```
4. Create Identity Mapping
```sh
$ eksctl create iamidentitymapping \
  --cluster $MAIN_CLUSTER_NAME \
  --arn $ARN \
  --username $USERNAME \
  --region $REGION \
  --group $GROUP
```
5. Update your kube config file
```sh
$ aws eks --region $REGION  update-kubeconfig --name $MAIN_CLUSTER_NAME
```
6. **[OPTIONAL]** Verify the necessary kube config is present using kubectx 
```sh
$ kubectx ${CLUSTER_NAME}
```
```sh
$ kubectx
```
## Download Helm Charts from ArtifactHub
Once we have access to eks, we need oto download the Helm chart for ikigai

1. Add the Ikigai helm repo
```shell
$ helm repo add ikigai-chart https://ikigailabs.github.io/ikigai-chart/
```
2. Untar the helm repo into local set up
```shell
$ helm pull ikigai-chart/Ikigai --untar
```


## Configure Values File
Once we have the correct context, we can start configuring environment specific values for the cluster 

### AWS Cert
The AWS Cert is used as a certificate for each load balancer. 
1. Create a loadbalancer certificate using the instructions [here](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/ssl-server-cert.html) 
2. In the ```values.yaml``` file go under ```global``` and find the ```aws_cert``` field and update the field with the appropriate cert

### Cloud-hosted Infra
The Ikigai Application uses cloud hosted infrastructure to provide functionality such as object stores, key value stores, and relational databases. This infrastructure should already be launched via 
terraform in your environment. The methodology for replacing each specific value follows the steps below, 

1. Identity the placeholder value for the cloud hosted infrastructure
2. Within your environment, figure out the true value which will replace that placeholder value
3. Find and replace all instances of the placeholder value with the true value seen in your environment


Here are the list of values that need to be replaced and how to acquire those values
#### RDS
- ```REMOTE_JOBS_TABLE_NAME```
- ```FACET_TEMPLATES_TABLE_NAME```
- ```REMOTE_LOCK_TABLE_NAME```
- ```WEBSOCKET_TABLE_NAME```
- 
#### S3 Buckets 
- ```IKIGAI_CONNECTOR_BUCKET```
- ```COLD_STORAGE_BUCKET_NAME```
- ```CONNECTOR_BUCKET_NAME```
- ```DATASET_BUCKET_NAME```
- ```MODEL_BUCKET_NAME```
- ```SAMPLE_BUCKET_NAME```
- ```TEMP_BUCKET_NAME```
- ```SEARCH_BUCKET_NAME```

#### Hostnames 
- ```API_HOSTNAME```
  - ex. https://dev-api.ikigailabs.io
- ```FRONTEND_HOSTNAME```
  - ex. https://dev-app.ikigailabs.io
- ```JUPYTER_HOSTNAME```
  - ex. https://jupyter.ikigailabs.io
- ```DASHHUB_HOSTNAME```
  - ex. http://hub.dashhub
- ```SUPERSET_HOSTNAME```
  - ex. http://superset-service.superset
- ```WEBSOCKET_ENDPOINT```
  - ex. wss://dev-ws.ikigailabs.io
- ```OPENSEARCH_MONITOR_HOSTNAME```
  - ex. vpc-monitoring-development-xxxxxxxxxxxxxxxxxxxxx.us-east-2.es.amazonaws.com
- ```OPENSEARCH_COMPONENT_LOGS_HOSTNAME```
  - ex. vpc-component-logs-development-xxxxxxxxxxxxxxxxxxxxx.us-east-2.es.amazonaws.com
- ```SERVICE_METADATA_POSTGRES_HOSTNAME```
  - ex. service-metadata-dev.xxxxxxxxx.us-east-2.rds.amazonaws.com
- ```SUPERSET_POSTGRES_HOSTNAME```
  - ex. superset-dev.xxxxxxxxx.us-east-2.rds.amazonaws.com
- ```PIPELINE_STAGING_POSTGRES_HOSTNAME```
  - ex. pipeline-staging-dev.xxxxxxxxx.us-east-2.rds.amazonaws.com:5432


#### AWS Configurations
- ```AWS_ACCESS_KEY```
- ```AWS_SECRET_ACCESS_KEY```
- ```REGION```

#### Dremio
- ```DREMIO_USERNAME```
- ```DREMIO_PASSWORD```
- ```DREMIO_HOSTNAME```
- ```DREMIO_SOURCE```
- ```DREMIO_SPACE```

#### Cognito
- ```COGNITO_DOMAIN_NAME```
- ```COGNITO_USER_POOL_ID```
- ```COGNITO_CLIENT_ID```


#### PYPI
- ```PYPI_INDEX_URL```
- ```PYPI_TRUSTED_HOST```

#### CLOUDWATCH
- ```CLOUD_WATCH_STREAM```


#### RABBITMQ
- ```RABBITMQ_USERNAME```
- ```RABBITMQ_HASHED_PASSWORD```

## Deploy Ikigai

Once our helm charts are configured, we can launch the application
1. Navigate to the ```platform_chart``` folder
2. Using Helm, install Ikigai 
```sh
$ helm install ikigai ./ikigai
```

## Update Ikigai
To update a specific configartion in Ikigai 
1. Adjust the helm chart to encapsulate any change that needs to be propogated into the cluster
2. To deploy these changes run,
```sh
$ helm upgrade ikigai ./ikigai
```

## Rollback Deployment
If there is an update that leads to an unstable version of Ikigai, the appropriate next step is to create a rollback. 

```sh
$ helm rollback ikigai
```

