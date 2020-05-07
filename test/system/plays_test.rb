require "application_system_test_case"

class PlaysTest < ApplicationSystemTestCase
  setup do
    @play = plays(:one)
  end

  test "visiting the index" do
    visit plays_url
    assert_selector "h1", text: "Plays"
  end

  test "creating a Play" do
    visit plays_url
    click_on "New Play"

    click_on "Create Play"

    assert_text "Play was successfully created"
    click_on "Back"
  end

  test "updating a Play" do
    visit plays_url
    click_on "Edit", match: :first

    click_on "Update Play"

    assert_text "Play was successfully updated"
    click_on "Back"
  end

  test "destroying a Play" do
    visit plays_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Play was successfully destroyed"
  end
end
