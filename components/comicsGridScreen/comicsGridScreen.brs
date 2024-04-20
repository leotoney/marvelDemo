' Note that we need to import this file in GridScreen.xml using relative path.
sub Init()
    m.title = m.top.FindNode("title")
    m.posterGrid = m.top.FindNode("posterGrid")
    m.postergrid.translation = [ 160, 100 ]
    m.posterGrid.SetFocus(true)
    m.top.ObserveField("visible", "onVisibleChange")
    m.posterGrid.ObserveField("itemSelected", "OnItemSelected")
end sub

sub onContentChange()
    if isValid(m.top.content)
        screenDim = getScreenDisplaySize()
        xDim = (screenDim.w - m.title.BoundingRect().width) / 2
        m.title.translation = [xDim, 30]
        m.title.visible = true
        content = m.top.content
        childCount = content.getChildCount()
        m.posterGrid.numRows = (childCount/3) + 1
    end if
end sub

sub OnVisibleChange() ' invoked when GridScreen change visibility
    if m.top.visible = true
        m.posterGrid.SetFocus(true) ' set focus to rowList if GridScreen visible
    end if
end sub

' sub OnItemFocused() ' invoked when another item is focused
'     focusedIndex = m.posterGrid.itemFocused ' get position of focused item
'     if focusedIndex >=0
'         item = m.posterGrid.content.GetChild(focusedIndex) ' get all items of row
'     end if
' end sub
