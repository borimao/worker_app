class StaticPagesController < ApplicationController
    def index
        SampleWorker.perform_async("aaa")
    end
end
