class SessionsController < ApplicationController
  session[:data] = [
    { id: "1", title: "Harry Potter", author: "J.K Rowling" },
    { id: "2", title: "Name of the wind", author: "Patrick Rothfuss" }
  ] 
end