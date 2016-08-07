# PushJetR

An R interface to http://pushjet.io. It is similar to
[RPushBullet](https://github.com/eddelbuettel/rpushbullet) and
[pushoverr](https://github.com/briandconnelly/pushoverr) but didn't require any
registration.

# Install

```r
devtools::install_github("sgibb/pushjetr")
```

# Setup

Install the PushJet.io app from google play: https://play.google.com/store/apps/details?id=io.Pushjet.api

Before you can use `pushjetr` the first time you have to create a service
(channel) and store it in your .Rprofile:

```r
## load pushjetr
library("pushjetr")

## create a service (channel)
service <- createService("R")

## store the private key in your .Rprofile
service$secret
# e8e5d756228686edbe6dd31d93edf9c9
# put the following in your .Rprofile (replace the secret with your own token):
# options(pushjetr.secret="e8e5d756228686edbe6dd31d93edf9c9")

## start the PushJet app on your phone and subscribe to the channel via
## "Enter Token" and insert the following token
service$public

## or use "Scan QR-Code"
library("qrcode")
qrcode_gen(service$public)
```

# Usage

```r
pjmsg("New Message", "Title of the message", level=3)
```

