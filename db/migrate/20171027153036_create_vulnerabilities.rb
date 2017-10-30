class CreateVulnerabilities < ActiveRecord::Migration[5.1]
  def change
    create_table :vulnerabilities do |t|

      t.timestamps
    end
  end
end
