class UpdateWorker
    include Sidekiq::Worker
    sidekiq_options retry: false
  
    def perform(id,title,text)
        memo = Memo.find(id)
        memo.update(
            title:title,
            text:text
        )
    end
end