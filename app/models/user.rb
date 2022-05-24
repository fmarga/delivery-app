class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :shipping_company, optional: true

  after_initialize :set_domain_company
  before_create :set_company

  private

  def set_domain_company
    @domain = email.split('@')[1]
  end

  def set_company
    self.shipping_company = ShippingCompany.find_by(email_domain: @domain)
  end
end
