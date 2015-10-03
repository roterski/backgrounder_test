This repo is created to test manually https://github.com/lardawge/carrierwave_backgrounder/pull/217

You can test `:delayed_job` and `:sidekiq` background workers by setting it in [application.rb](https://github.com/piotrkaczmarek/backgrounder_test/blob/master/config/application.rb#L25).

### Installation
````bash
bundle
rake db:create
rake db:migrate
rake db:seed
````
### Test scenario
1. Turn on only rails server:

  `
  rails s
  `
2. Go to [localhost:3000](http://localhost:3000) .
3. Choose photo file to upload.
4. Hit `Upload` button.
5. Picture is now uploaded and it's waiting for background worker to be processed. Since we didn't turn on any worker there should be 404 broken image tag on page. You can wait and refresh the page but it should not change.
6. Turn on the correct (specified in [application.rb](https://github.com/piotrkaczmarek/backgrounder_test/blob/master/config/application.rb#L25)) background worker:
  - delayed_job:
  `
  rake jobs:work
  `
  - or sidekiq:
  `
  sidekiq
  `
7. Wait few seconds and hit refresh.
8. Processed picture should be visible on the page.
