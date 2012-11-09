class Thesis < ActiveRecord::Base
  attr_accessible :title, :authors, :user_theses_attributes, :thesismodality_id, :thesisstatus_id, :startyear,
                  :startmonth, :endyear, :endmonth, :career_attributes
  validates_presence_of :thesisstatus_id, :thesismodality_id, :startyear, :authors, :title
  validates_numericality_of :id,:institutioncareer_id, :allow_nil => true, :greater_than => 0, :only_integer => true
  validates_numericality_of :thesisstatus_id, :thesismodality_id, :startyear,  :greater_than => 0, :only_integer => true

  belongs_to :career
  accepts_nested_attributes_for :career

  belongs_to :thesisstatus
  belongs_to :thesismodality
  belongs_to :institutioncareer # FIX IT: Remove this relationship until next release.
                                # We need institutioncareers table to support
                                # migrations from previous versions of salva databases.

  belongs_to :registered_by, :class_name => 'User', :foreign_key => 'registered_by_id'
  belongs_to :modified_by, :class_name => 'User', :foreign_key => 'modified_by_id'

  has_many :user_theses
  has_many :users, :through => :user_theses
  accepts_nested_attributes_for :user_theses
  user_association_methods_for :user_theses

  has_paper_trail

  default_scope :order => 'theses.endyear DESC, theses.startmonth DESC, theses.startyear DESC, theses.endmonth DESC, theses.authors ASC, theses.title ASC'
  scope :user_id_eq, lambda { |user_id| joins(:user_theses).where(:user_theses => { :user_id => user_id }) }

  scope :user_id_not_eq, lambda { |user_id|
    theses_without_user_sql = UserThesis.user_id_not_eq(user_id).to_sql
    theses_with_user_sql = UserThesis.user_id_eq(user_id).to_sql
    sql = "theses.id IN (#{theses_without_user_sql}) AND theses.id NOT IN (#{theses_without_user_sql})"
    where sql
  }

  scope :roleinthesis_id_eq, lambda { |roleinthesis_id| joins(:user_theses).where(:user_theses => { :roleinthesis_id => roleinthesis_id }) }
  scope :finished, where(:thesisstatus_id => 3)
  scope :unfinished, where("thesisstatus_id != 3")

  search_methods :user_id_eq, :user_id_not_eq, :roleinthesis_id_eq

  def as_text
    [users_and_roles, title, career.as_text, date, "#{authors} (estudiante)"].compact.join(', ')
  end

  def users_and_roles
    user_theses.collect {|record| record.as_text }.join(', ')
  end

  def date
    thesisstatus_id == 3 ? end_date : [start_date, end_date].join(', ')
  end
end
