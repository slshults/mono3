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

   def sandbox
     render :file => 'static/sandbox.html'
   end

end
