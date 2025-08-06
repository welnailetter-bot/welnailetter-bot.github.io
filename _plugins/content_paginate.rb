require 'jekyll'

module Jekyll
  class ContentPaginateGenerator < Generator
    safe true
    priority :normal

    def generate(site)
      site.posts.docs.each do |post|
        if post.data['paginate'] && post.data['paginate'] == true
          process_paginated_post(site, post)
        end
      end
    end

    private

    def process_paginated_post(site, post)
      separator = site.config.dig('paginate_content', 'separator') || '--page-break--'
      
      # Use the original content (before Jekyll processing) 
      content = File.read(post.path)
      # Remove YAML front matter
      content = content.split(/^---\s*$/, 3)[2] if content.start_with?('---')
      
      # Split content by separator
      pages = content.split(separator)
      return if pages.length <= 1
      
      # Update original post content to only include first page
      markdown_converter = site.find_converter_instance(Jekyll::Converters::Markdown)
      post.content = markdown_converter.convert(pages[0].strip)
      post.data['paginated'] = true
      post.data['current_page'] = 1
      post.data['total_pages'] = pages.length
      
      # Generate additional pages
      pages.each_with_index do |page_content, index|
        next if index == 0 # Skip first page as it's the original post
        
        create_paginated_page(site, post, page_content.strip, index + 1, pages.length)
      end
    end
    
    def create_paginated_page(site, original_post, content, page_num, total_pages)
      # Create new page using Jekyll's Page class
      paginated_page = Page.new(site, site.source, '', 'index.html')
      
      # Set page data
      paginated_page.data = original_post.data.dup
      
      # Convert markdown to HTML for the paginated content
      markdown_converter = site.find_converter_instance(Jekyll::Converters::Markdown)
      paginated_page.content = markdown_converter.convert(content)
      
      # Update page-specific data
      paginated_page.data['paginated'] = true
      paginated_page.data['current_page'] = page_num
      paginated_page.data['total_pages'] = total_pages
      paginated_page.data['original_url'] = original_post.url
      
      # Generate permalink for this page
      base_url = original_post.url.chomp('/')
      permalink_pattern = site.config.dig('paginate_content', 'permalink') || '/:num/'
      paginated_url = base_url + permalink_pattern.gsub(':num', page_num.to_s)
      
      paginated_page.data['permalink'] = paginated_url
      
      # Add to site pages
      site.pages << paginated_page
    end
  end
  
  # Liquid filters for pagination
  module PaginationFilters
    def paginate_links(post)
      return '' unless post['paginated']
      
      current = post['current_page']
      total = post['total_pages']
      base_url = post['original_url'] || post['url']
      
      links = []
      
      # Previous link
      if current > 1
        prev_url = current == 2 ? base_url : "#{base_url.chomp('/')}/#{current - 1}/"
        links << "<a href=\"#{prev_url}\" class=\"pagination-prev\">← Previous</a>"
      end
      
      # Page numbers
      (1..total).each do |i|
        url = i == 1 ? base_url : "#{base_url.chomp('/')}/#{i}/"
        if i == current
          links << "<span class=\"pagination-current\">#{i}</span>"
        else
          links << "<a href=\"#{url}\" class=\"pagination-num\">#{i}</a>"
        end
      end
      
      # Next link
      if current < total
        next_url = "#{base_url.chomp('/')}/#{current + 1}/"
        links << "<a href=\"#{next_url}\" class=\"pagination-next\">Next →</a>"
      end
      
      "<div class=\"content-pagination\">#{links.join(' ')}</div>"
    end
    
    def is_paginated(post)
      post['paginated'] == true
    end
    
    def current_page(post)
      post['current_page'] || 1
    end
    
    def total_pages(post)
      post['total_pages'] || 1
    end
  end
end

# Register the filters
Liquid::Template.register_filter(Jekyll::PaginationFilters)