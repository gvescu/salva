class UserGenericwork  < ModelComposedKeys
  set_table_name "user_genericworks"
  set_primary_keys :user_id, :genericwork_id

  validates_presence_of :genericwork_id, :userrole_id
  validates_numericality_of :genericwork_id, :userrole_id
  validates_uniqueness_of :user_id, :genericwork_id, :userrole_id, :message=> "Dato duplicado"
  belongs_to :genericwork
  belongs_to :userrole
end
