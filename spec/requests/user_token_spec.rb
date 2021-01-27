# frozen_string_literal: true

require 'rails_helper'
require 'jwt'

RSpec.describe 'User Session', type: :request do

  it 'validates token content' do
    user = FactoryBot.create(
      :user,
      name: 'tester guy',
      email: 'admin@email.com',
      password: 'foobar123',
      password_confirmation: 'foobar123',
      admin: true
    )
    post '/user_token', params: { auth: { email: user.email, password: 'foobar123' } }
    token = JSON.parse(response.body)['jwt']
    decoded = JWT.decode(token, Rails.application.credentials.secret_key_base).first

    # match all attributes declared on to_token_payload method in user model
    expect(decoded['sub']).to eq(user.id)
    expect(decoded['email']).to eq(user.email)
    expect(decoded['name']).to eq(user.name)
    expect(decoded['is_admin']).to eq(user.admin)
  end

end