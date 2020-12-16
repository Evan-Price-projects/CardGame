# Rails 4.2 call `initialize` inside `recycle!`. However Ruby 2.6 doesn't allow calling `initialize` twice.
# See for detail: https://github.com/rails/rails/issues/34790
if RUBY_VERSION.to_f >= 2.6 && Rails::VERSION::MAJOR == 4
  class ActionController::TestResponse
    prepend Module.new {
      def recycle!
        # hack to avoid MonitorMixin double-initialize error:
        @mon_mutex_owner_object_id = nil
        @mon_mutex = nil
        super
      end
    }
  end
end
#https://github.com/tricknotes/view_source_map/commit/085d1ee54f1e40d1c99ed38567fabde9cd33c62f