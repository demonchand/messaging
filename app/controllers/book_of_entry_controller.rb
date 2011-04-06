class BookOfEntryController < ApplicationController
  def index
    @book = Journal.all
  end

end
