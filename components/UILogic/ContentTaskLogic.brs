sub RunComicContentTask()
    m.contentTask = CreateObject("roSGNode", "ComicsLoaderTask")
    ' observe content so we can know when feed content will be parsed
    m.contentTask.ObserveField("content", "OnComicContentLoaded")
    m.contentTask.functionName = "getComicList"
    m.contentTask.control = "run"
    m.loadingIndicator.visible = true
end sub

sub OnComicContentLoaded() ' invoked when content is ready to be used
    if isValid(m.contentTask.content)
        m.comicsGridScreen.SetFocus(true)
        m.loadingIndicator.visible = false
        m.comicsGridScreen.content = m.contentTask.content
        m.contentTask = invalid
    end if
end sub

sub RunComicCharacterTask( id as string )
    m.characterTask = CreateObject("roSGNode", "CharactersLoaderTask") 
    m.characterTask.ObserveField("content", "OnComicCharactersLoaded")
    params = {"id":id}
    m.characterTask.requestParams = params
    m.characterTask.functionName = "getCharacterList"
    m.characterTask.control = "run"
    m.loadingIndicator.visible = true
end sub

sub OnComicCharactersLoaded()
    if isValid(m.characterTask.content)
        m.CharacterScreen.SetFocus(true)
        m.loadingIndicator.visible = false
        m.CharacterScreen.content = m.characterTask.content
        m.characterTask = invalid
    end if
end sub