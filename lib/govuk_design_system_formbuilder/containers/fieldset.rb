module GOVUKDesignSystemFormBuilder
  module Containers
    class Fieldset < GOVUKDesignSystemFormBuilder::Base
      LEGEND_DEFAULTS = { text: nil, tag: 'h1', size: 'xl' }.freeze

      # FIXME standardise sizes with labels
      LEGEND_SIZES = %w(xl l m s).freeze

      def initialize(builder, object_name, attribute_name, legend: {}, described_by: nil)
        super(builder, object_name, attribute_name)
        @legend = LEGEND_DEFAULTS.merge(legend)
        @described_by = descriptors(described_by)
      end

      def html
        @builder.content_tag('fieldset', class: fieldset_classes, aria: { describedby: @described_by }) do
          @builder.safe_join([
            build_legend,
            yield
          ])
        end
      end

    private

      def build_legend
        if @legend.dig(:text).present?
          @builder.content_tag('legend', class: legend_classes) do
            @builder.tag.send(@legend.dig(:tag), @legend.dig(:text), class: legend_heading_classes)
          end
        end
      end

      def fieldset_classes
        %w(govuk-fieldset)
      end

      def legend_classes
        size = @legend.dig(:size)
        fail "invalid size #{size}, must be #{LEGEND_SIZES.join(', ')}" unless size.in?(LEGEND_SIZES)

        "govuk-fieldset__legend govuk-fieldset__legend--#{size}"
      end

      def legend_heading_classes
        %(govuk-fieldset__heading)
      end

      def descriptors(described_by)
        return nil unless described_by.present?

        Array.wrap(described_by).reject(&:blank?).join(' ')
      end
    end
  end
end
