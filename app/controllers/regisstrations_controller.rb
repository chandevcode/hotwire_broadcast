class RegistrationsController < Devise::RegistrationsControler
  include ActionView::RecordIdentifier

  def create
    super
    resource.update(online: true)
  end
end
