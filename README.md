# BOSCH AI (DevOps) - Project 2 - A Python Based Machine Learning Application with CI and CD

[![Python application test with Github Actions](https://github.com/shohrab-uddin/boschAIproject2/actions/workflows/pythonapp.yml/badge.svg)](https://github.com/shohrab-uddin/boschAIproject2/actions/workflows/pythonapp.yml)

# Overview

This repository contains the codebase of a python based machine learnig application. 
- The application is hosted in Azure App Service and can be access from https://flaskazureapp.azurewebsites.net. 
- 'GitHub Actions' is used for Continuous Integration (CI) and 
- 'Azure Devops' is used for Continuous Delivery (CD).

## Project Plan

* You can find the planned tasks for this project this this [trelleo board](https://trello.com/b/lTvxVyON/python-based-mla).
* You can find the project plan from this [spread sheet](https://docs.google.com/spreadsheets/d/16zQYVkjUZa6Vl1MJPTLpffWVv3kq7150AxSUnm7mKpg/edit?usp=sharing). 

## The Architectural Diagram

![image](https://user-images.githubusercontent.com/110354988/187008815-72ff04c7-9227-4892-a8e5-cf87b99eb949.png)

## Working in Azure Cloud Shell

### Project cloned into Azure Cloud Shell

Open Azure Cloud Shell. You may required to create a Storage Account to access the cloud shell. When the cloud shell is ready generate SSH key with the 'ssh-keygen' command. Then clone this repository with the following command:
```
git clone git@github.com:shohrab-uddin/course2-flask-ml-service.git
```

### Create Python Virtual Environment 
```
python3 -m venv ~/.myrepo
source ~/.myrepo/bin/activate
```
Now go to the boschAiProject2 directory (cd boschAIproject2/)

![image](https://user-images.githubusercontent.com/110354988/187009401-ec4f8f63-6ec0-4530-815a-a92ced8e9e00.png)

### Make file to install packages and to run test and lint
Run 'make all' command. The Makefile looks as follows:
```
install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vv test_hello.py


lint:
	pylint --disable=R,C hello.py
	pylint --disable=R,C,W1203,W0702 app.py

all: install lint test

```
### Passing tests that are displayed after running the `make all` command from the `Makefile`

![image](https://user-images.githubusercontent.com/110354988/187009590-57013d72-4090-4c4f-85b5-baec75bc2546.png)

### requirements.txt contains all the libraries 

```
Flask==2.0.3
pandas==1.1.5
scikit-learn==0.24.2
importlib-metadata==4.8.3
virtualenv==20.14.1
argcomplete==2.0.0
joblib==1.1.0
pylint==2.13.7
pytest==7.0.1

```

## Github Actions - CI Build ##

'Github Actions' SaaS is used for Continuous Integration (CI).

![image](https://user-images.githubusercontent.com/110354988/187010387-93965df5-0b28-42b6-9a55-019a6d84fa69.png)

In the screenshot below you can see the CI steps:

![image](https://user-images.githubusercontent.com/110354988/187010646-0b70d6ef-1068-4600-bfbf-3a8336d9b5f9.png)


## Project running on Azure App Service
Run the following command to deploy the sourcode (basic Flask application) into Azure Web App Services and access it later on just like a web application. You must run this command from inside the repository directory.

```
.myrepo) odl_user [ ~/boschAIproject2 ]$ az webapp up -g Azuredevops -n flaskAzureApp
```
Here -g means Rsource Group and -n means the name of your application. 

The application should look like the following screenshot in the browser:

![image](https://user-images.githubusercontent.com/110354988/187010709-cf073c99-86fd-489b-9e36-213ce616bde0.png)

Edit file 'make_predict_azure_app.sh' and replace '< yourappname >' with your webapp name (e.g. azurecicdpipeline). You can test the prediction result with the following command :

![image](https://user-images.githubusercontent.com/110354988/187010881-28d3953b-5090-47c8-bd00-58e9d57610c3.png)

This shell script is responsible for sending some input data to your application via the appropriate port. Each numerical value in here represents some feature that is important for determining the price of a house in Boston. The source code is responsible for passing that data through a trained, machine learning model, and giving back a predicted value for the house price.

## Test with Locust
Performance validation of the webapp can be performed via a load test using locust. Replace '< yourappname >' in the provided configuration and call locust:

![image](https://user-images.githubusercontent.com/110354988/187227307-39044d06-58ef-4e56-961b-7d35460eea0c.png)

## Creating CD using Azure Pipeline
- Before you create a new project, ensure to make your DevOps project allow public access by turning the visibility on in the Organization settings >> Policies section
![image](https://user-images.githubusercontent.com/110354988/187011021-7a5a0bd6-b74e-48bc-b020-04a0c79c512a.png)

- Goto Azure DevOps Organizations, create a new project called Flask-ML-Deploy
![image](https://user-images.githubusercontent.com/110354988/187011079-1fbf4811-7e97-4dd8-9594-d21876a90810.png)

- Go to the project settings >> Service connection settings, and ensure you set up a new service connection via Azure Resource Manager and Service principal (manual). This step will connect your DevOps account with the Azure account.
![image](https://user-images.githubusercontent.com/110354988/187011142-0686d132-ae4f-4658-baab-7866f4c1b897.png)


- Install/enable the Azure Pipelines marketplace app in GitHub from https://github.com/marketplace/azure-pipelines

![image](https://user-images.githubusercontent.com/110354988/187011223-a1fb4ae4-bc83-428e-b04e-808251086823.png)

- After installation, you will have to configure the Azure Pipeline to allow accessing all public repos in your Github account. Though, you can allow access to the specific repositories, but to keep it simple, I have chosen all repositories.

![image](https://user-images.githubusercontent.com/110354988/187011289-5c7fd07e-6dee-42ae-918e-fbd382cde80c.png)

While configuring the Azure Pipeline app settings, look for the Repository access section, and allow the app to access all repositories. Clicking on the Save will try to link to your Azure account.
![image](https://user-images.githubusercontent.com/110354988/187011349-e5027a1c-95fa-49c3-bbca-2d46792f3c8a.png)

- Next, select Pipeline and create a new one
- Create the GitHub Integration
![image](https://user-images.githubusercontent.com/110354988/187011510-82282068-f000-488f-8327-08897fcb785f.png)

- You should see the repository from your GitHub account as the screenshot below. Select Your desire repository.
![image](https://user-images.githubusercontent.com/110354988/187011536-1e946dac-18c8-441c-bb61-ceb30b42a2bb.png)

- In the next step you have to configure the pipline. This is the HEART of the CD process. There is already a config file available in this repository. So select the "Existing Azure Piplines YAML file" otherwise your should select "Starter pipline" option. 
![image](https://user-images.githubusercontent.com/110354988/187011672-a507c31b-fa49-46a4-9d38-3b7f3dc2274c.png)

- The existing YAML config file looks like the followig code:
```
# Starter pipeline    
# Start with a minimal pipeline that you can customize to build and deploy your code.
# Add steps that build, run tests, deploy, and more:
# https://aka.ms/yaml
trigger:
- main

# TODO: Replace the agent pool name
pool: myAgentPool

variables:
  # TODO: Replace the service connection name
  azureServiceConnectionId: 'myServiceConnection'
  
  # TODO: Replace 'mywebapp193576' with the existing Web App name
  webAppName: 'flaskAzureApp'

  # Environment name
  environmentName: 'flaskAzureApp'

  # Project root folder. Point to the folder containing manage.py file.
  projectRoot: $(System.DefaultWorkingDirectory)

stages:
- stage: Build
  displayName: Build stage
  jobs:
  - job: BuildJob
    pool: myAgentPool
    steps:    
    - script: |
        python3.7 -m pip install --upgrade pip
        python3.7 -m pip install setup
        python3.7 -m pip install -r requirements.txt
      workingDirectory: $(projectRoot)
      displayName: 'Install Python Packages'

    - script: |
        export PATH=$HOME/.local/bin:$PATH
        make install
        make lint
      workingDirectory: $(projectRoot)
      displayName: 'Run lint tests'

    - task: ArchiveFiles@2
      displayName: 'Archive files'
      inputs:
        rootFolderOrFile: '$(projectRoot)'
        includeRootFolder: false
        archiveType: zip
        archiveFile: $(Build.ArtifactStagingDirectory)/$(Build.BuildId).zip
        replaceExistingArchive: true

    - upload: $(Build.ArtifactStagingDirectory)/$(Build.BuildId).zip
      displayName: 'Upload package'
      artifact: drop

- stage: Deploy
  displayName: 'Deploy Web App'
  dependsOn: Build
  condition: succeeded()
  jobs:
  - deployment: DeploymentJob
    pool: myAgentPool
    environment: $(environmentName)
    strategy:
      runOnce:
        deploy:
          steps:
          - task: AzureWebApp@1
            displayName: 'Deploy Azure Web App : flaskAzureApp'
            inputs:
              azureSubscription: $(azureServiceConnectionId)
              appName: $(webAppName)
              appType: 'webAppLinux'
              package: $(Pipeline.Workspace)/drop/$(Build.BuildId).zip

```

## Successful build and deploy stages in Azure Pipeline.
![image](https://user-images.githubusercontent.com/110354988/187037296-600d248a-9d47-470a-9841-08c325cfc617.png)


## History of Continuous Delivery in azure piplines.
![image](https://user-images.githubusercontent.com/110354988/187011905-de11a7b7-1db5-4a95-899a-82653eaddaa9.png)


## Successful prediction from deployed flask app in Azure Cloud Shell.

```bash
(.myrepo) odl_user [ ~/boschAIproject2 ]$ ./make_predict_azure_app.sh
Port: 443
{"prediction":[36.357041376594935]}
```

## Output of streamed log files from deployed application
![image](https://user-images.githubusercontent.com/110354988/187012019-d58b169d-5f5d-4bc3-8412-2be9a7603e70.png)


## Enhancements

* Future improvement options

- Make the web application's UI more user friendly.
- Create a dashboard where user can easily see prediction result

## Demo 

[Project overview](https://youtu.be/enK36oQuXEE)

