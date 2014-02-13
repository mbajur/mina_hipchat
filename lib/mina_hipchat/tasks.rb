# ## Settings
# Any and all of these settings can be overriden in your `deploy.rb`.

# ### hipchat_auth_token
# Sets the hipchat api auth token.
set_default :hipchat_auth_token, ''

# ### hipchat_rooms
# Sets the rooms where notifications will be sent to.
set_default :hipchat_rooms, []

# ### hipchat_from
# Sets the notification 'from' user label
set_default :hipchat_from, 'Deploy'

# ### hipchat_color
# Sets the notification color
set_default :hipchat_colors, {started: 'gray', finished: 'green'}

# ### hipchat_author
# Sets the deployment author name
set_default :hipchat_author, 'Someone'

# ## Control Tasks
namespace :hipchat do

  # ## hipchat:notify_deploy_started
  desc "Send hipchat notification about new deploy start"
  task :notify_deploy_started => :environment do
    queue  %[echo "-----> Sending start notification to HipChat"]
    message = "#{hipchat_author} is deploying #{application}..."

    for room in hipchat_rooms
      queue %[curl -X POST https://api.hipchat.com/v1/rooms/message -d "auth_token=#{hipchat_auth_token}&room_id=#{room}&from=#{hipchat_from}&message=#{message}&color=#{hipchat_colors[:started]}" --silent > /dev/null]
    end
  end

  # ## hipchat:notify_deploy_finished
  desc "Send hipchat notification about deploy finish"
  task :notify_deploy_finished => :environment do
    queue  %[echo "-----> Sending finish notification to HipChat"]
    message = "#{hipchat_author} finished deploying #{application}. See it here: <a href='http://#{domain}'>http://#{domain}</a>"

    for room in hipchat_rooms
      queue %[curl -X POST https://api.hipchat.com/v1/rooms/message -d "auth_token=#{hipchat_auth_token}&room_id=#{room}&from=#{hipchat_from}&message=#{message}&color=#{hipchat_colors[:finished]}&type=html" --silent >/dev/null]
    end
  end

end