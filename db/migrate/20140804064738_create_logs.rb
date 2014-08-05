class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|

    	t.string 	:location
    	t.time 		:time

    	t.string	:people
    	t.string 	:activity

    	t.string	:ate
    	t.string 	:drink

    	t.boolean	:bing
    	t.string	:vomit_laxative

    	t.string 	:triggers
    	t.string	:thoughts
    	t.string	:emotions

    	t.boolean 	:exercise
    	t.string	:exercise_description
    	t.float		:amount_exercise
    	t.time 		:exercise_time

    	t.integer :user_id

      t.timestamps
    end
  end
end
