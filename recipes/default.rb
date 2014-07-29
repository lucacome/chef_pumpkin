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

git "~/pumpkin" do
  repository "git://github.com/recap/pumpkin.git"
  reference "master"
  action :sync
end

execute "install python pumpkin" do
  command "sudo python setup.py install"
  cwd "~/pumpkin"
end

template "~/pmk-seeds/collector.py" do
  source "collector.py.erb"
end

template "~/pmk-seeds/filter.py" do
  source "filter.py.erb"
end

template "~/pmk-seeds/tweetinject.py" do
  source "tweetinject.py.erb"
end

template "~/nltk_data/classifiers/movie_reviews_NaiveBayes.pickle" do
  source "movie_reviews_NaiveBayes.pickle.erb"
end

template "~/pumpkin/pumpkin.cfg" do
  source "pumpkin.cfg.erb"
end
