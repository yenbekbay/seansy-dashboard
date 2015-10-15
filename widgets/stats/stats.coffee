class Dashing.Stats extends Dashing.Widget
  ready: ->
    @onData(this)

  onData: (data) ->
    widget = $(@node)
    showtimesCount = @get('showtimes_count')
    moviesCount = @get('movies_count')
    theatresCount = @get('theatres_count')

    widget.find('.showtimesCount').html(showtimesCount + ' showtimes')
    widget.find('.nowPlayingMoviesCount').html('for ' + moviesCount + ' movies')
    widget.find('.theatresCount').html('in ' + theatresCount + ' theatres')
