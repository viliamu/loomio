angular.module('loomioApp').factory 'NotificationModel', (BaseModel) ->
  class NotificationModel extends BaseModel
    @singular: 'notification'
    @plural: 'notifications'

    relationships: ->
      @belongsTo 'event'
      @belongsTo 'user'

    actor: ->
      @event().actor()

    kind: ->
      @event().kind

    group: ->
      @event().group()

    actionPath: ->
      switch @kind()
        when 'motion_closed', 'motion_closed_by_user' then 'outcome'
        when 'invitation_accepted'                    then @actor().username

    relevantRecord: ->
      @event().relevantRecord()