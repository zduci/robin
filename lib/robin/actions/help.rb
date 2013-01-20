module Robin::Actions
  class Help
    HELP = <<EOF 
Usage:
    [-s]                - Authenticated user's home timeline
    <tweet>, -t <tweet> - New Tweet
    -fr [<user>]        - Followers for the authenticated user or a specific user handle
    -i [<user>]         - The user timeline for the authenticated user or specified user handle
    -h                  - This help message
EOF
    def execute(client, stream)
      stream.puts HELP
    end
  end
end
