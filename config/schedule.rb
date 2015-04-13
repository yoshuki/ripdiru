# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

set :output, '$HOME/ripdiru.log'

env :LANG, ENV['LANG']
env :PATH, ENV['PATH']

env :RIPDIRU_OUTDIR, ENV['RIPDIRU_OUTDIR'] if ENV['RIPDIRU_OUTDIR']
env :RIPDIRU_BITRATE, ENV['RIPDIRU_BITRATE'] if ENV['RIPDIRU_BITRATE']

job_type :ripdiru, 'cd :path && :bundle_command bin/ripdiru :task :output'

# kaiwa
every '44 6 * * 1-5' do
  ripdiru 'NHK2'
end
