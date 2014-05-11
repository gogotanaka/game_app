class Notification < ActiveRecord::Base
  enum kind: %i(add like comment follow)
end
