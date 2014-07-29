#
# Cookbook Name:: UvA
# Recipe:: default
#
# Copyright (C) 2014 
#
# 
#
default_user = "1000"
home_path = "/home/"+default_user

template home_path+"/temp_UvA" do
  source 'temp_UvA.erb'
end

git home_path+"/pumpkin" do
  repository "git://github.com/recap/pumpkin.git"
  reference "master"
  action :sync
end

directory home_path+"/pumpkin" do
  owner default_user
  group default_user
  mode 00755
end

execute "install python pumpkin" do
  command "sudo python setup.py install"
  cwd home_path+"/pumpkin"
end

directory home_path+"/pmk-seeds" do
  owner default_user
  group default_user
  mode 00755
  action :create
end

template home_path+"/pmk-seeds/collector.py" do
  source "collector.py.erb"
  owner default_user
  group default_user
  mode 00644
end

template home_path+"/pmk-seeds/filter.py" do
  source "filter.py.erb"
  owner default_user
  group default_user
  mode 00644
end

template home_path+"/pmk-seeds/tweetinject.py" do
  source "tweetinject.py.erb"
  owner default_user
  group default_user
  mode 00644
end

%w[ /nltk_data /nltk_data/classifiers ].each do |path|
  directory home_path+path do
    owner default_user
    group default_user
    mode 00755
    action :create
  end
end

template home_path+"/nltk_data/classifiers/movie_reviews_NaiveBayes.pickle" do
  source "movie_reviews_NaiveBayes.pickle.erb"
  owner default_user
  group default_user
  mode 00644
end

template home_path+"/pumpkin/pumpkin.cfg" do
  source "pumpkin.cfg.erb"
  owner default_user
  group default_user
  mode 00644
end

