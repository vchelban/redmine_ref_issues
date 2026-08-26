# frozen_string_literal: true

module RedmineRefIssues
  VERSION = '1.0.3'

  include RedminePluginKit::PluginBase

  class << self
    def cast_table_field(db_table, db_field)
      if Redmine::Database.postgresql?
        "CAST(#{db_table}.#{db_field} AS TEXT)"
      else
        "#{db_table}.#{db_field}"
      end
    end

    def additionals_help_items
      [{ title: 'Redmine ref_issues macro',
         url: 'https://github.com/alphanodes/redmine_ref_issues#usage',
         id: :ref_issues }]
    end

    def silence_errors?
      Setting.plugin_redmine_ref_issues['silence_errors'].to_s == '1'
    end

    private

    def setup
      # Macros
      loader.load_macros!
    end
  end
end
