###########################
# Guardfile for SailorBoy #
###########################

# See https://github.com/guard/guard-rspec

guard :rspec, cmd: 'spring rspec --format Fuubar --no-profile', all_on_start: true do
  require 'guard/rspec/dsl'
  dsl = Guard::RSpec::Dsl.new(self)

  # RSpec files
  rspec = dsl.rspec
  watch(rspec.spec_helper) { rspec.spec_dir }
  watch(rspec.spec_support) { rspec.spec_dir }
  watch(rspec.spec_files) do |m|
    [
      m[0] # run the changed spec file!
    ]
  end

  # Ruby files
  ruby = dsl.ruby
  dsl.watch_spec_files_for(ruby.lib_files)

  # Rails files
  rails = dsl.rails(view_extensions: %w(erb haml slim))
  dsl.watch_spec_files_for(rails.app_files)
  dsl.watch_spec_files_for(rails.views)

  # Controllers
  watch(rails.controllers) do |m|
    specs = [
      # "#{rspec.spec_dir}/routing/#{m[1]}_routing.rb",
      # "#{rspec.spec_dir}/controllers/#{m[1]}_controller.rb",
      # "#{rspec.spec_dir}/acceptance/#{m[1]}.rb",
      "#{rspec.spec_dir}/requests/#{m[1]}_spec.rb"
    ]
    # If "base" costs_controller changes, also run "child" (eg. /api/v2/*) specs
    if %r{^api\/v2} !~ m[1]
      specs << "#{rspec.spec_dir}/requests/api/v2/#{m[1]}_spec.rb"
    end
    specs
  end

  # Services
  watch(%r{^spec/services/(.+)\.rb$}) { |m| "#{rspec.spec_dir}/services/#{m[1]}_spec.rb" }

  # Jobs
  watch(%r{^spec/jobs/(.+)\.rb$}) { |m| "#{rspec.spec_dir}/jobs/#{m[1]}_spec.rb" }

  # Mailers
  watch(%r{^spec/mailers/(.+)\.rb$}) { |m| "#{rspec.spec_dir}/mailers/#{m[1]}_spec.rb" }

  # FactoryGirl Factories
  watch(%r{^spec/factories/(.+)\.rb$}) do |m|
    [
      "#{rspec.spec_dir}/models/#{m[1].chomp('s')}_spec.rb"
    ]
  end

  # Rails config changes
  watch(rails.spec_helper) { rspec.spec_dir }
  watch(rails.routes)      { "#{rspec.spec_dir}/routing" }

  watch(rails.app_controller) do
    [
      "#{rspec.spec_dir}/controllers",
      "#{rspec.spec_dir}/requests"
    ]
  end
end
