if Rails.env.development?

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address          =>    'smtp.gmail.com',
  :port             =>    '587',
  :domain           =>    'gmail.com',
  :user_name        =>    "todoappdevisetest@gmail.com",
  :password         =>    "carcassonne",
  :authentication   =>    :plain,
  :enable_starttls_auto => true 
}

elsif Rails.env.production?


ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address                  => 'smtp.sendgrid.net',
  :port                     => '587',
  :authentication           => :plain,
  :user_name                => 'app75154594@heroku.com',
  :password                 => 'qa9ensii5666',
  :domain                   => 'heroku.com',
  :enable_starttls_auto     => true
}

end