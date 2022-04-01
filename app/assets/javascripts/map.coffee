jQuery ->
  window.initMap = ->
    if $('#map').size() > 0
      map = new google.maps.Map document.getElementById('map'), {
        center: {lat: 30.397, lng: 69.644}
        zoom: 5
      }

      map.addListener 'click', (e) ->
        $.ajax '/dashboard/fetch_data',
          type: 'POST'
          dataType: 'json'
          data: { lat: e.latLng.lat(), lng: e.latLng.lng() }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (response) ->
            alert response.data["display_name"]

