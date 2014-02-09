class OfficesController < ApplicationController

  def loopnet

    
  	login = "jabenkitson@gmail.com"
  	pwd = "asda2ww"
  	posturl = "http://www.loopnet.com/xNet/MainSite/Listing/Manage/Default.aspx?linkcode=19660"
    logonurl = "http://www.loopnet.com/xNet/MainSite/User/customlogin.aspx?LinkCode=530"
  
    # LOGIN  
    agent = Mechanize.new
    agent.get(logonurl)
    form = agent.page.forms.first
    form['ctlLogin$LogonEmail'] = login
    form['ctlLogin$LogonPassword'] = pwd
    button = form.button_with(:type => 'image')
    page = agent.submit(form,button)

    agent.get(posturl)
    
    # FILL FOR SALE FORM
    availtypes = {"office" => 80,"industrial" => 40,"retail" => 90,"health" => 30, "multifamily" => 70, "land" => 50,"agriculture" => 10, "hotel" => 60, "senior" => 100, "sport" => 130, "special" => 120, "residential" => 140}
    page = agent.page.link_with(:text => 'Add a sale listing').click
    form = page.forms.first

    form['ForSaleAskingPriceTextBox1'] = '10000'
    form['PropertyNameTextBox1'] = 'Test Property'
    form['PropertyAddressTextBox1'] = '1 My Street'
    form['PropertyCityTextBox1'] = 'Rochester'
    form['lPropertyPostalCodeTextBox1'] = '55901'
    form['PropertyDescriptionTextBox1'] = 'This property is fake.'
    form['PropertyLocationDescriptionTextBox1'] = 'My imagination'
    form.field_with(:name => "AvailableTypes").options.first.select
    form['SelectedType'] = 80
    form['ucCompInput$txtSalePrice'] = '10000'
    form['ucCompInput$txtSaleCapRate'] = '100'
    form['ForSaleCapRateTextBox1'] = '100'
    form['PropertyCountryDropDown1'] = 'US'
    form['PropertyStateDropDownList1'] = 'MN'
    form['PropertySizeInfoDropDown1'] = 'USI'
    form.radiobutton_with(:id => 'ForSalePropertyUseTypeRadioButtonList1_1').check
    form.checkbox_with(:name => 'chkListingAgreement').check
    button = form.button_with(:name => 'btnAddToMarketPlace')
    page = agent.submit(form,button)




#LEASE
#property type
#property name
#country
#street address
#city
#state
#zipcode
#space available
#rental rate
#lease type
#property description
#location description
#listing agreement
  end

  def mncar
  end

  def craigslist
  end
end
