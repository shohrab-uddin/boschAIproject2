# BOSCH AI - Project 2

[![Python application test with Github Actions](https://github.com/shohrab-uddin/boschAIproject2/actions/workflows/pythonapp.yml/badge.svg)](https://github.com/shohrab-uddin/boschAIproject2/actions/workflows/pythonapp.yml)

# Overview

This repository contains the codebase of a python based machine learnig application. 
- The application is hosted in Azure App Service and can be access from https://flaskazureapp.azurewebsites.net. 
- 'GitHub Actions' is used for Continuous Integration (CI) and 
- 'Azure Devops' is used for Continuous Delivery (CD).

## Project Plan

* You can find the planned tasks for this prject this this [trelleo board](https://trello.com/b/lTvxVyON/python-based-mla).
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

## Project running on Azure App Service
Run the following command to deploy the sourcode into Azure Web App Services and access it later on just like a web application. You must run this command from inside the repositordy directory.

```
.myrepo) odl_user [ ~/boschAIproject2 ]$ az webapp up -g Azuredevops -n flaskAzureApp
```
Here -g means Rsource Group and -n means the name of your application. 

## Creating Azure Pipeline

## Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).



## Running Azure App Service from Azure Pipelines automatic deployment

## Successful prediction from deployed flask app in Azure Cloud Shell.  [Use this file as a template for the deployed prediction](https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn/make_predict_azure_app.sh).
The output should look similar to this:

```bash
udacity@Azure:~$ ./make_predict_azure_app.sh
Port: 443
{"prediction":[20.35373177134412]}
```

* Output of streamed log files from deployed application

> 

## Enhancements

<TODO: A short description of how to improve the project in the future>

## Demo 

<TODO: Add link Screencast on YouTube>

