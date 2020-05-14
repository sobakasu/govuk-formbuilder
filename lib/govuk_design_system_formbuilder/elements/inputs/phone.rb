module GOVUKDesignSystemFormBuilder
  module Elements
    module Inputs
      class Phone < Base
        using PrefixableArray

        include Traits::Input
        include Traits::Error
        include Traits::Hint
        include Traits::Label
        include Traits::Supplemental

        def builder_method
          :phone_field
        end
      end
    end
  end
end
