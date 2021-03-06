keen = require "../keen"

module.exports =
  template: "#t-follow-button"

  props:
    username:
      type: String
      required: true
    initIsFollowing:
      type: Boolean
      required: true
    isSmall:
      type: Boolean
      default: false
    isSignedIn:
      type: Boolean
      default: false

  data: ->
    isFollowing: @initIsFollowing

  computed:
    buttonText: ->
      if @isFollowing then gon.I18n["noun.following"] else gon.I18n["verb.follow"]

  methods:
    toggle: ->
      unless @isSignedIn
        $(".c-sign-up-modal").modal("show")
        keen.trackEvent("sign_up_modals", "open", via: "follow_button")
        return

      if @isFollowing
        $.ajax
          method: "POST"
          url: "/api/internal/follows/unfollow"
          data:
            username: @username
        .done =>
          @isFollowing = false
      else
        $.ajax
          method: "POST"
          url: "/api/internal/follows"
          data:
            username: @username
            page_category: gon.basic.pageCategory
        .done =>
          @isFollowing = true
