class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def show
    @single_room = Room.find(params[:id])
    @messages = @single_room.messages
    @message = Message.new
    @room = Room.new
    @rooms = Room.public_rooms
    @current_user = current_user
    @users = User.all_except(current_user)
    render 'index'
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:success] = 'Room created'
    else
      flash[:danger] = 'Error when creating room'
    end
  end

  def index
    @room = Room.new
    @current_user = current_user
    redirect_to login_path unless @current_user
    @rooms = Room.public_rooms
    # the lambda we created in room.rb is called here .
    #  public_rooms is scope name or name of lambda
    @users = User.all_except(@current_user)
    # the lambda we created in user.rb is called here .
    # all_except is scope name or name of lambda
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
