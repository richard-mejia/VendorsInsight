class LoginController < ApplicationController
def index	
 @vendedor = Usuario.first
end
end
