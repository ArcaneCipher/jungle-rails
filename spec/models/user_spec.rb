require "rails_helper"

RSpec.describe User, type: :model do
  describe "Validations" do
    subject {
      described_class.new(
        first_name: "John",
        last_name: "Doe",
        email: "john@example.com",
        password: "password",
        password_confirmation: "password"
      )
    }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    # Add similar tests for last_name, email, etc.
    it "is not valid without a last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid when password and password_confirmation do not match" do
      subject.password_confirmation = "differentpassword"
      expect(subject).to_not be_valid
    end

    it "is not valid if the password is too short" do
      subject.password = "123"
      subject.password_confirmation = "123"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end

  describe ".authenticate_with_credentials" do
    before do
      @user = User.create(
        first_name: "Test",
        last_name: "User",
        email: "user@example.com",
        password: "secure123",
        password_confirmation: "secure123"
      )
    end

    it "authenticates with correct credentials" do
      result = User.authenticate_with_credentials("user@example.com", "secure123")
      expect(result).to eq(@user)
    end

    it "authenticates even if email has leading/trailing spaces" do
      result = User.authenticate_with_credentials("  user@example.com  ", "secure123")
      expect(result).to eq(@user)
    end

    it "authenticates even if email has different casing" do
      result = User.authenticate_with_credentials("User@Example.COM", "secure123")
      expect(result).to eq(@user)
    end

    it "returns nil if password is incorrect" do
      result = User.authenticate_with_credentials("user@example.com", "wrongpass")
      expect(result).to be_nil
    end
  end
end
