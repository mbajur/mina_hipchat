mina_hipchat
============

mina_hipchat is a gem that adds tasks for sending notifications to [Sidekiq] (http://hipchat.com/)
using [Mina] (http://nadarei.co/mina).

## Installation

    gem install mina_hipchat

## Usage example

    require 'mina_hipchat/tasks'
    ...
    # Required mina_hipchat options
    set :hipchat_auth_token, 'xxxyyyzzz'
    set :hipchat_rooms, ['Company']

    task :deploy do
      deploy do
        invoke :'hipchat:notify_deploy_started'
        ...

        to :launch do
          ...
          invoke :'hipchat:notify_deploy_finished'
        end
      end
    end

## Available Tasks

* `hipchat:notify_deploy_started`
* `hipchat:notify_deploy_finished`

## Available Options

| Option                    | Description                                         |
| ------------------------- | --------------------------------------------------- |
| *__hipchat_auth_token__** | Sets the hipchat api auth token.                    |
| *__hipchat_rooms__**      | Sets the rooms where notifications will be sent to. |
| *hipchat_from*            | Sets the notification 'from' user label.            |
| *hipchat_author*          | Sets the deployment author name,                    |
| *hipchat_color*           | Sets the notification color.                        |

__* required options__

## Todo

* Write some tests
* Make code more DRY

## Copyright

Copyright (c) 2014 Mike Bajur http://github.com/mbajur

See LICENSE for further details.
