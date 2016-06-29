#encoding: utf-8
require "#{File.dirname(__FILE__)}/../../config/environment.rb"
require 'open-uri'
    #헝그리앱
    # page = 3
    # while page
      # begin
        # page = page - 1
        # break if page == 0
        # url = "http://www.hungryapp.co.kr/bbs/list.php?mode=&pid=&kfid=&btype=&bcode=evermarvel&pgcode=&chamidx=&indexss=&catecode=005&page=#{page}"
#         
        # html = open(url).read
        # doc = Nokogiri::HTML(html)
#         
        # tds = doc.css(".tablef")[2].css(".contt")
        # tds.each do |td|
          # title = td.css("font")[1].text
          # title_ary = title.split(" ")
          # title_ary.each do |tit|
            # if tit  =~ /^[A-Z0-9]+$/i
              # is_data = KakaoAccount.find_by_account(tit)
              # KakaoAccount.create(game_id:1, account: tit) unless is_data
            # end
          # end
        # end
#         
      # rescue
      # end
    # end
    
    url = "http://cafe.naver.com/momakakao/ArticleList.nhn?search.clubid=26203446&search.menuid=14&search.boardtype=L"
    
    # html_str = open(url, "r:UTF-8").read
    html = open(url, "r:euc-kr").read
    
    # html_str.force_encoding("euc-kr")
    # html_str.scrub!('?')
    # html = html_str.force_encoding("UTF-8").encode("utf-8", "euc-kr")
    doc = Nokogiri::HTML(html)
    
    titles = doc.css(".article-board.m-tcol-c form table .board-list")
    titles.each do |title|
      title = title.text
      title.delete!("\r\n\t")
      title.strip!
      title_ary = title.split(" ")
      title_ary.each do |tit|
        if tit  =~ /^[A-Z0-9]+$/i
          is_data = KakaoAccount.find_by_account(tit)
          KakaoAccount.create(game_id:1, account: tit) unless is_data
        end
      end
    end
    
    
    
    
    
    
    
    
    
    
