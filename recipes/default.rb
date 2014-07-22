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

python_pip "pyinotify" do
  action :install
end

python_pip "networkx" do
  action :install
end
python_pip "pyzmq" do
  action :install
end
python_pip "pyftpdlib" do
  action :install
end
python_pip "tftpy" do
  action :install
end
python_pip "pika" do
  action :install
end

