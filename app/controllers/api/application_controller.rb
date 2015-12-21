class Api::ApplicationController < ApplicationController
  class InvalidParameterError < ActionController::ActionControllerError; end
end
