require 'rails_helper'

describe 'book' do
  before(:all) do
    Book.destroy_all
  end

  example 'success' do
    params = {
      book: {
        title: 'RSpec books',
        price: 1000
      }
    }

    post '/api/books', params

    expect(status).to eq(200)

    json_body = JSON.parse(response.body)
    expect(json_body['book_id']).to eq(Book.last.id)
  end

  example 'invalid' do
    params = {
      book: {
        title: nil,
        price: 1000
      }
    }

    post '/api/books', params

    expect(status).to eq(400)

    json_body = JSON.parse(response.body)
    expect(json_body['errors']).to eq("Title can't be blank")
  end
end
