class SampleWorker
  include Sidekiq::Worker

  def perform(data)
    p 'work: title=' + data
  end
end
