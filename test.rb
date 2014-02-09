require 'mechanize'
class Loopnet
attr_accessor :agent, :page, :form, :button, :uid, :pwd, :logonurl, :posturl

def initialize
  	@uid = "jabenkitson@gmail.com"
  	@pwd = "asda2ww"
  	@posturl = "http://www.loopnet.com/xNet/MainSite/Listing/Manage/Default.aspx?linkcode=19660"
    @logonurl = "http://www.loopnet.com/xNet/MainSite/User/customlogin.aspx?LinkCode=530"
 end 

 def login
    # LOGIN  
     @agent = Mechanize.new
     @agent.get(@logonurl)
    @form = @agent.page.forms.first
    @form['ctlLogin$LogonEmail'] = @uid
    @form['ctlLogin$LogonPassword'] = @pwd
    @button = @form.button_with(:type => 'image')
    @page = @agent.submit(@form,@button)

end
    
    # FILL FOR SALE FORM
  def addsale
    @agent.get(@posturl)
    availtypes = {"office" => 80,"industrial" => 40,"retail" => 90,"health" => 30, "multifamily" => 70, "land" => 50,"agriculture" => 10, "hotel" => 60, "senior" => 100, "sport" => 130, "special" => 120, "residential" => 140}
   @page = @agent.page.link_with(:text => 'Add a sale listing').click
   @form = @page.forms.first
   @form['ForSaleAskingPriceTextBox1'] = '10000'
   @form['PropertyNameTextBox1'] = 'Test Property'
   @form['PropertyAddressTextBox1'] = '1 My Street'
   @form['PropertyCityTextBox1'] = 'Rochester'
   @form['lPropertyPostalCodeTextBox1'] = '55901'
   @form['PropertyDescriptionTextBox1'] = 'This property is fake.'
   @form['PropertyLocationDescriptionTextBox1'] = 'My imagination'
   @form.field_with(:name => "AvailableTypes").option_with(:value => "140").select
   @form.field_with(:name => "SelectedType").options[0].value = "14001"
   @form.field_with(:name => "SelectedType").options[0].select 
   #@form.field_with(:name => "AdditionalTypes").option_with(:value => "802").select
   @form['ucCompInput$txtSalePrice'] = '10000'
   @form['ucCompInput$txtSaleCapRate'] = '20'
   @form['ForSaleCommissionSplitTextBox1'] = '20' 
   @form['ForSaleCapRateTextBox1'] = '20'
   @form['PropertyCountryDropDown1'] = 'US'
   @form['PropertyStateDropDownList1'] = 'MN'
   @form['PropertySizeInfoDropDown1'] = 'USI'
   @form['PropertyPostalCodeTextBox1'] = '55901'
   @form['ExcludeValidationForLastSpaceOrUnit'] = true
   # Insert Text Box for Building Size
   @form['PropertyInfoContainer_PropertySizeTotalTextBox1'] = Mechanize::Form::Text.new(@form.form_node,@form)
   @form['PropertyInfoContainer_PropertySizeTotalTextBox1'] = '10000'
   # Insert Radio Button for Building Class
   button = Mechanize::Form::RadioButton.new(@form.form_node,@form)
   button.name = 'PropertyInfoContainer$PropertyBuildingClassRadioButtonList1'
   #@form['PropertyInfoContainer$PropertyBuildingClassRadioButtonList1'].type = 'radio'
   button.value = 'A'
   button.check
   @form['PropertyInfoContainer$PropertyBuildingClassRadioButtonList1'] = button
   @form.add_button_to_query(button)
   
   @form.radiobutton_with(:id => 'ForSalePropertyUseTypeRadioButtonList1_1').check
   @form.checkbox_with(:name => 'chkListingAgreement').check
   @button = @form.button_with(:name => 'btnAddToMarketPlace')
   @button = @form.button_with(:name => 'AddEditSubmit')
   @page = @agent.submit(@form,@button)
end

def dmp_page 
  f = File.new("page.html", "w") 
  f << @page.body
  f.close
end

def dmp_form 
  f = File.new("form.html", "w") 
  f << @form.fields 
  f.close
end

end
