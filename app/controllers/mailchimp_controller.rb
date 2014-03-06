class mailchimpformController < ApplicationController 


 def index
  end

  def submit
    mailchimp_api_key = "fea54099e83c0446e0f54ead2808ae56-us6"
    mailchimp_list_id = "6516df41bf"
    g = Gibbon.new(mailchimp_api_key)
    response = g.list_subscribe({:id => mailchimp_list_id,
                                :email_address => params[:email],
                                :double_optin => false,
                                :send_welcome => false})

    if(response.is_a?(Hash))
     puts response
    case response['code']
     when 502
      @js_email_error = "Invalid Address!"
     when 214
      @js_email_error = "Already signed up!"
     else
      @js_email_error = response['error']
    end
      @js_email_success = nil
    else
      @js_email_success = "Thanks!"
      @js_email_error = nil
    end
    respond_to do |format|
     format.js
    end
    end
  end