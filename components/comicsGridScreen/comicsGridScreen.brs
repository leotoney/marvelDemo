 'Entry point of ComicGridScreen
sub Init()
    m.title = m.top.FindNode("title")
    m.posterGrid = m.top.FindNode("posterGrid")
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
        posterRect = m.postergrid.BoundingRect()
        gridXpos = (screenDim.w - posterRect.width) / 2
        m.postergrid.translation = [gridXpos, 100]
        content = m.top.content
        childCount = content.getChildCount()
        m.posterGrid.numRows = (childCount/3) + 1
    end if
end sub

' Invoked when ComicGridScreen change visibility
sub OnVisibleChange() 
    if m.top.visible = true
        m.posterGrid.SetFocus(true)
    end if
end sub
