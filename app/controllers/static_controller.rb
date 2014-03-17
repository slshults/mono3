class StaticController < ApplicationController

   def home
     render :file => 'static/home.html'
   end

   def faqs
     render :file => 'static/faqs.html'
   end
  
   def aboutus
     render :file => 'static/aboutus.html'
   end

end
