# frozen_string_literal: true

module Spree
  module Validations
    class DbMaximumLengthValidator < ActiveModel::Validator
      def validate(record)
        field = options[:field]
        limit = record.column_for_attribute(field).limit
        value = record[field]

        return unless value
        return unless limit
        return if value.to_s.length <= limit

        record.errors.add(field, :too_long, count: limit)
      end
    end
  end
end
