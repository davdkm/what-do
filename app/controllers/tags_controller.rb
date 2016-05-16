class TagsController < ApplicationController

    def create
      @event = Event.find_by(id: params[:tag][:event_id])
      @tag = Tag.find_or_create_by(name: tag_params[:name])
      @event.tags << @tag unless @event.tags.include?(@tag)
      if @tag.save
        redirect_to request.referer, flash: {notice: 'You have sucessfully tagged this event'}
      else
        redirect_to request.referer, flash: {error: 'Could not tag this event'}
      end
    end

    private
      def tag_params
        params.require(:tag).permit(:event_id, :name)
      end
end
