" Post a mentor log
command! FirehosePostMentorLog execute "!BUNDLE_GEMFILE=$VIM_PROJECT_PATH_FIREHOSE_POST_A_MENTOR_SESSION/Gemfile bundle exec ruby $VIM_PROJECT_PATH_FIREHOSE_POST_A_MENTOR_SESSION/main.rb " . shellescape(expand('%:p'))
