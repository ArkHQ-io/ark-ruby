# frozen_string_literal: true

require_relative "lib/ark_email/version"

Gem::Specification.new do |s|
  s.name = "ark-email"
  s.version = ArkEmail::VERSION
  s.summary = "Ruby library to access the Ark API"
  s.authors = ["Ark"]
  s.email = "hi@arkhq.io"
  s.homepage = "https://gemdocs.org/gems/ark-email"
  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/ArkHQ-io/ark-ruby"
  s.metadata["rubygems_mfa_required"] = false.to_s
  s.required_ruby_version = ">= 3.2.0"

  s.files = Dir[
    "lib/**/*.rb",
    "rbi/**/*.rbi",
    "sig/**/*.rbs",
    "manifest.yaml",
    "SECURITY.md",
    "CHANGELOG.md",
    ".ignore"
  ]
  s.extra_rdoc_files = ["README.md"]
  s.add_dependency "cgi"
  s.add_dependency "connection_pool"
end
