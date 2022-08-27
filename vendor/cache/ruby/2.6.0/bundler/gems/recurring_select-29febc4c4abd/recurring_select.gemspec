# -*- encoding: utf-8 -*-
# stub: recurring_select 3.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "recurring_select".freeze
  s.version = "3.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jobber".freeze, "Forrest Zeisler".freeze, "Nathan Youngman".freeze, "Gregory Schmit".freeze]
  s.date = "2022-08-27"
  s.description = "This gem provides a useful interface for creating recurring rules for the ice_cube gem.".freeze
  s.email = ["schmitgreg@gmail.com".freeze]
  s.files = ["MIT-LICENSE".freeze, "README.md".freeze, "Rakefile".freeze, "app/assets/images/recurring_select".freeze, "app/assets/images/recurring_select/cancel.png".freeze, "app/assets/images/recurring_select/throbber_13x13.gif".freeze, "app/assets/javascripts/jquery-mobile-rs.js.coffee".freeze, "app/assets/javascripts/recurring_select".freeze, "app/assets/javascripts/recurring_select.js.coffee".freeze, "app/assets/javascripts/recurring_select/fr.js.coffee".freeze, "app/assets/javascripts/recurring_select_dialog.js.coffee.erb".freeze, "app/assets/stylesheets/jquery-mobile-rs.scss".freeze, "app/assets/stylesheets/recurring_select.scss".freeze, "app/assets/stylesheets/utilities.scss".freeze, "config/locales/en.yml".freeze, "config/locales/fr.yml".freeze, "config/locales/nl.yml".freeze, "config/routes.rb".freeze, "lib/helpers".freeze, "lib/helpers/recurring_select_helper.rb".freeze, "lib/middleware".freeze, "lib/middleware/recurring_select_middleware.rb".freeze, "lib/recurring_select".freeze, "lib/recurring_select.rb".freeze, "lib/recurring_select/engine.rb".freeze, "lib/recurring_select/version.rb".freeze]
  s.homepage = "http://github.com/getjobber/recurring_select".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3.1".freeze
  s.summary = "A select helper which gives you magical powers to generate ice_cube rules.".freeze

  s.installed_by_version = "3.0.3.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>.freeze, [">= 5.2"])
      s.add_runtime_dependency(%q<jquery-rails>.freeze, [">= 3.0"])
      s.add_runtime_dependency(%q<ice_cube>.freeze, [">= 0.11"])
      s.add_runtime_dependency(%q<sass-rails>.freeze, [">= 4.0"])
      s.add_runtime_dependency(%q<coffee-rails>.freeze, [">= 3.1"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 1.3.5"])
      s.add_development_dependency(%q<rspec-rails>.freeze, [">= 2.14"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 2.14"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0.9.6"])
    else
      s.add_dependency(%q<rails>.freeze, [">= 5.2"])
      s.add_dependency(%q<jquery-rails>.freeze, [">= 3.0"])
      s.add_dependency(%q<ice_cube>.freeze, [">= 0.11"])
      s.add_dependency(%q<sass-rails>.freeze, [">= 4.0"])
      s.add_dependency(%q<coffee-rails>.freeze, [">= 3.1"])
      s.add_dependency(%q<bundler>.freeze, [">= 1.3.5"])
      s.add_dependency(%q<rspec-rails>.freeze, [">= 2.14"])
      s.add_dependency(%q<rspec>.freeze, [">= 2.14"])
      s.add_dependency(%q<rake>.freeze, [">= 0.9.6"])
    end
  else
    s.add_dependency(%q<rails>.freeze, [">= 5.2"])
    s.add_dependency(%q<jquery-rails>.freeze, [">= 3.0"])
    s.add_dependency(%q<ice_cube>.freeze, [">= 0.11"])
    s.add_dependency(%q<sass-rails>.freeze, [">= 4.0"])
    s.add_dependency(%q<coffee-rails>.freeze, [">= 3.1"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.3.5"])
    s.add_dependency(%q<rspec-rails>.freeze, [">= 2.14"])
    s.add_dependency(%q<rspec>.freeze, [">= 2.14"])
    s.add_dependency(%q<rake>.freeze, [">= 0.9.6"])
  end
end
