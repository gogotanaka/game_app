class Notification < ActiveRecord::Base
  enum kind: [:add, :like, :comment, :follow]
end
