require 'rails_helper'
require 'capybara/rspec'

describe "the song form", :type => :feature do
  it "creates a song on submit" do
    visit '/songs/new'
    fill_in :song_title, with: 'Little Earthquakes'
    find('input[name="commit"]').click
    expect(Song.last.title).to eq 'Little Earthquakes'
  end

  it "creates a song with an artist" do
    visit '/songs/new'
    fill_in :song_title, with: 'Little Earthquakes'
    fill_in :song_artist_name, with: 'Tori Amos'
    find('input[name="commit"]').click
  end

  it 'creates a song with a genre' do
    visit '/songs/new'
    fill_in :song_title, with: 'Little Earthquakes'
    select 'Alternative', from: 'song_genre_id'
    find('input[name="commit"]').click
  end

  it 'creates a song with notes' do
    visit '/songs/new'
    fill_in :song_title, with: 'Little Earthquakes'
    fill_in :song_notes_1, with: 'great piano'
    fill_in :song_notes_2, with: 'inaccurate seismology'
    find('input[name="commit"]').click
  end
end
