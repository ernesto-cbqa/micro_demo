class Send_Mail
  
  def self.send_email(to, opts={})
    Gmail.new(opts[:email_user], opts[:email_password]) do |gmail|
      gmail.deliver do
        to "#{to}"
        subject "#{opts[:subject]}"
        html_part do
          content_type 'text/html; charset=UTF-8'
          body File.read(opts[:filename])
        end
        add_file opts[:filename]
      end
    end
    
  end
  
end

