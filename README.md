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

### Install Python Packages, Test and Lint
Run 'make all' command. The Makefile looks as follows:
```
setup:
	python3 -m venv ~/.flask-ml-azure
	#source ~/.flask-ml-azure/bin/activate
	
install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb


lint:
	#hadolint Dockerfile #uncomment to explore linting Dockerfiles
	pylint --disable=R,C,W1203,bare-except --fail-under=6 app.py

all: install lint test

```
Local test result should look like this:

![image](https://user-images.githubusercontent.com/110354988/187009590-57013d72-4090-4c4f-85b5-baec75bc2546.png)


## Project running on Azure App Service
Run the following command to deploy the sourcode into Azure Web App Services and access it later on just like a web application. You must run this command from inside the repositordy directory.

```
.myrepo) odl_user [ ~/boschAIproject2 ]$ az webapp up -g Azuredevops -n flaskAzureApp
```
Here -g means Rsource Group and -n means the name of your application. 

## Passing tests that are displayed after running the `make all` command from the `Makefile`

## Output of a test run

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





## Github Actions - CI Build ##
![image](https://user-images.githubusercontent.com/110354988/186958894-2cdb2df2-5f56-4342-8a3f-cac881035fcd.png)
