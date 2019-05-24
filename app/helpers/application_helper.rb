module ApplicationHelper
  def current_year
    Time.zone.now.year
  end

  def github_url(author, repo)
    link = link_to("TestGuru", repo, target: '_blank')
    "#{author} #{link}".html_safe
  end

  def flash_class(level)
    case level
      when "notice"
        "alert alert-info"
      when "success" 
        "alert alert-success"
      when "error" 
        "alert alert-error"
      when "alert" 
        "alert alert-error"
    end
  end  
end
