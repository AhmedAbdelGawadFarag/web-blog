class ChangeToNotNull < ActiveRecord::Migration[6.0]
  def change
    # comments in body table is not null
    change_column_null(:comments,:body,false)

    #body and title in posts table is not null
    change_column_null(:posts,:body,false)
    change_column_null(:posts,:title,false)

    #name ,email ,password is not null in users table
    change_column_null(:users,:name,false)
    change_column_null(:users,:email,false)
    change_column_null(:users,:password,false)

  end
end
