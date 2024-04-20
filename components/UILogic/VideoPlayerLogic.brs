sub ShowVideoScreen(index as integer, content as object)
    m.videoPlayer = CreateObject("roSGNode", "Video") ' create new instance of video node for each playback
    ShowScreen(m.videoPlayer) ' show video screen
    videocontent = createObject("RoSGNode", "ContentNode")
    m.rowIndex = index
    if isValid(content) and isValid(content.name)
        videocontent.title = content.name 
    end if
    videocontent.streamformat = "mp4"
    videocontent.url = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    m.videoPlayer.content = videocontent
    m.videoPlayer.control = "play" ' start playback
    m.videoPlayer.ObserveField("state", "OnVideoPlayerStateChange")
    m.videoPlayer.ObserveField("visible", "OnVideoVisibleChange")
end sub

sub OnVideoPlayerStateChange() ' invoked when video state is changed
    state = m.videoPlayer.state
    ' close video screen in case of error or end of playback
    if state = "error" or state = "finished"
        CloseScreen(m.videoPlayer)
    end if
end sub

sub OnVideoVisibleChange() ' invoked when video node visibility is changed
    if m.videoPlayer.visible = false and m.top.visible
        m.videoPlayer.control = "stop"
        m.videoPlayer.content = invalid
        screen = GetCurrentScreen()
        screen.SetFocus(true)
        'navigate to the last played item
        screen.jumpToItem = m.rowIndex
    end if
end sub