 'entry point of CharacterScreen
function Init()
    m.myMarkupList = m.top.findNode("myMarkupList")
    m.myMarkupList.translation = [150, 70]
    m.myMarkupList.setFocus(true)
    m.myMarkupList.ObserveField("itemSelected", "onCharacterItemSelected")
end function

function onContentChange()
    if isValid(m.top.content)
        content = m.top.content
        m.myMarkupList.content = content
    end if
end function

function OnJumpToItem()
    m.myMarkupList.setFocus(true)
    m.myMarkupList.jumpToItem = m.top.jumpToItem
end function
