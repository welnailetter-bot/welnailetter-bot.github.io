module Jekyll
    # class YouTubeTag < Liquid::Tag
    #   def initialize(tag_name, video_id, tokens)
    #     super
    #     @video_id = video_id.strip
    #   end
  
    #   def render(context)
    #     %{
    #       <div class="youtube-container">
    #         <iframe src="https://www.youtube.com/embed/#{@video_id}" 
    #                 frameborder="0" 
    #                 allowfullscreen
    #                 class="youtube-iframe">
    #         </iframe>
    #       </div>
    #     }
    #   end
    # end

    class AdvancedYouTubeTag < Liquid::Tag
        def initialize(tag_name, input, tokens)
          super
          @input = input.strip
        end
    
        def render(context)
          params = parse_params(@input)
          
          width = params['width'] || '560'
          height = params['height'] || '315'
          start = params['start'] ? "&start=#{params['start']}" : ''
          autoplay = params['autoplay'] == 'true' ? "&autoplay=1&muted=1" : ''
          
          # Use CSS aspect ratio if no custom dimensions
          container_style = ""
          if params['width'] && params['height']
            aspect_ratio = (height.to_f/width.to_f*100).round(2)
            container_style = " style=\"padding-bottom: #{aspect_ratio}%;\""
          end
          
          %{
            <div class="youtube-container"#{container_style}>
              <iframe src="https://www.youtube.com/embed/#{params['id']}?rel=0#{start}#{autoplay}" 
                      width="#{width}"
                      height="#{height}"
                      allowfullscreen
                      class="youtube-iframe"
                      title="YouTube video player">
              </iframe>
            </div>
          }
        end
    
        
        def parse_params(input)
          params = {}
          input.scan(/(\w+):\s*"?([^",]+)"?/) do |key, value|
            params[key] = value.strip
          end
          params
        end
      end
  end
  
#   Liquid::Template.register_tag('youtube', Jekyll::YouTubeTag)
  Liquid::Template.register_tag('youtube_advanced', Jekyll::AdvancedYouTubeTag)