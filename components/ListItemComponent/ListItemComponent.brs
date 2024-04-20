sub init()
    m.characterGroup = m.top.findNode("characterGroup")
    m.poster = m.top.findNode("poster")
    m.poster.failedBitmapUri = "pkg:/images/failedBitmap.jpg"
    m.titleGroup = m.top.findNode("titleGroup")
    m.title = m.top.findNode("title")
    m.description = m.top.findNode("description")
end sub

' Invoked when item metadata retrieved
sub OnContentSet() 
    content = m.top.itemContent
    ' set poster uri if content is valid
    if isValid(content) 
        m.poster.uri = content.url
        m.title.text = content.name
        m.description.text = content.description
    end if
end sub
