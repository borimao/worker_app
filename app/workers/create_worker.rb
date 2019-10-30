class CreateWorker
    include Sidekiq::Worker
    sidekiq_options retry: false
  
    def perform(title)
       p title
    end
end