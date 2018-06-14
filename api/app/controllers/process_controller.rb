require 'my_app/gateway/sidekiq'

class ProcessController < ApplicationController
  def create
    job = MyApp::Gateway::Sidekiq.new
    job.do_later(
      klass: 'MyWorker',
      args: [params['complexity']]
    )
  end
end
