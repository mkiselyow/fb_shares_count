require 'nokogiri'
require 'json'

namespace :meter do

  desc "Show facebook shares count"

  task :parse, [:addr, :limit] => [:environment] do |t, args|

    args.with_defaults(limit: 300)

    site = Site.create(domain: args['addr'])

    site.parse(args['limit'])
  end

end
