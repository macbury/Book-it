xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Read it later"
    xml.link bookmarks_url
    
    for bookmark in @bookmarks
      xml.item do
        xml.title bookmark.url
        xml.description truncate("test", :length => 512)
        xml.pubDate bookmark.created_at.to_s(:rfc822)
        xml.link bookmark_url(bookmark)
        xml.guid bookmark_url(bookmark)
      end
    end


  end
end
