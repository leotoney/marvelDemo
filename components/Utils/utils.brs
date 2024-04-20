'Checks the input object is valid
function isValid(value as dynamic) as boolean
    return Type(value) <> "<uninitialized>" AND value <> invalid
end function

'Check the input is non empty array
function isNonEmptyArray(value as dynamic) as boolean
    return isValid(value) AND GetInterface(value, "ifArray") <> invalid AND value.Count() > 0
end function

'return the display size of device
function getScreenDisplaySize() as object
    deviceInfo = CreateObject("roDeviceInfo")
    uiDisplaySize = deviceInfo.GetDisplaySize()
    return uiDisplaySize
end function

' Check string is empty
function isNonEmptyString(value as dynamic) as boolean
    return isValid(value) AND GetInterface(value, "ifString") <> invalid AND value <> ""
end function

' Function to do http request for a URL and return the json
function fetchFromApi(url as String) as Object
    xfer = CreateObject("roURLTransfer")
    xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    xfer.SetURL(url)
    response = xfer.GetToString()
    
    json = ParseJson(response)
    if json <> invalid then
        return json
    else
        return invalid
    end if
end function