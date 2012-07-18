# list of users that will have the s3cmd configuration 
default[:s3cmd][:users] = [:root]

# S3 credentials
default[:s3cmd][:aws_access_key_id] = ""
default[:s3cmd][:aws_secret_access_key] = ""

default[:s3cmd][:version] = "v1.1.0-beta3"
default[:s3cmd][:user] = "root"
default[:s3cmd][:install_prefix_root] = "/usr/local"