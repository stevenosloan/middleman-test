namespace :specs do

  def with_gemfile gemfile, clean=false, &block
    Bundler.with_clean_env do
      gemfile = File.expand_path(gemfile)
      ENV['BUNDLE_GEMFILE'] = gemfile

      unless File.exist?( "#{gemfile}.lock")
        args = ["--quiet"]
        puts "bundling #{gemfile}"
        `bundle install --gemfile='#{gemfile}' #{args.join(' ')}`
      end

      system "bundle exec '#{yield}'"
    end
  end

  def tracer msg
    puts ""
    puts (0..(msg.length+10)).map { |i| "=" }.join
    puts "     #{msg}"
    puts (0..(msg.length+10)).map { |i| "=" }.join
  end

  desc "run middleman specs with currently stable middleman"
  task :stable do
    tracer "running specs on stable middleman 3.3.x on ruby #{RUBY_VERSION}"
    with_gemfile 'spec/gemfiles/middleman.3.3.gemfile' do
      'rspec spec/'
    end
  end

end

desc "run all specs on ruby #{RUBY_VERSION}"
task :specs do
  Rake::Task['specs:stable'].invoke
end
