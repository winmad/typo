And /^"([^"]*)" created the article "([^"]*)" with content "([^"]*)"$/ do |user , title , body|
  fill_in("article_title" , :with => title)
  fill_in("article__body_and_extended_editor" , :with => body)
  click_button("Publish")

  article = Article.find_by_title(title)
  article.author = user
end

Given /^I logged out$/ do
  visit '/accounts/logout'
end

And /^I added the comment "([^"]*)" to article "([^"]*)"$/ do |comment , article|
  visit '/'
  click_link(article)

  fill_in("comment_author" , :with => "xx")
  fill_in("comment_email" , :with => "xx@gmail.com")
  fill_in("comment_url" , :with => "xx.xx")
  fill_in("comment_body" , :with => comment)

  click_button("comment")
end

And /^I fill in "([^"]*)" using the id for "([^"]*)"$/ do |field , title|
  article = Article.find_by_title(title)
  id = article.id
  fill_in(field , :with => id)
end

When /^I visit the edit page for article "([^"]*)"$/ do |title|
  article = Article.find_by_title(title)
  id = article.id;
  url = 'admin/content/edit/' + id.to_s()
  visit url
end
