class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :front_of_engineer
      t.string :backend_of_engineer
      t.string :serverside_of_engineer
      t.string :application_of_engineer
      t.string :database_of_engineer
      t.string :security_of_engineer
      t.string :your_hope

      t.string :python
      t.string :python_history
      t.string :ruby
      t.string :ruby_history
      t.string :java
      t.string :java_history
      t.string :c_language
      t.string :c_language_history
      t.string :go
      t.string :go_history
      t.string :php
      t.string :php_history
      t.string :javascript
      t.string :javascript_history
      t.string :swift
      t.string :swift_history
      t.string :kotlin
      t.string :kotlin_history

      t.string :other_1
      t.string :other_1_history
      t.string :other_2
      t.string :other_2_history
      t.string :other_3
      t.string :other_3_history

      t.string :full_time_employee
      t.string :full_time_employee_remotely
      t.string :freelance
      t.string :freelance_remotely
      t.string :part_time
      t.string :part_time_remotely
      t.string :period
      t.string :line
      t.string :line_id
      t.timestamps
    end
  end
end
