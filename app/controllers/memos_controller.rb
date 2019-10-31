class MemosController < ApplicationController
    def index
        @memos = Memo.all
        @memo = Memo.new
    end

    def create 
        @memo  = Memo.create(memo_params)
        p @memo.id
        redirect_to edit_memo_path(@memo)
    end

    def edit
        @memos = Memo.all
        @memo_new = Memo.new
        @memo = Memo.find(params[:id])
    end

    def update
        UpdateWorker.perform_async(params[:id],memo_params[:title],memo_params[:text])
    end

    def destroy
        @memo = Memo.find(params[:id])
        @memo.destroy
        redirect_to memos_path
    end

    private
        def memo_params
            params.require(:memo).permit(:title,:text)
        end
end
