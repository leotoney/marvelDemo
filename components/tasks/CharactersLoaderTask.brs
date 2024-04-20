sub Init()
    m.basrUrl = "http://gateway.marvel.com/v1/public/comics"
    m.authParams = "?ts=1&apikey=c9403688606a3f03950b4bd928d44c66&hash=40f89a2814113d042de3ffaf441e6c1a"
end sub

sub getCharacterList()
    if isValid(m.top.requestParams) and isValid(m.top.requestParams.id)
        m.basrUrl = m.basrUrl + "/" + m.top.requestParams.id + "/" + "characters"
    end if
    
    json = fetchFromApi(m.basrUrl + m.authParams)

    if isValid(json) and isValid(json.data)
        data = json.data
        resultCount = data.count - 1
        
        if isValid(data.results) and isNonEmptyArray(data.results)
            results = data.results
            content = createObject("roSGNode", "ContentNode")
            for i = 0 to resultCount
                item = results[i]
                if NOT isValid(item.characters)
                    itemcontent = content.createChild("CharacterItemComponentData")
                    itemcontent.url = item.thumbnail.path + ".jpg"
                    itemcontent.name = item.name
                    itemcontent.description = item.description
                    content.appendChild(itemcontent)
                end if
            end for
        end if
        m.top.content = content
    end if
end sub
