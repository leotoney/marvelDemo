' Run the comic API task
sub RunComicContentTask()
    m.contentTask = CreateObject("roSGNode", "ComicsLoaderTask")
    ' observe content so we can know when feed content will be parsed
    m.contentTask.ObserveField("content", "OnComicContentLoaded")
    m.contentTask.functionName = "getComicList"
    m.contentTask.control = "run"
    m.loadingIndicator.visible = true
end sub

' Invoked when comics content is ready to be used
sub OnComicContentLoaded() 
    if isValid(m.contentTask.content)
        m.comicsGridScreen.SetFocus(true)
        m.loadingIndicator.visible = false
        m.comicsGridScreen.content = m.contentTask.content
        m.contentTask = invalid
    end if
end sub

' Run the comic Character API task
sub RunComicCharacterTask( id as string )
    m.characterTask = CreateObject("roSGNode", "CharactersLoaderTask") 
    m.characterTask.ObserveField("content", "OnComicCharactersLoaded")
    params = {"id":id}
    m.characterTask.requestParams = params
    m.characterTask.functionName = "getCharacterList"
    m.characterTask.control = "run"
    m.loadingIndicator.visible = true
end sub

' Invoked when comics character content is ready to be used
sub OnComicCharactersLoaded()
    if isValid(m.characterTask.content)
        m.CharacterScreen.SetFocus(true)
        m.loadingIndicator.visible = false
        m.CharacterScreen.content = m.characterTask.content
        m.characterTask = invalid
    end if
end sub