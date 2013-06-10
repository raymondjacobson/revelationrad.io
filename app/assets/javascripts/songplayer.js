$(document).ready(function() {

    $("#jquery_jplayer_1").jPlayer({
        ready: function(event) {
            $(this).jPlayer("setMedia", {
                mp3: "/system/songs/music_files/000/000/012/original/11_Fragments_of_Time_(feat._Todd_Edwards).mp3?1370756713",
                oga: "http://jplayer.org/audio/ogg/TSP-01-Cro_magnon_man.ogg"
            });
        },
        swfPath: "http://jplayer.org/latest/js",
        supplied: "mp3, oga"
    });
});                                      