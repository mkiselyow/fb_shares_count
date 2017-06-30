class Site < ApplicationRecord
  has_many :pages

  def parse(limit)

    url = "http://www.#{self.domain}"

    main_page = Nokogiri::HTML(open("http://www.#{self.domain}"))

    iteration = 0
    climit = limit.to_i

    parent_page = main_page

    self.level(parent_page, iteration, climit)

  end

  def level(parent_page, iteration, limit)
    hrefs = parent_page.css("a").map  do |link|
      if (href = link.attr("href")) && !href.empty? && (iteration < limit) && !(Page.all.map(&:url).include? URI.parse(link.attr("href")).path)
        iteration += 1
        puts URI.parse(href).path

        page = Page.create(url: URI.parse(href).path, site_id: self.id)

        begin
          file = open("https://graph.facebook.com/?ids=#{href}")
          resp = Nokogiri::HTML(file)

          puts resp
          
          shares_count = resp.search('body').text.rstrip.scan(/\"share_count\":(\d*)/)

          # json = JSON.parse(file.read)
          
          metric = Metric.create(shares: shares_count, date: Time.now, page_id: page.id)

        rescue OpenURI::HTTPError => e
          if e.message == '404 Not Found'
            puts "#{page} not found\r\n"
          end
        end
        parent_page = Nokogiri::HTML(href)
        # binding.pry
        self.level(parent_page, iteration, limit)
      end
    end.compact.uniq
  end



end