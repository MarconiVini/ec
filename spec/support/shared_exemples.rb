require 'spec_helper'

RSpec.shared_examples "a User" do
  it { expect(subject).to validate_presence_of :name }
  it { expect(subject).to validate_presence_of :email }
  it { expect(subject).to validate_uniqueness_of :email }
end