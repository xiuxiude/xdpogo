require 'open-uri'

def user_url_to_id(url)
  url.split('/').last
end

namespace :douban do
  desc "update group members from XDPOGO group"
  task :update_members => :environment do
    group_id = "xidianPOGO"
    base_url = "http://www.douban.com/group/#{group_id}/members"
    first_doc = Nokogiri::HTML open(base_url)
    last_page_num = first_doc.css('.paginator>a').last.text.to_i
    (0..last_page_num).each do |page_num|
      doc = Nokogiri::HTML(open("#{base_url}?start=#{page_num*35}"))
      doc.css('.obss').last.css('dl.obu dt a').each do |user|
        user_id = user_url_to_id(user["href"])
        user = User.find_with_douban Douban.user(user_id)
        p user
        sleep 0.5
      end
    end

  end
end

