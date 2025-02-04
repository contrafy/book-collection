# spec/features/books_spec.rb

require 'rails_helper'

RSpec.feature "Books", type: :feature do
  let(:valid_date) { Date.today.to_s }

  scenario "User creates a new book successfully" do
    visit root_path
    click_link "New Book"

    fill_in "Title", with: "testbook"
    fill_in "Author", with: "me"
    fill_in "Price", with: 4.20
    select valid_date.split("-")[0], from: "book_published_date_1i"  # year
    select Date::MONTHNAMES[valid_date.split("-")[1].to_i], from: "book_published_date_2i"  # month
    select valid_date.split("-")[2], from: "book_published_date_3i"  # day

    click_button "Create Book"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Book was successfully created.")
    expect(page).to have_content("testbook")
    expect(page).to have_content("me")
    expect(page).to have_content("4.20")
    expect(page).to have_content(valid_date)
  end

  scenario "User fails to create a new book (blank title)" do
    visit root_path
    click_link "New Book"

    fill_in "Title", with: ""
    fill_in "Author", with: "me"
    fill_in "Price", with: 4.20
    select valid_date.split("-")[0], from: "book_published_date_1i"
    select Date::MONTHNAMES[valid_date.split("-")[1].to_i], from: "book_published_date_2i"
    select valid_date.split("-")[2], from: "book_published_date_3i"

    click_button "Create Book"

    expect(page).to have_content("Title can't be blank")
  end

  scenario "User fails to create a new book (blank author)" do
    visit root_path
    click_link "New Book"

    fill_in "Title", with: "testbook"
    fill_in "Author", with: ""
    fill_in "Price", with: 4.20
    select valid_date.split("-")[0], from: "book_published_date_1i"
    select Date::MONTHNAMES[valid_date.split("-")[1].to_i], from: "book_published_date_2i"
    select valid_date.split("-")[2], from: "book_published_date_3i"

    click_button "Create Book"

    expect(page).to have_content("Author can't be blank")
  end

  scenario "User fails to create a new book (blank price)" do
    visit root_path
    click_link "New Book"

    fill_in "Title", with: "testbook"
    fill_in "Author", with: "me"
    fill_in "Price", with: ""
    select valid_date.split("-")[0], from: "book_published_date_1i"
    select Date::MONTHNAMES[valid_date.split("-")[1].to_i], from: "book_published_date_2i"
    select valid_date.split("-")[2], from: "book_published_date_3i"

    click_button "Create Book"

    expect(page).to have_content("Price can't be blank")
    expect(page).to have_content("Price is not a number")
  end

  scenario "User fails to create a new book (blank published date)" do
    visit root_path
    click_link "New Book"

    fill_in "Title", with: "testbook"
    fill_in "Author", with: "me"
    fill_in "Price", with: 4.20

    click_button "Create Book"

    expect(page).to have_content("created")
  end
end

  
