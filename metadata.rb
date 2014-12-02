name             "s3cmd"
maintainer       "Robby Grossman"
maintainer_email "robby@freerobby.com"
license          "Apache 2.0"
description      "Installs and configures s3cmd"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"

recipe "s3cmd", "Installs and configures s3cmd"

supports "ubuntu"
