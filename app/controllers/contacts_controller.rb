class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all.page(params[:page]).per(5)
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    respond_to do |format|
      format.js
    end
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    @contact.build_address    
  end

  # GET /contacts/1/edit
  def edit
    load_cities_by_state(@contact.address.state)
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to(contacts_path, notice: 'Contato criado com sucesso.') }
        format.json { render :show, status: :created, location: @contact }
      else
        unless @contact.address.state.blank?
          load_cities_by_state(@contact.address.state)
        end

        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to(contacts_path, notice: 'Contato atualizado com sucesso.') }
        format.json { render :show, status: :ok, location: @contact }
      else
        unless @contact.address.state.blank?
          load_cities_by_state(@contact.address.state)
        end
        
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contato removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  def update_cities
    state = State.find_by(name: params[:state_name])
    @cities = City.where("state_id = ?", state.id)
    
    respond_to  do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def load_cities_by_state(state_name)
      state = State.find_by(name: state_name)
      @cities = City.where("state_id = ?", state.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :birth_date, :gender, :preference_ids => [],
        :address_attributes =>[
                                :street, :zip_code, :city, :state
                              ]
      )
    end
end
