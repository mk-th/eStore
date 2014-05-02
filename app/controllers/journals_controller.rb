class JournalsController < ApplicationController
  before_action :set_journal, only: [:show, :edit, :update, :destroy]

  # GET /journals
  # GET /journals.json
  def index
    @account = Account.find(params[:account_id])
    @journals = @account.journals
  end

# GET /journals/0
# GET /journals/0.json
  def list
    @journals = Journal.all
  end


  # GET /journals/1
  # GET /journals/1.json
  def show
    @account = Account.find(params[:account_id])
  end

  # GET /journals/new
  def new
    @journal = Journal.new
    @accounts = Account.all
  end

  # GET /journals/1/edit
  def edit
    @accounts = Account.all
    @account = Account.find(params[:account_id])
  end

  # POST /journals
  # POST /journals.json
  def create
    @journal = Journal.new(journal_params)

    respond_to do |format|
      if @journal.save
        flash[:notice] = 'Roz-Namcho Entry was successfully created in ' + @journal.account.account_name + "'s Account."
        format.html { redirect_to action: "new" }
        format.json { render :show, status: :created, location: @journal }
      else
        format.html { render :new }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journals/1
  # PATCH/PUT /journals/1.json
  def update
    respond_to do |format|
      if @journal.update(journal_params)
        flash[:notice] = 'Roz-Namcho Entry was successfully updated in ' + @journal.account.account_name + "'s Account."
        format.html { redirect_to action: "index" }
        format.json { render :show, status: :ok, location: @journal }
      else
        format.html { render :edit }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journals/1
  # DELETE /journals/1.json
  def destroy
    @account = Account.find(params[:account_id])
    @journal.destroy
    respond_to do |format|
      flash[:notice] = 'Roz-Namcho Entry was successfully deleted from ' + @journal.account.account_name + "'s Account."
      format.html { redirect_to account_journals_path(@account) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journal
      @journal = Journal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_params
      params.require(:journal).permit(:journal_date, :account_id, :journal_amount, :journal_entry_type, :journal_entry_description)
    end
end
