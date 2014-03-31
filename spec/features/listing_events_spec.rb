require 'spec_helper'

feature 'event listing' do

  let!(:upcoming_course) { Fabricate(:course) }
  let!(:past_course) { Fabricate(:course, date_and_time: DateTime.new-1.week) }
  let!(:upcoming_session) { Fabricate(:sessions) }
  let!(:past_session) { Fabricate(:sessions, date_and_time: DateTime.new-1.week) }

  before do
    visit events_path
  end

  scenario 'i can view a list with upcoming events' do

    within(".upcoming") do
      expect(page).to have_content "Upcoming"
      expect(page).to have_content upcoming_course.title
      expect(page).to have_content "Workshop"
      expect(page).to have_content I18n.l(upcoming_session.date_and_time, format: :website_format)
    end
  end

  scenario 'i can view a list with past events' do

    within(".past") do
      expect(page).to have_content "Past"
      expect(page).to have_content past_course.title
      expect(page).to have_content "Workshop"
    end
  end
end
