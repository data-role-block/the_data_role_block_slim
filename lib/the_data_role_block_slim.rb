require "the_data_role_block_slim/version"

module TheDataRoleBlockSlim
  class Engine < ::Rails::Engine
    initializer 'data-role-block-slim.register' do
      if defined?(Slim::Parser)
        shortcut    = Slim::Parser.options[:shortcut]
        merge_attrs = Slim::Engine.options[:merge_attrs]

        shortcut.try :[]=, '@',  attr: 'data-role'
        shortcut.try :[]=, '@@', attr: 'data-block'

        merge_attrs.try :[]=, 'data-role',  ' '
        merge_attrs.try :[]=, 'data-block', ' '
      end
    end
  end
end
