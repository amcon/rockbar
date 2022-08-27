# -*- encoding: utf-8 -*-
# stub: mailchimp-api 2.0.7 ruby lib

Gem::Specification.new do |s|
  s.name = "mailchimp-api".freeze
  s.version = "2.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["MailChimp Devs".freeze]
  s.date = "2021-04-01"
  s.description = "Deprecated. Replaced by MailchimpMarketing - A Ruby API library for the MailChimp email platform".freeze
  s.email = "api@mailchimp.com".freeze
  s.homepage = "https://bitbucket.org/mailchimp/mailchimp-api-ruby/".freeze
  s.rubygems_version = "3.0.3.1".freeze
  s.summary = "Deprecated. Replaced by MailchimpMarketing - A Ruby API library for the MailChimp email platform.".freeze

  s.installed_by_version = "3.0.3.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>.freeze, [">= 1.7.7"])
      s.add_runtime_dependency(%q<excon>.freeze, [">= 0.16.0"])
    else
      s.add_dependency(%q<json>.freeze, [">= 1.7.7"])
      s.add_dependency(%q<excon>.freeze, [">= 0.16.0"])
    end
  else
    s.add_dependency(%q<json>.freeze, [">= 1.7.7"])
    s.add_dependency(%q<excon>.freeze, [">= 0.16.0"])
  end
end
