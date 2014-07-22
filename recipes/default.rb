#
# Cookbook Name:: UvA
# Recipe:: default
#
# Copyright (C) 2014 
#
# 
#
template '/home/ubuntu/temp_UvA' do
  source 'temp_UvA.erb'
end

git "/home/ubuntu/pumpkin" do
  repository "git://github.com/recap/pumpkin.git"
  reference "master"
  action :sync
end

execute "install python pumpkin" do
  command "sudo python setup.py install"
  cwd "/home/ubuntu/pumpkin"
end
