require_relative '../pin_authenticator'

module Robin::Actions
  class Authenticate
    def execute(client, output, input)
      output.print instructions(PinAuthenticator.authorize_url)
      pin = input.gets.chomp
      if PinAuthenticator.authenticate(pin)
        output.puts success
      else
        output.puts failed
      end
    end

    def instructions(url)
      instructions = <<EOF 
In order to use Robin you need to authenticate with your Twitter account.
To do this, first, point your browser to the following URL:

#{url}

Log in if required. 
You must now authorize the app and type the given PIN.

PIN >> 
EOF
      instructions.chomp
    end

    def success
      "Great. You can now use Robin."
    end

    def failed
      "Pin was incorrect"
    end
  end
end
