git clone git@github.com:shohrab-uddin/boschAIproject2.git
git pull
python3 -m venv ~/.myrepo
source ~/.myrepo/bin/activate
cd boschAIproject2
make all
az webapp up g- Azuredevops -n flaskAzureApp