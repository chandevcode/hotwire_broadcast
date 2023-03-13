class User < ApplicationRecord
  include ActionView::RecordIdentifier

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  after_create_commit lambda {
                        broadcast_prepend_later_to 'users_list', target: 'users' # , partial
                      }

  after_update_commit lambda {
                        broadcast_replace_later_to 'users_list',
                                                   target: "#{dom_id self}_row"
                      }

  after_destroy_commit lambda {
                         broadcast_remove_later_to 'users_list',
                                                   target: "#{dom_id self}_row"
                       }
end
