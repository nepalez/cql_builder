# encoding: utf-8

module QueryBuilder::CQL

  module Statements

    # Describes the 'CREATE TABLE' CQL3 statement
    #
    class CreateTable < Base

      include Modifiers::PrimaryKey
      include Modifiers::IfNotExists
      include Modifiers::ClusteringOrder
      include Modifiers::CompactStorage
      include Modifiers::With

      # Adds column to the table
      #
      # @param [#to_s] name
      # @param [#to_s] type_name
      # @param [Hash] options
      # @option options [Boolean] :static
      #
      # @return [QueryBuilder::Statements::CreateTable]
      #
      def column(name, type_name, options = {})
        self << Clauses::Column
          .new(name: name, type_name: type_name, static: options[:static])
      end

      # Builds the statement
      #
      # @return [String]
      #
      def to_s
        cql["CREATE TABLE", maybe_if, context.to_s, maybe_columns, maybe_with]
      end

    end # class CreateTable

  end # module Statements

end # module QueryBuilder::CQL
