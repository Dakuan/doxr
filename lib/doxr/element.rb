module Doxr
  class Element
    attr_reader :text, :style

    def initialize(node)
      @text = node.inner_text
      style_attribute = node.xpath('pPr').xpath('pStyle')
      @style = style_attribute.any? ? style_attribute.attr('val') : 'default'
    end

    def is_heading?
      /\Aheading/i.match @style
    end
  end
end