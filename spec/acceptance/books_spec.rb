require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Books' do
  post '/api/books' do
    parameter :title, 'title', scope: :book
    parameter :price, 'price', scope: :book

    example 'success' do
      do_request(book: {title: 'RSpec books', price: 1000})

      expect(status).to eq(200)

      json_body = JSON.parse(response_body)
      expect(json_body['book_id']).to eq(Book.last.id)
    end

    example 'invalid' do
      do_request(book: {title: nil, price: 1000})

      expect(status).to eq(400)

      json_body = JSON.parse(response_body)
      expect(json_body['errors']).to eq("Title can't be blank")
    end
  end
end
