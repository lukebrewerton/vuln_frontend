class CreateDatabase < ActiveRecord::Migration
  def change
    create_table "vuln_sets", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
      t.string "vulntype", null: false
      t.string "displayname", null: false
      t.string "bulletinfamily", null: false
      t.integer "vulncount", default: 0, null: false
      t.boolean "active", default: false, null: false
      t.timestamp "timestamp", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.index ["vulntype"], name: "vulntypeindex", unique: true
    end
  end
end

