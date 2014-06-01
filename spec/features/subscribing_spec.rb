require 'spec_helper'

feature 'Subscribing' do
  let(:voter_attributes) { attributes_for(:voter) }
  scenario 'With all information' do
    visit root_path

    fill_form :voter, voter_attributes
    click_on submit(:voter)

    # Check that the record was created
    expect(Voter.where(email: voter_attributes[:email])).to exist
  end
end
