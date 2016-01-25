<%@ Control Language="C#"
    AutoEventWireup="true"
    CodeBehind="YouTubeIframe.ascx.cs"
    Inherits="XShare.WebForms.Controls.YoutubeIfreme.YouTubeIframe" %>

<div id="player"></div>

<script type="text/javascript">

    var tag = document.createElement('script');

    tag.src = "https://www.youtube.com/iframe_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

    var player;

    function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
            playerVars: {
                'autoplay': 1,
                'controls': 0,
                'rel': 0,
                'showinfo': 0,
                'modestbranding': 1,
                'iv_load_policy': 3
            },
            events: {
                'onReady': onPlayerReady
            }
        });
    }

    var playerReady = false;

    function onPlayerReady(event) {
        playerReady = true;
    }

    var videoId;
    var videoVolume;
    var videoLoop;
    var videoQuality;

    loadIframe = function (newId, newVolume, loop, vQuality) {

        if (newId != undefined) {
            videoId = newId;
            videoVolume = newVolume | 0;
            videoLoop = loop === 'true' ? true : false;
            videoQuality = vQuality || 'default';
        }

        if (!playerReady) {
            setTimeout(loadIframe, 100);
        } else {
            
            player.loadPlaylist({
                playlist: [videoId],
                index: 0,
                startSeconds: 0,
                suggestedQuality: videoQuality
            });
           
            player.setLoop(videoLoop);
            player.setVolume(videoVolume);
            player.playVideo();
        }
    }

</script>
