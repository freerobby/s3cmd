#
# Cookbook Name:: s3cmd
# Recipe:: default
#

package "git-core"
package "python-setuptools"
# Newer versions of s3cmd require "dateutil"
package "python-dateutil"

directory "#{node[:s3cmd][:install_prefix_root]}/share/s3cmd" do
  action :create
end

git "#{node[:s3cmd][:install_prefix_root]}/share/s3cmd" do
  repository "git://github.com/s3tools/s3cmd.git"
  reference node[:s3cmd][:version]
  action :sync
end

execute "build_s3cmd" do
  user node[:s3cmd][:user]
  cwd "#{node[:s3cmd][:install_prefix_root]}/share/s3cmd"
  command "python setup.py install"
  action :run
end

# Link the binary to the one we built
link "#{node[:s3cmd][:install_prefix_root]}/bin/s3cmd" do
  to "#{node[:s3cmd][:install_prefix_root]}/share/s3cmd/s3cmd"
  action :create
end

#deploy configuration for each user. Change s3cfg.erb template in your site cookbook to set 
#you access key and secret. 
node[:s3cmd][:users].each do |user|   
  home = user.to_s == :root.to_s ? "/root" : "/home/#{user}"
  
  template "s3cfg" do
      path "#{home}/.s3cfg"
      source "s3cfg.erb"
      user "#{user}"
      group "#{user}"
      mode 0600
  end
end
