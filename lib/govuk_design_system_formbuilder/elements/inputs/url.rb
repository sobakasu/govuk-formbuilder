module GOVUKDesignSystemFormBuilder
  module Elements
    module Inputs
      class URL < Base
        using PrefixableArray

        include Traits::Input
        include Traits::Error
        include Traits::Hint
        include Traits::Label
        include Traits::Supplemental

        def builder_method
          :url_field
        end
      end
    end
  end
end
