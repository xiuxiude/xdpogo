require 'open-uri'

def user_url_to_id(url)
  url.split('/').last
end

namespace :douban do
  desc "update group members from XDPOGO group"
  task :update_members => :environment do
    base_url = "http://www.douban.com/group/#{GROUP_ID}/members"
    first_doc = Nokogiri::HTML open(base_url)
    last_page_num = first_doc.css('.paginator>a').last.text.to_i
    (0..last_page_num).each do |page_num|
      puts "page num #{page_num}"
      doc = Nokogiri::HTML(open("#{base_url}?start=#{page_num*35}"))
      doc.css('.member-list').last.css('div.name a').each do |user|
        p user
        user_id = user_url_to_id(user["href"])
        user_info = Douban.user(user_id)
        if user_info.msg
          raise "api limit exceed"
        else
          new_user = User.find_with_douban user_info
          p new_user
        end
        sleep 5
      end
    end

  end
end

