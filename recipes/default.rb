#
# Cookbook Name:: s3cmd
# Recipe:: default
#

#install s3cmd
package "s3cmd" do 
  action :upgrade
end


#deploy configuration for each user. Change s3cfg.erb template in your site cookbook to set 
#you access key and secret. 
node[:s3cmd][:users].each do |user| 
  
  home = user == :root ? "/root" : "/home/#{user}"
  
  template "s3cfg" do
      path "#{home}/.s3cfg"
      source "s3cfg.erb"
      mode 0655
  end  
end