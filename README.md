# Nightscout Reporter

## 🌿 Fork info
This is a fork of https://github.com/zreptil/nightscout-reporter.  
It augments the existing project with a Dockerfile so you can spin up your own instance of Nightscout Reporter.  
No need to install & configure dependencies.  

Or, just click the big "Run on Google Cloud" button below, and it'll deploy your own private Nightscout Reporter to Google Cloud Run.  
If you're not running anything else on GCP, it should comfortably fit within Google's free tier.

---

A web app based on AngularDart to create PDF documents from nightscout data.

It uses the api from cgm-remote-monitor to access the nightscout data and 
creates some PDFs for handing out to diabetes doctors or coaches. 

Current Dart-SDK version: 2.12.4  
**Note**: Other versions might not work due to incompatible dependencies.

Online version available at: https://nightscout-reporter.zreptil.de/  
Compiled project avaialbe at: https://nightscout-reporter.zreptil.de/nightscout-reporter_local.zip

## Getting started

Initial steps to compile, deploy, and run nightscout reporter on your own infrastructure.

### Preparation
* Download or git clone the repository
* Download an install dart sdk in the stated version (see above) to "C:\tools\dart-sdk"
* Download the [compiled version](https://nightscout-reporter.zreptil.de/nightscout-reporter_local.zip) and extract it

### Build
* Call build.bat from the repository folder in cmd
* Result will be avaialbe in .\build directory
* Copy pdfmake from the downloaded zip to the build folder
* Open .\build\settings.json and set the `urlPDF` and "urlPlayground" option to the location of your pdfmake installation:
```
{
  "urlPDF":"http://your-domain.de/path-to-reporter/pdfmake/pdfmake.php",
  "urlPlayground":"http://your-domain.de/path-to-reporter/pdfmake/playground.php"
}
```

### Deploy
* Get a web server (or online web space) with php support
* Copy content of .\build to the content folder of your web server (or any subfolder)

You can run your own nightscout-reporter instance by calling the URL of your web-server in a browser.

## Alternative deployment options
### Docker
Run `docker-compose up` in the root of the repository, then open http://localhost:8080 in your browser.

### Google Cloud Run
[![Run on Google Cloud](https://deploy.cloud.run/button.svg)](https://deploy.cloud.run)
