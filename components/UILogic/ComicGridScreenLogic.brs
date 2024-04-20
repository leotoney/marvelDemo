sub ShowGridScreen()
    m.comicsGridScreen = CreateObject("roSGNode", "comicsGridScreen")
    m.comicsGridScreen.ObserveField("itemSelected", "OnGridScreenItemSelected")
    RunComicContentTask()
    ' Show ComicGridScreen
    ShowScreen(m.comicsGridScreen) 
end sub

sub OnGridScreenItemSelected(event as Object)
    grid = event.GetRoSGNode()
    ' Store the index of the item the user selected
    m.selectedIndex = event.GetData()
    rowContent = grid.content.GetChild(m.selectedIndex)
    m.CharacterScreen = CreateObject("roSGNode", "CharacterScreen")
    RunComicCharacterTask(rowContent.id)
    ShowCharacterScreen()
end sub