# stt
Generate transcript from audio on GCS by Google Cloud speech-to-test.

## How to use
### Set up credentials
[Setting Up Authentication for Server to Server Production Applications  |  Authentication  |  Google Cloud](https://cloud.google.com/docs/authentication/production)

### Prepare monoral flac audio file and upload is to Google Cloud Storage bucket

![FL Studio export config example](https://user-images.githubusercontent.com/4487291/62323552-83e5e100-b4e2-11e9-80ae-ac5177853a55.png)

Create monoral audio as flac.

### Run script
```shell
$ bundle exec ruby script.rb gs://bucket/filename.flac
```

### Wait a moment :hourglass_flowing_sand:
:coffee:
