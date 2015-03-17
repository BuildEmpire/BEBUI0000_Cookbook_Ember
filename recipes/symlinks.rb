#
# Cookbook Name:: cookbook_ember
# Recipe:: symlinks
#
# Since Vagrant on an NTFS host doesn't support symlinks properly,
# We decided to move the node_modules and tmp directory off the shared disk.
# We do so by creating them on the VM and symlinking.

# Setup the symlinks we want
symlinks = []
if node['cookbook_ember']['paths']['node_modules']
  symlinks << {
    'from' => "#{node['cookbook_ember']['paths']['app']}/node_modules",
    'to' => node['cookbook_ember']['paths']['node_modules']
  }
end
if node['cookbook_ember']['paths']['tmp']
  symlinks << {
    'from' => "#{node['cookbook_ember']['paths']['app']}/tmp",
    'to' => node['cookbook_ember']['paths']['tmp']
  }
end

# For each of the symlinks
symlinks.each_with_index do |symlink, index|

  from = symlink['from']
  to = symlink['to']

  # Delete the current link
  directory from do
    recursive true
    action :delete
    not_if "test -L #{from}"
  end

  # Create the actual directory
  directory to do
    owner 'vagrant'
    group 'vagrant'
  end

  # Create the symlink
  link from do
    owner 'vagrant'
    group 'vagrant'
    to to
  end

end