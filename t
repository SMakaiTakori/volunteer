
[1mFrom:[0m /mnt/c/Users/Makai/dev/flatiron/Projects/VolunteerScraper/volunteer/lib/scraper.rb @ line 19 Volunteer::Scraper.scrape_titles:

     [1;34m8[0m: [32mdef[0m [1;36mself[0m.[1;34mscrape_titles[0m
     [1;34m9[0m:     main_page = [1;34;4mNokogiri[0m::HTML(open([1;34;4mBASE_PATH[0m))
    [1;34m10[0m: 
    [1;34m11[0m:     main_page.css([31m[1;31m"[0m[31mdiv.searchitem.PUBLIC[1;31m"[0m[31m[0m).collect [32mdo[0m |info|
    [1;34m12[0m:         {[33m:title[0m => info.css([31m[1;31m"[0m[31ma.link-body-text.psr_link[1;31m"[0m[31m[0m).text.strip,
    [1;34m13[0m:         [33m:organization[0m => info.css([31m[1;31m"[0m[31mspan.orgid a.psr_link[1;31m"[0m[31m[0m).text.strip,
    [1;34m14[0m:         [33m:learn_more[0m => info.css([31m[1;31m"[0m[31ma[1;31m"[0m[31m[0m).attr([31m[1;31m"[0m[31mhref[1;31m"[0m[31m[0m).value, 
    [1;34m15[0m:         [1;34m# :description => info.css(".searchitem_desc.ellipsis_vert").text.delete("\n" && "33.76182,-84.39453").strip[0m
    [1;34m16[0m:         [1;34m# :address => info.css("div.lower_info span.search_opp_location").text,[0m
    [1;34m17[0m:         [1;34m# :date => info.css("div.oppdate.ym_rwd_show")[0m
    [1;34m18[0m:         }     
 => [1;34m19[0m:         binding.pry                              
    [1;34m20[0m:     [32mend[0m   
    [1;34m21[0m: [32mend[0m 

