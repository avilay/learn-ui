# Google Workspaces API
This is what we use for accessing GMail over a REST API.

### 1. Create a python 3.7 environment
GCP SDK works best with Python 3.7. So do this first.

```
conda create --name py37 python=3.7
conda activate py37
```

### 2. Install the Cloud SDK
Go [here](https://cloud.google.com/sdk/docs/install) to get the download instructions. Usually it is just a .tar.gz file that needs to be unzipped at some temporary location. The linked page asks you to run a couple of commands that I am copying here for future reference, but knowing Google, these will be probably oudated by tomorrow.

```
./google-cloud-sdk/install.sh
./google-cloud-sdk/bin/gcloud init
```

The last command will open my default browser and ask me to log in. After that it will ask me a bunch of questions. This [page](https://cloud.google.com/sdk/docs/initializing) has some hints on how to configure. At the end of this all I should have the `gcloud` CLI available.

```
$ gcloud --version
Google Cloud SDK 353.0.0
bq 2.0.71
core 2021.08.13
gsutil 4.66
```

### 3. Enable Gmail API
This is pretty standard, go to **GCP Console > APIs & Services** and then enable the **GMail API**.

### 4. Create Credentials
This one is a bit messy. Use [this page](https://developers.google.com/workspace/guides/create-credentials) as a reference, but **don't** follow all the instructions there. Just do this in order:
  1. Configure the OAuth consent screen
  2. Create a OAuth client ID credential

No need to create a service account. I have already created a OAuth2.0 client ID called **newsletter** in the avilabs GCP project. There will be a button to download the client secret json. Download it and keep it somewhere safe along with the rest of the software keys. I have named this file `gcp_newsletterapp_client_secret.json`. In the code I use this file to obtain an access token and store it as `token.json`.

