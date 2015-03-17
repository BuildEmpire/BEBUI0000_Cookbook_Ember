#
# Cookbook Name:: cookbook_ember
# Recipe:: npm
#

# Install npm itself
include_recipe "nodejs::npm"

# Install the packages that ember development requires
nodejs_npm "bower" do
end
nodejs_npm "ember-cli" do
end
nodejs_npm "phantomjs" do
end