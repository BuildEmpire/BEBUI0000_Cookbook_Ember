name             'cookbook_ember'
maintainer       'Fred Thompson'
maintainer_email 'fred.thompson@buildempire.co.uk'
license          'Apache 2.0'
description      'The Ember cookbook, adds everything you need to develop with Ember.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

recipe 'cookbook_ember', 'The Ember cookbook, adds everything you need to develop with Ember.'

%w{ ubuntu }.each do |os|
  supports os
end

%w{nodejs}.each do |cb|
  depends cb
end