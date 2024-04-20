sub ShowCharacterScreen()
    m.CharacterScreen.ObserveField("itemSelected", "OnCharacterScreenItemSelected")
    ShowScreen(m.CharacterScreen)
end sub

sub OnCharacterScreenItemSelected(event as Object)
    list = event.GetRoSGNode()
    ' extract the indexes of the item the user selected
    selectedIndex = event.GetData()
    Content = list.content.GetChild(selectedIndex)
    ShowVideoScreen(selectedIndex, Content)
end sub
