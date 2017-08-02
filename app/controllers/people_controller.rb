class PeopleController < ApplicationController
  def index
    @persons = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_param)
    if @person.save
      redirect_to people_path, notice: "The person has created..." and return
    end
    render 'new'
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    @first_name = @person.first_name
    @last_name = @person.last_name


    if @person.update_attributes(person_param)
      redirect_to people_path, notice: "#{@first_name} #{@last_name} is updated" and return
    end
    render 'edit'
  end

  def destroy
    @person = Person.find(params[:id])
    @first_name = @person.first_name
    @last_name = @person.last_name
    @person.destroy

    redirect_to people_path, notice: "#{@first_name} #{@last_name} is destoyed" and return
  end
private
  def person_param
    params.require(:person).permit(:first_name, :last_name, :email, :notes)
  end
end
