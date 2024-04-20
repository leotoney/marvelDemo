 'Entry point of CharacterScreen
function Init()
    m.myMarkupList = m.top.findNode("myMarkupList")
    m.myMarkupList.setFocus(true)
    m.myMarkupList.ObserveField("itemSelected", "onCharacterItemSelected")
end function

function onContentChange()
    if isValid(m.top.content)
        content = m.top.content
        screenDim = getScreenDisplaySize()
        m.myMarkupList.content = content
        listRect = m.myMarkupList.BoundingRect()
        Xpos = (screenDim.w - listRect.width) / 2
        m.myMarkupList.translation = [Xpos, 100]
    end if
end function

function OnJumpToItem()
    m.myMarkupList.setFocus(true)
    m.myMarkupList.jumpToItem = m.top.jumpToItem
end function
