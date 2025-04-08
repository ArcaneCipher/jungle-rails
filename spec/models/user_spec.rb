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
  end
end
