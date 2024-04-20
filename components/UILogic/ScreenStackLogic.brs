sub InitScreenStack()
    m.screenStack = []
end sub

sub ShowScreen(node as Object)
    ' Take current screen from screen stack but don't delete it
    prev = m.screenStack.Peek()
    if isValid(prev)
        ' Hide current screen if it exist
        prev.visible = false 
    end if
    ' Add new screen to scene
    m.top.AppendChild(node) 
    ' show new screen
    node.visible = true
    node.SetFocus(true)
    ' Add new screen to the screen stack
    m.screenStack.Push(node) 
end sub

sub CloseScreen(node as Object)
    if node = invalid OR (isValid(m.screenStack.Peek()) AND m.screenStack.Peek().IsSameNode(node))
        ' Remove screen from screenStack
        last = m.screenStack.Pop() 
        ' Hide screen
        last.visible = false 
        ' Remove screen from scene
        m.top.RemoveChild(last) 

        ' Take previous screen and make it visible
        prev = m.screenStack.Peek()
        if isValid(prev)
            prev.visible = true
            prev.SetFocus(true)
        end if
    end if
end sub

function GetCurrentScreen()
    return m.screenStack.Peek()
end function