require 'mailjet'
Mailjet.configure do |config|
config.api_key = '774caa82259f0da0dc2b07e9594a810e'
config.secret_key = '1e1ae20d0d32d69c8a362724cb61eb27'
config.api_version = "v3.1"
end
variable = Mailjet::Send.create(messages: [{
  'From'=> {
    'Email'=> 'acastelbou1@gmail.com',
    'Name'=> 'Adrien'
  },
  'To'=> [
    {
      'Email'=> 'acastelbou1@gmail.com',
      'Name'=> 'Adrien'
    }
  ],
  'Subject'=> 'Greetings from Mailjet.',
  'TextPart'=> 'My first Mailjet email',
  'HTMLPart'=> '<h3>Dear passenger 1, welcome to <a href=\'https://www.mailjet.com/\'>Mailjet</a>!</h3><br />May the delivery force be with you!',
  'CustomID' => 'AppGettingStartedTest'
}]
)
p variable.attributes['Messages']
