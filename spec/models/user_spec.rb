require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to be }

  describe 'check for presence' do

    it 'should not create a user without the email' do
      user1 = User.create(email: "", password: "password")
      expect { User.find(user1.id) }.to raise_error ActiveRecord::RecordNotFound
    end

    it 'should not create a user without the password' do
      user1 = User.create(email: "test@example.com", password: "")
      expect { User.find(user1.id) }.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe 'check for uniqueness' do

    it 'should not create a user with a email already in the database' do
      user1 = User.create(email: "test@example.com", password: "password")
      user2 = User.create(email: "test@example.com", password: "password")
      expect { User.find(user2.id) }.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe 'check for length' do

    it 'should not create a user if the email is too long' do
      user1 = User.create(email: "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS@example.com", password: "password")
      expect { User.find(user1.id) }.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe 'check for format' do
    it 'should not create a user if the email isnt the right format' do
      user1 = User.create(email: "testexamplecom", password: "password")
      user2 = User.create(email: "test@examplecom", password: "password")
      user3 = User.create(email: "testexample.com", password: "password")
      expect { User.find(user1.id) }.to raise_error ActiveRecord::RecordNotFound
      expect { User.find(user2.id) }.to raise_error ActiveRecord::RecordNotFound
      expect { User.find(user3.id) }.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
