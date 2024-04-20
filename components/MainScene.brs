'Entry point of  MainScene
sub Init()
    m.top.backgroundColor = "0x662D91"
    m.top.backgroundUri= "pkg:/images/background_marvel.jpg"
    m.loadingIndicator = m.top.FindNode("loadingIndicator")
    spinner = m.top.FindNode("spinner")
	m.loadingIndicator.poster.uri="pkg:/images/loader.png"
    InitScreenStack()
    ShowGridScreen()
end sub

function OnkeyEvent(key as String, press as Boolean) as Boolean
    result = false
    if press
        if key = "back"
            numberOfScreens = m.screenStack.Count()
            ' close top screen if there are two or more screens in the screen stack
            if numberOfScreens > 1
                CloseScreen(invalid)
                result = true
            end if
        end if
    end if

    return result
end function
