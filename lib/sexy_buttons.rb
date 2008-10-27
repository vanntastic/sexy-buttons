module Sexy
  
  module Buttons
    
    ICONS_WITH_PATH = Dir.glob(File.join("public/images/icons","*.png"))
    ICONS = ICONS_WITH_PATH.map { |i| i.split("/").last }
    
    # am i carrying the sexy theme too far... maybe i am
    def bring_sexy_back(options={})
      options[:rounded] ||= false
      return options[:rounded] ? stylesheet_link_tag('buttons') : stylesheet_link_tag("buttons-rounded")
    end
    
    # this begins the sexy buttons block, it defaults to using a div tag, 
    # you can of course use any other block level tag
    def sexy_buttons(options={}, &block)
      options[:class] ||= ""
      options[:tag] ||= :div
      options[:class] << " buttons"
      
      tag = options[:tag]
      options.delete :tag
      concat content_tag(tag, capture(&block), options), block.binding
    end
    
    def submit(value='',options={})
      options[:class] ||= "positive"
      options[:type] ||= "submit"
      
      content = image_tag("/images/icons/tick.png") << value
      button = content_tag :button, content, options
    end
    
    
    # this is where all the magic happens, generates all button methods
    # remember that you can pass in the different button classes as being
    # positive, negative or it will default to standard
    ICONS.each do |icon|
      eval <<-END
        def #{icon.split(".").first}_button(value='',path='',options={})
          link_val = image_tag("/images/icons/#{icon}") << value
          link_to(link_val,path,options)
        end
      END
    end
    
    # simply an abstraction of the link_to method to keep up with the theme
    def button(value='',path='',options={}); link_to value, path, options; end
    
  end
  
end