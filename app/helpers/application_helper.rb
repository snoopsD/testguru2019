module ApplicationHelper
  def current_year
    Time.zone.now.year
  end

  def github_url(author, repo)
    link = link_to("TestGuru", repo, target: '_blank')
    "#{author} #{link}".html_safe
  end
  
end
