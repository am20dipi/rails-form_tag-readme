require 'rails_helper'

describe 'new post' do
  it 'ensures that the form route works with the /new action' do
    visit new_post_path
    expect(page.status_code).to eq(200)
  end
  # this results in a failure saying we do NOT have a new_post_path method. 
  # we need to add ":new " to our routes.rb
  # we also need to create an action 'new' in our PostsController
  

  it 'renders HTML in the /new template' do
    visit new_post_path
    expect(page).to have_content('Post Form')
  end
  # this says we need to create a corresponding view 'new.html.erb'
  # also that we need to create a Post Form; via a form in the view.

  it "displays a new post form that redirects to the index page, which then contains the submitted post's title and description" do
    visit new_post_path
    fill_in 'post_title', with: 'My post title'
    fill_in 'post_description', with: 'My post description'

    click_on 'Submit Post'

    expect(page.current_path).to eq(posts_path)
    expect(page).to have_content('My post title')
    expect(page).to have_content('My post description')
  end
  # this asks for form fields "post_title", "post_description" and a submit button
  # this expects the page to render content
end 


