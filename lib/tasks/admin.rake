namespace :admin do
  desc "Adminユーザー作成"

  task :create => :environment do
    admin = Admin.new(
      :email => "admin@idobata.poli",
      :password => "password"
    )
    if admin.save
      p "adminユーザーを作成しました"
    else
      p "admin作成できませぬ"
      admin.errors.full_messages.each {|msg| p msg}
    end
  end
end
