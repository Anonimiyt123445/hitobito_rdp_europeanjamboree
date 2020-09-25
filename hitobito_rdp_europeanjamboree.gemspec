$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your wagon's version:
require 'hitobito_rdp_europeanjamboree/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  # rubocop:disable SingleSpaceBeforeFirstArg
  s.name        = 'hitobito_rdp_europeanjamboree'
  s.version     = HitobitoRdpEuropeanjamboree::VERSION
  s.authors     = ['Peter Neubauer']
  s.email       = ['development@smeky.de']
  # s.homepage    = 'TODO'
  s.summary     = 'Rdp Europeanjamboree'
  s.description = 'Hitobito Wagon for the registration of the German Contingent for the European Jamboree 2020+1'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['Rakefile']
  s.test_files = Dir['test/**/*']
  # rubocop:enable SingleSpaceBeforeFirstArg
end
