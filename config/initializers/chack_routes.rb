routes = Rails.application.routes.routes
define_controller_hsh = routes.map(&:defaults).reject { |hsh| hsh[:controller].to_s.match?(/rails|active/) }
actions = define_controller_hsh.map { |hsh| hsh[:action] }.reject(&:blank?).uniq
raise("not allow action is exist") unless (actions - %w(index update create delete update)).blank?
