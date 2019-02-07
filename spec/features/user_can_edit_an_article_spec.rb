require 'rails_helper'

RSpec.describe 'User can edit an article' do
  describe 'user can link from show page for an article to edit page' do
    describe 'user makes changes in the title or body' do
      it 'should save those edits and redirect to article show page' do
        article = Article.create!(title:"this is a title", body:"this is a body")
        visit article_path(article)

        click_on "Edit"
        expect(current_path).to eq(edit_article_path(article))
        fill_in "article[title]", with: "Edited article title"
        click_on "Update Article"

        expect(current_path).to eq(article_path(article))

        expect(page).to have_content("Edited article title")
        expect(page).to_not have_content("this is a title")

      end
    end
  end

end
